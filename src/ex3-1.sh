#!/bin/bash

# 인자 개수 확인
if [ $# -ne 2 ]; then
    echo "사용법: $0 <숫자1> <숫자2>"
    exit 1
fi

num1=$1
num2=$2

echo "=== 사칙연산 결과 ==="
echo "입력값: $num1, $num2"
echo "덧셈: $num1 + $num2 = $((num1 + num2))"
echo "뺄셈: $num1 - $num2 = $((num1 - num2))"
echo "곱셈: $num1 × $num2 = $((num1 * num2))"

if [ $num2 -eq 0 ]; then
    echo "나눗셈: 0으로 나눌 수 없습니다"
else
    echo "나눗셈: $num1 ÷ $num2 = $((num1 / num2))"
    echo "나머지: $num1 % $num2 = $((num1 % num2))"
fi
