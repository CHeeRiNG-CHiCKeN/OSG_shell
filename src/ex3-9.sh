#!/bin/bash

DB_FILE="DB.txt"

# DB 파일이 없으면 생성
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

while true; do
    echo ""
    echo "===================="
    echo "팀원 관리 시스템"
    echo "===================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "===================="
    echo -n "선택: "
    read choice
    
    case $choice in
        1)
            echo ""
            echo "=== 팀원 정보 추가 ==="
            echo -n "이름: "
            read name
            echo -n "생일 (YYYY-MM-DD): "
            read birthday
            echo -n "전화번호: "
            read phone
            
            echo "[MEMBER]|$name|$birthday|$phone|$(date +%Y-%m-%d)" >> "$DB_FILE"
            echo "팀원 정보가 추가되었습니다."
            ;;
        2)
            echo ""
            echo "=== 팀원과 한 일 기록 ==="
            echo -n "날짜 (YYYY-MM-DD): "
            read date
            echo -n "팀원 이름: "
            read name
            echo -n "수행 내용: "
            read content
            
            echo "[WORK]|$date|$name|$content" >> "$DB_FILE"
            echo "수행 내용이 기록되었습니다."
            ;;
        3)
            echo ""
            echo "=== 팀원 검색 ==="
            echo -n "검색할 이름: "
            read search_name
            
            echo ""
            echo "검색 결과:"
            found=0
            while IFS='|' read -r type name birthday phone date; do
                if [[ $type == "[MEMBER]" && $name == *"$search_name"* ]]; then
                    echo "-------------------"
                    echo "이름: $name"
                    echo "생일: $birthday"
                    echo "전화번호: $phone"
                    echo "등록일: $date"
                    found=1
                fi
            done < "$DB_FILE"
            
            if [ $found -eq 0 ]; then
                echo "검색 결과가 없습니다."
            fi
            ;;
        4)
            echo ""
            echo "=== 수행 내용 검색 ==="
            echo -n "검색할 날짜 (YYYY-MM-DD): "
            read search_date
            
            echo ""
            echo "검색 결과:"
            found=0
            while IFS='|' read -r type date name content; do
                if [[ $type == "[WORK]" && $date == *"$search_date"* ]]; then
                    echo "-------------------"
                    echo "날짜: $date"
                    echo "팀원: $name"
                    echo "내용: $content"
                    found=1
                fi
            done < "$DB_FILE"
            
            if [ $found -eq 0 ]; then
                echo "검색 결과가 없습니다."
            fi
            ;;
        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        *)
            echo "1-5 사이의 번호를 입력하세요."
            ;;
    esac
done
