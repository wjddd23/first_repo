

#!/bin/bash

git init

# 현재 디렉토리에 있는 모든 파일에 touch 명령어 실행
touch *

# Git에 모든 파일 추가
git add .

# 커밋 메시지를 사용자에게 받아오기
read -p "커밋 메시지를 입력하세요: " commit_message

# Git에 커밋 메시지와 함께 커밋
git commit -m "$commit_message"

# Git에 푸시
git push

# git에서 지우고 나서 이상한 오류뜨면 입력하는 것
# git push -f

