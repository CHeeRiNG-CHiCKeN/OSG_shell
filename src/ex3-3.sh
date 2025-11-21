#!/bin/bash

echo "=== 성적 등급 변환 프로그램 ==="
echo "과목 점수를 입력하세요 (공백으로 구분):"
read -a scores

total=0
count=${#scores[@]}

echo ""
echo "=== 각 과목 등급 ==="
for i in "${!scores[@]}"; do
    score=${scores[$i]}
    
    # 점수 유효성 검사
    if [ $score -lt 0 ] || [ $score -gt 100 ]; then
        echo "과목 $((i+1)): 잘못된 점수 ($score)"
        continue
    fi
    
    # 등급 판정
    if [ $score -ge 90 ]; then
        grade="A"
    else
        grade="B"
    fi
    
    echo "과목 $((i+1)): $score점 -> $grade"
    total=$((total + score))
done

# 평균 계산
if [ $count -gt 0 ]; then
    average=$((total / count))
    echo ""
    echo "=== 평균 정보 ==="
    echo "평균 점수: $average점"
    
    if [ $average -ge 90 ]; then
        echo "평균 등급: A"
    else
        echo "평균 등급: B"
    fi
fi

