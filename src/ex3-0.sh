#!/bin/bash

# .bashrc 파일에 환경변수 추가
echo 'export MYENV="Hello Shell"' >> ~/.bashrc

# 현재 세션에도 적용
export MYENV="Hello Shell"

echo "=== 환경변수 설정 확인 ==="
echo "MYENV 값: $MYENV"

# 새 셸에서도 확인
bash -c 'echo "새 셸에서 MYENV: $MYENV"'

echo ""
echo "=== 환경변수 해제 ==="
unset MYENV
echo "해제 후 MYENV 값: $MYENV"

# .bashrc에서 제거 (선택사항)
sed -i '/export MYENV="Hello Shell"/d' ~/.bashrc
