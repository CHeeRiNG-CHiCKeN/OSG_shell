#!/bin/bash

echo "=== y = (1/2)x² 계산기 ==="
echo "x 값을 입력하세요 (공백으로 구분, 예: 2 4 6):"
read -a x_values

echo ""
echo "계산 결과:"
for x in "${x_values[@]}"; do
    # bc를 사용한 실수 계산
    y=$(echo "scale=4; 0.5 * $x * $x" | bc)
    echo "x = $x, y = $y"
done

