# 사이트 메모

## 배포
```powershell
cd "$HOME\Desktop\github.io"
git add -A
git commit -m "메시지"
git push
```
push → Actions "Deploy site" → gh-pages → https://buihfv.github.io/ (2~3분)

## 로컬 미리보기 (선택)
Ruby+Devkit 3.3 / ImageMagick 설치 후:
```powershell
gem install bundler -v 4.0.6
bundle install
bundle exec jekyll serve   # http://localhost:4000
```

## 이 사이트가 gem 기본값을 덮어쓰는 파일 (local overrides)
al-folio v1.x는 thin starter라 레이아웃·스타일이 전부 gem에 있음.
아래 4개는 gem 원본을 복사해서 수정한 것이라, **테마 업데이트가 이 파일들은 안 건드림.**
`bundle exec al-folio upgrade overrides audit`로 원본과의 차이를 확인할 수 있음.

| 파일 | 원본 대비 바뀐 것 |
|---|---|
| `_layouts/about.liquid` | 홈 2단 마스트헤드(사진 \| 이름·연락처·아이콘·학력) + News 포맷을 MM/YYYY로 |
| `_includes/header.liquid` | 홈에서도 네비바에 이름이 나오도록 브랜드 조건 해제 (한 줄) |
| `_sass/_variables.scss` | `$purple-color` → 와인 `#7a2e2e`, `$cyan-color` → `#c98a8a`, 본문 폭 1000px |
| `_sass/_typography.scss` | 원본 그대로 + 파일 하단에 이 사이트 전용 CSS (Times New Roman, 와인 네비바, 마스트헤드, News, Research 블록, 카드) |

## 디자인 결정
- 폰트: Times New Roman (폴백 Times / Liberation Serif / Nimbus Roman / Tinos)
- 액센트: 와인 `#7a2e2e` — 네비바 배경, 섹션 제목, 링크
- 다크모드 **끔** (`enable_darkmode: false`) — 라이트 단일 테마로 확정
- `footer_fixed: false` — 하단 고정 푸터가 본문을 가려서 해제
- 프로필 사진은 원본 비율 유지 (정사각 크롭 안 함)

## 홈 내용 고치는 법
전부 `_pages/about.md` 프론트매터에서:
- `profile.affiliation` — 사진 오른쪽 소속 3줄
- `profile.email` — 이메일 + 메일 아이콘
- `profile.vitae` — 연구생/학사 블록. 항목 추가하면 그대로 늘어남 (`icon`은 Font Awesome 클래스)
- `announcements.limit` — News 표시 개수
News 항목은 `_news/announcement_*.md`, `inline: true`로 한 줄씩.

## 남은 TODO
`Select-String -Path _data\*.yml,_projects\*.md -Pattern "TODO_"`
- `_data/cv.yml` — ZnON 논문 저자 목록, 실험 장비, TOEFL 점수/응시일, 드론 프로젝트 시작 시점
- `_projects/*.md` — 역할, 팀 규모, GitHub·데모 링크, 결과 수치
- 이미지 5장: `assets/img/research_llzo_interface.jpg`, `research_znon.jpg`, `research_mlip.jpg`, `project_robot_arm.jpg`, `project_wildfire_drone.jpg` (지금 전부 템플릿 샘플 사진)
- Google Scholar 프로필 만들고 `_data/socials.yml`의 `scholar_userid` 주석 해제
- LinkedIn 공개 URL을 영문 slug로 변경 후 `_data/socials.yml` 갱신
