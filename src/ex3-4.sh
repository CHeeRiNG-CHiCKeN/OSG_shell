#!/bin/bash

# 점수 배열
declare -a scores=()

while true; do
    echo ""
    echo "===================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급(GPA) 변환"
    echo "5) 종료"
    echo "===================="
    echo -n "선택: "
    read choice
    
    case $choice in
        1)
            echo -n "과목 점수를 입력하세요: "
            read score
            if [ $score -ge 0 ] && [ $score -le 100 ]; then
                scores+=($score)
                echo "점수가 추가되었습니다."
            else
                echo "0-100 사이의 점수를 입력하세요."
            fi
            ;;
        2)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
            else
                echo "=== 입력된 모든 점수 ==="
                for i in "${!scores[@]}"; do
                    echo "과목 $((i+1)): ${scores[$i]}점"
                done
            fi
            ;;
        3)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
            else
                total=0
                for score in "${scores[@]}"; do
                    total=$((total + score))
                done
                average=$((total / ${#scores[@]}))
                echo "평균 점수: $average점"
            fi
            ;;
        4)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
            else
                total=0
                for score in "${scores[@]}"; do
                    total=$((total + score))
                done
                average=$((total / ${#scores[@]}))
                
                if [ $average -ge 95 ]; then
                    gpa="A+"
                elif [ $average -ge 90 ]; then
                    gpa="A"
                elif [ $average -ge 85 ]; then
                    gpa="B+"
                elif [ $average -ge 80 ]; then
                    gpa="B"
                else
                    gpa="C"
                fi
                
                echo "평균 점수: $average점"
                echo "평균 등급(GPA): $gpa"
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
