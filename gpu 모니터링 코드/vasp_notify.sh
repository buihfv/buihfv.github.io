#!/bin/bash
# vasp_notify.sh
# 계산 완료 시 (1) 텔레그램 알림 + (2) Google Sheets에 상세 로그 기록
# 사용법: vasp_notify.sh <계산_디렉토리> [작업_라벨]

set -uo pipefail

TELEGRAM_BOT_TOKEN="8704620873:AAH0B7Q69XWrRASLzFR-ebmUtUEXU2-nTs8"
TELEGRAM_CHAT_ID="8607875527"
GSHEET_URL="https://script.google.com/macros/s/AKfycbydmRQY5Vo9m7ap1yUm8wHTYiT_NaKPRtFTqEmwNBAe--XqVVVfff3L_qrHtO1ILw7yog/exec"
HOSTNAME_TAG=$(hostname)

CALC_DIR="${1:-$(pwd)}"
JOB_LABEL="${2:-$(basename "$CALC_DIR")}"

OUTCAR="$CALC_DIR/OUTCAR"
INCAR="$CALC_DIR/INCAR"
POSCAR="$CALC_DIR/POSCAR"
KPOINTS_FILE="$CALC_DIR/KPOINTS"

echo "[vasp_notify] 시작. 대상 폴더: $CALC_DIR"

# ===== 1. 수렴 여부 =====
if [[ -f "$OUTCAR" ]] && grep -q "reached required accuracy" "$OUTCAR" 2>/dev/null; then
    CONVERGED="O"
else
    CONVERGED="X"
fi

# ===== 2. 총 계산 시간 (초 단위 확보, Start/End Time 계산에도 사용) =====
CALC_TIME="확인불가"
ELAPSED_SEC=""
if [[ -f "$OUTCAR" ]]; then
    ELAPSED_SEC=$(grep "Elapsed time (sec):" "$OUTCAR" 2>/dev/null | tail -1 | awk '{print $NF}') || true
    if [[ -n "${ELAPSED_SEC:-}" ]]; then
        ELAPSED_H=$(awk -v s="$ELAPSED_SEC" 'BEGIN{printf "%.1f", s/3600}')
        CALC_TIME="${ELAPSED_H} hr (${ELAPSED_SEC} sec)"
    fi
fi

# ===== 3. Start Time / End Time =====
NOW_EPOCH=$(date +%s)
END_TIME=$(date -d "@${NOW_EPOCH}" "+%Y-%m-%d %H:%M:%S")
START_TIME="확인불가"
if [[ -n "${ELAPSED_SEC:-}" ]]; then
    ELAPSED_INT=${ELAPSED_SEC%%.*}
    if [[ "$ELAPSED_INT" =~ ^[0-9]+$ ]]; then
        START_EPOCH=$(( NOW_EPOCH - ELAPSED_INT ))
        START_TIME=$(date -d "@${START_EPOCH}" "+%Y-%m-%d %H:%M:%S")
    fi
fi

# ===== 4. 정상 종료 여부 =====
if [[ -f "$OUTCAR" ]] && grep -q "General timing and accounting" "$OUTCAR" 2>/dev/null; then
    CLEAN_EXIT="정상 종료"
else
    CLEAN_EXIT="비정상 종료 의심"
fi

# ===== 5. 이온 스텝 / NSW =====
STEPS_DONE=0
if [[ -f "$OUTCAR" ]]; then
    STEPS_DONE=$(grep -c "free  energy   TOTEN" "$OUTCAR" 2>/dev/null) || STEPS_DONE=0
fi
NSW_SET="확인불가"
if [[ -f "$INCAR" ]]; then
    NSW_SET=$(grep -iE "^[[:space:]]*NSW" "$INCAR" 2>/dev/null | head -1 | sed -E 's/.*=[[:space:]]*([0-9]+).*/\1/') || true
    [[ -z "$NSW_SET" ]] && NSW_SET="확인불가"
fi
NSW_INFO="${STEPS_DONE} / ${NSW_SET}"

