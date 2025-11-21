#!/usr/bin/env python3
import sys

print("=== 프로그램 시작 ===")
print(f"실행 파일명: {sys.argv[0]}")
print(f"전달된 인자 개수: {len(sys.argv) - 1}")

if len(sys.argv) > 1:
    print("\n=== 입력된 인자들 ===")
    for i, arg in enumerate(sys.argv[1:], 1):
        print(f"인자 {i}: {arg}")
else:
    print("전달된 인자가 없습니다.")

print("\n=== 프로그램 종료 ===")
