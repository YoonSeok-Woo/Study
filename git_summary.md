# Git Summary



### Git 이란?

- (분산형) 버전 관리 프로그램
- CLI환경에서 다루는게 편함(GUI환경에서도 사용 가능)(개인 취향일수도)
- 서버와 유저들 모두에게 버전이 저장되며, 각 버전별 변경사항만을 기록

### git 주요 개념

- repository - .git 디렉토리(버전저장소)(삭제 시 버전 증발)
- commit - 버전 별 프로그램의 모습

### git의 흐름

1. 파일 수정 또는 추가 또는 삭제
2. 커밋할 목록(stage)에 추가 `git add`
3. 커밋에 쌓기 - `git commit`
4. 서버에 업로드 - `git push` 

### git 파일라이프 사이클

* Working Directory의 모든 파일은 각 단계별 특정 상태를 가짐
* Tracked
  * unmodified - 수정 전
  * modified - 수정 후
  * staged - 무대에 올라와 있는

* Untracked - 무대에 올라온 적이 없는
* `git status` 로 확인

![untracked example](C:\Users\YoonSeok\Desktop\TIL\git_status_Untracked.PNG)

###  git 커맨드라인

* `git add "경로"` 경로를 스테이지에 추가
* `git commit -m "커밋 이름"` 현재 버전을 커밋에 추가
* `git log` 로그 확인(버전들 수정한사람, 버전명 등등)
* `git status` 상태 확인(변경되어 있다면 붉은색으로 표시)
* `git restore --staged "경로"` 해당 경로를 스테이지에서 내림
* `git remote add origin 링크` 사실 깃헙에서 커맨드 복사해오면됨 일단 깃헙 리포지토리 업로드
* `git push --set-upstream origin master` upstream branch 생성
* `git push` 변경 후 업데이트할 때
* `git pull` 변경된 것 다운받을 때
* `git clone 링크` 나한테 없는 깃을 다운받을 때 