# ===== 6. 마지막 최대 힘 (TOTAL-FORCE 테이블 직접 파싱, IBRION 무관하게 동작) / EDIFFG =====
MAXFORCE="N/A"
if [[ -f "$OUTCAR" ]]; then
    MAXFORCE=$(awk '
        /TOTAL-FORCE/ { in_block=1; maxf=0; found=1; getline; next }
        in_block && /^ *-+$/ { in_block=0; next }
        in_block && NF>=6 {
            fx=$4; fy=$5; fz=$6
            mag = sqrt(fx*fx+fy*fy+fz*fz)
            if (mag>maxf) maxf=mag
        }
        END { if (found) printf "%.6f", maxf }
    ' "$OUTCAR" 2>/dev/null) || true
    [[ -z "$MAXFORCE" ]] && MAXFORCE="N/A"
fi
EDIFFG_SET="확인불가"
if [[ -f "$INCAR" ]]; then
    EDIFFG_SET=$(grep -iE "^[[:space:]]*EDIFFG" "$INCAR" 2>/dev/null | head -1 | sed -E 's/.*=[[:space:]]*(-?[0-9.]+).*/\1/' | tr -d '-') || true
    [[ -z "$EDIFFG_SET" ]] && EDIFFG_SET="확인불가"
fi
EDIFFG_INFO="${MAXFORCE} / ${EDIFFG_SET}"

# ===== 7. Warning / Error =====
WARN_ERR="없음"
if [[ -f "$OUTCAR" ]]; then
    TMP_WARN=$(grep -iE "warning|error" "$OUTCAR" 2>/dev/null | sort -u | head -5) || true
    [[ -n "$TMP_WARN" ]] && WARN_ERR="$TMP_WARN"
fi

# ===== 8. 구성 정보 (POSCAR 6, 7번째 줄) =====
COMPOSITION="확인불가"
if [[ -f "$POSCAR" ]]; then
    ELEMENTS=$(sed -n '6p' "$POSCAR" 2>/dev/null)
    COUNTS=$(sed -n '7p' "$POSCAR" 2>/dev/null)
    if [[ -n "$ELEMENTS" && -n "$COUNTS" ]]; then
        COMPOSITION=$(paste -d: <(echo "$ELEMENTS" | tr -s ' ' '\n') <(echo "$COUNTS" | tr -s ' ' '\n') \
            | grep -v '^:$' | grep -v '^:' | sed '/^$/d' | paste -sd ',' - | sed 's/,/, /g') || true
        [[ -z "$COMPOSITION" ]] && COMPOSITION="확인불가"
    fi
fi

# ===== 9. Energy (energy(sigma->0)) =====
ENERGY="확인불가"
if [[ -f "$OUTCAR" ]]; then
    ENERGY_RAW=$(grep "energy(sigma->0)" "$OUTCAR" 2>/dev/null | tail -1 | awk '{print $NF}') || true
    [[ -n "$ENERGY_RAW" ]] && ENERGY="${ENERGY_RAW} eV"
fi

# ===== 10. ENCUT =====
ENCUT="확인불가"
if [[ -f "$INCAR" ]]; then
    ENCUT=$(grep -iE "^[[:space:]]*ENCUT" "$INCAR" 2>/dev/null | head -1 | sed -E 's/.*=[[:space:]]*([0-9.]+).*/\1/') || true
    [[ -z "$ENCUT" ]] && ENCUT="확인불가"
fi

# ===== 11. Functional =====
FUNCTIONAL="default(PBE 추정)"
if [[ -f "$INCAR" ]]; then
    METAGGA_VAL=$(grep -iE "^[[:space:]]*METAGGA" "$INCAR" 2>/dev/null | head -1 | sed -E 's/.*=[[:space:]]*([A-Za-z0-9]+).*/\1/') || true
    GGA_VAL=$(grep -iE "^[[:space:]]*GGA[[:space:]]*=" "$INCAR" 2>/dev/null | head -1 | sed -E 's/.*=[[:space:]]*([A-Za-z0-9]+).*/\1/') || true
    if [[ -n "$METAGGA_VAL" && "$METAGGA_VAL" != "NONE" ]]; then
        FUNCTIONAL="METAGGA:${METAGGA_VAL}"
    elif [[ -n "$GGA_VAL" ]]; then
        FUNCTIONAL="GGA:${GGA_VAL}"
    fi
fi

# ===== 12. ISIF =====
ISIF="확인불가"
if [[ -f "$INCAR" ]]; then
    ISIF=$(grep -iE "^[[:space:]]*ISIF" "$INCAR" 2>/dev/null | head -1 | sed -E 's/.*=[[:space:]]*([0-9]+).*/\1/') || true
    [[ -z "$ISIF" ]] && ISIF="확인불가"
fi

# ===== 13. KPOINTS =====
KPOINTS_INFO="확인불가"
if [[ -f "$KPOINTS_FILE" ]]; then
    KTYPE_LINE=$(sed -n '3p' "$KPOINTS_FILE" 2>/dev/null)
    KMESH_LINE=$(sed -n '4p' "$KPOINTS_FILE" 2>/dev/null)
    if [[ -n "$KTYPE_LINE" && -n "$KMESH_LINE" ]]; then
        if [[ "$KTYPE_LINE" =~ ^[Gg] ]]; then
            KTAG="G"
        elif [[ "$KTYPE_LINE" =~ ^[Mm] ]]; then
            KTAG="M"
        else
            KTAG="?"
        fi
        MESH=$(echo "$KMESH_LINE" | awk '{print $1"x"$2"x"$3}')
        KPOINTS_INFO="${MESH} (${KTAG})"
    fi
fi

# ===== 이모지 =====
if [[ "$CONVERGED" == "O" ]]; then
    EMOJI="✅"
elif [[ "$CLEAN_EXIT" == "정상 종료" ]]; then
    EMOJI="⚠️"
else
    EMOJI="❌"
fi

echo "[vasp_notify] 정보 수집 완료. 전송 시작..."

# ===== 텔레그램 전송 =====
MESSAGE="${EMOJI} [${HOSTNAME_TAG}] Job: ${JOB_LABEL}

Start Time: ${START_TIME}
End Time: ${END_TIME}
수렴(reached required accuracy): ${CONVERGED}
종료 상태: ${CLEAN_EXIT}
NSW: ${NSW_INFO}
EDIFFG: ${EDIFFG_INFO}
total calculation time: ${CALC_TIME}
구성: ${COMPOSITION}
Energy: ${ENERGY}
ENCUT: ${ENCUT}
Functional: ${FUNCTIONAL}
ISIF: ${ISIF}
KPOINTS: ${KPOINTS_INFO}

[Warning/Error]
${WARN_ERR}

경로: ${CALC_DIR}"

TG_RESULT=$(curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${TELEGRAM_CHAT_ID}" \
    --data-urlencode "text=${MESSAGE}")
echo "[vasp_notify] 텔레그램 응답: ${TG_RESULT}"

# ===== Google Sheets 로깅 =====
esc() { printf '%s' "$1" | sed 's/"/\\"/g'; }

JSON_PAYLOAD=$(cat <<EOF
{
  "starttime": "$(esc "$START_TIME")",
  "endtime": "$(esc "$END_TIME")",
  "hostname": "$(esc "$HOSTNAME_TAG")",
  "jobname": "$(esc "$JOB_LABEL")",
  "composition": "$(esc "$COMPOSITION")",
  "path": "$(esc "$CALC_DIR")",
  "converged": "$(esc "$CONVERGED")",
  "nsw": "$(esc "$NSW_INFO")",
  "calctime": "$(esc "$CALC_TIME")",
  "energy": "$(esc "$ENERGY")",
  "functional": "$(esc "$FUNCTIONAL")",
  "kpoints": "$(esc "$KPOINTS_INFO")",
  "ediffg": "$(esc "$EDIFFG_INFO")",
  "encut": "$(esc "$ENCUT")",
  "isif": "$(esc "$ISIF")"
}
EOF
)

GS_RESULT=$(curl -s -X POST -H "Content-Type: application/json" \
    -d "${JSON_PAYLOAD}" \
    "${GSHEET_URL}")
echo "[vasp_notify] Google Sheets 응답: ${GS_RESULT}"

echo "[vasp_notify] 완료: CONVERGED=${CONVERGED}"