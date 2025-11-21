#!/bin/bash

# 내부 함수 정의
run_command() {
    local cmd="ls"
    local options="$@"
    
    echo "=== 명령어 실행: $cmd $options ==="
    eval "$cmd $options"
}

# 메인 실행
if [ $# -eq 0 ]; then
    echo "사용법: $0 [ls 옵션]"
    echo "예시: $0 -la"
    echo ""
    echo "옵션 없이 실행:"
    run_command
else
    echo "입력된 옵션: $@"
    run_command "$@"
fi
