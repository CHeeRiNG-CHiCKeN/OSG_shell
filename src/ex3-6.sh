#!/bin/bash

# Python 프로그램 실행
if [ $# -lt 2 ]; then
    echo "사용법: $0 <인자1> <인자2> [인자3 ...]"
    echo "예시: $0 hello world 123"
    exit 1
fi

echo "=== 셸 스크립트에서 Python 프로그램 실행 ==="
echo "전달할 인자들: $@"
echo ""

python3 test_program.py "$@"
