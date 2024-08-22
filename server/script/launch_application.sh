#!/bin/bash
DEPLOY_ID=$1
DEPLOY_PROFILE=$2

if [ -z "$DEPLOY_ID" ]; then
		echo "  [!] 배포 ID가 없습니다. 프로세스를 종료합니다."
		exit
fi

if [ -z "$DEPLOY_PROFILE" ]; then
    echo "  [!] 배포 프로파일이 지정되지 않아 기본값을 할당합니다."
    echo "    - DEPLOY_PROFILE: prod"
fi

echo "> 배포 시작 [배포 ID: $DEPLOY_ID]"

CURRENT_PID=$(pgrep -f .jar)

if [ -n "$CURRENT_PID" ]; then
		echo "  > 현재 서버[PID:$CURRENT_PID] 가 실행 중입니다."
		kill -9 "$CURRENT_PID"
		echo "  > 서버 프로세스[PID:$CURRENT_PID]를 성공적으로 종료했습니다."
fi

DEPLOY_PATH="deploy/$DEPLOY_ID"
JAR_PATH=$(ls -tr "$DEPLOY_PATH"/*.jar | tail -n 1)
echo "  > 새 애플리케이션을 배포합니다. [JAR: $JAR_PATH]"

mkdir -p "$DEPLOY_PATH"/log

nohup java -jar "$JAR_PATH" --spring.profiles.active="$DEPLOY_PROFILE" --logging.file.name="$DEPLOY_PATH/log/application.log" >> "$DEPLOY_PATH/log/deploy.log" 2> "$DEPLOY_PATH/log/deploy_error.log" &
echo "  > 새로운 서버 배포가 완료되었습니다."