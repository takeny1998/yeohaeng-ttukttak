#!/bin/bash
SCRIPT_PATH=$(dirname "$0")
DEPLOY_ID=$(uuidgen)

echo "[$DEPLOY_ID] JAR 파일을 빌드합니다."
./gradlew clean build -x test

DEPLOY_PATH="deploy/$DEPLOY_ID"

echo "[$DEPLOY_ID] 원격 서버에 대상 폴더를 생성합니다."
echo "  > DEPLOY_PATH: $DEPLOY_PATH"
ssh bastion mkdir -p "$DEPLOY_PATH"
printf "\n\n"

JAR_PATH=$(ls -tr "$SCRIPT_PATH"/../build/libs/*.jar | tail -n 1)

echo "[$DEPLOY_ID] JAR 파일 전송을 시작합니다."
echo "  > JAR_PATH: $JAR_PATH"
echo "  > DEPLOY_PATH: $DEPLOY_PATH"
scp "$JAR_PATH" bastion:"$DEPLOY_PATH"
printf "\n\n"

echo "[$DEPLOY_ID] 새로운 서버 배포를 시작합니다."
ssh bastion "bash -s" < "$SCRIPT_PATH"/launch_application.sh "$DEPLOY_ID"
printf "\n\n"

echo "[$DEPLOY_ID] 성공적으로 배포가 완료되었습니다."