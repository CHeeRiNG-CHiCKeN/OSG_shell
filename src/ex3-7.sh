#!/bin/bash

while true; do
    echo ""
    echo "===================="
    echo "시스템 상태 확인"
    echo "===================="
    echo "1) 사용자 정보"
    echo "2) CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "===================="
    echo -n "선택: "
    read choice
    
    case $choice in
        1)
            echo ""
            echo "=== 사용자 정보 ==="
            echo "현재 사용자: $(whoami)"
            echo "로그인 사용자 목록:"
            who
            echo ""
            echo "사용자 ID 정보:"
            id
            ;;
        2)
            echo ""
            echo "=== CPU 사용률 ==="
            # top 명령어를 1회만 실행
            top -bn1 | head -20
            ;;
        3)
            echo ""
            echo "=== 메모리 사용량 ==="
            free -h
            echo ""
            echo "상세 정보:"
            cat /proc/meminfo | head -10
            ;;
        4)
            echo ""
            echo "=== 디스크 사용량 ==="
            df -h
            echo ""
            echo "현재 디렉토리 사용량:"
            du -sh * 2>/dev/null | sort -h
            ;;
        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "1-5 사이의 번호를 입력하세요."
            ;;
    esac
    
    echo ""
    read -p "계속하려면 Enter를 누르세요..."
done

