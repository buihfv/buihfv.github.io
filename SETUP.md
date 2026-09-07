

## 2. GitHub 리포 만들고 올리기

`buihfv/buihfv.github.io` 리포가 아직 없어. GitHub에서 **빈 리포**로 새로 만든 다음:

```powershell
cd "$HOME\Desktop\github.io"
git init -b main
git add -A
git commit -m "Initial commit: al-folio personal site"
git remote add origin https://github.com/buihfv/buihfv.github.io.git
git push -u origin main
```

그다음 리포 **Settings → Pages → Source: Deploy from a branch → `gh-pages` / `(root)`**.
`.github/workflows/deploy.yml`이 push마다 빌드해서 `gh-pages` 브랜치로 올려줌.
(템플릿 유지보수용 워크플로 20여 개는 미리 지워놨고 `deploy.yml`만 남겼음.)

## 3. 로컬 미리보기

```powershell
bundle install
bundle exec jekyll serve
# http://localhost:4000
```

## 4. 아직 채울 것

```powershell
Select-String -Path _config.yml,_data\*.yml,_pages\*.md,_projects\*.md -Pattern "TODO_"
```

- `_data/socials.yml` — Google Scholar 프로필 만들고 `user=` 값, LinkedIn 영문 slug, ORCID
- `_data/cv.yml` — 전공 과목, ZnON 논문 저자 목록, 실험 장비, TOEFL 점수, 드론 프로젝트 시작 시점
- `_projects/1_robot_arm.md`, `_projects/2_wildfire_drone.md` — 역할/팀 규모/GitHub·데모 링크/결과 수치
- 이미지 교체 (지금은 전부 템플릿 샘플 사진):
  - `assets/img/prof_pic.jpg` — 정방형 프로필 사진
  - `assets/img/research_llzo_interface.jpg`, `research_znon.jpg`, `research_mlip.jpg`
  - `assets/img/project_robot_arm.jpg`, `project_wildfire_drone.jpg`
- `assets/pdf/cv.pdf` — 지금은 템플릿 샘플 PDF. CV_v7.docx를 PDF로 내보내서 덮어쓰기

## 5. 구조 메모 (al-folio v1.x)

- thin starter라서 layouts/includes/Sass는 전부 gem(`al_folio_core`, `al_folio_cv` 등)에 있음. 리포엔 없음.
- 소셜 링크는 `_config.yml`이 아니라 **`_data/socials.yml`** (jekyll-socials).
- 웹 CV는 `_data/cv.yml`의 **rendercv 포맷** (`cv: name/label/sections`).
- `Gemfile`과 `_config.yml`의 plugins 목록은 둘 다 맞아야 동작함. 한쪽만 있으면 조용히 무시됨.
- `_data/cv.yml`에 `Research Experience` / `Technical Projects` / `Awards and Scholarships` /
  `Leadership and Activities` 같은 커스텀 섹션명을 썼음. rendercv는 필드 모양으로 타입을 추론하니
  정상 렌더될 것으로 보이는데, 첫 빌드 때 CV 페이지 한 번 확인해줘.
