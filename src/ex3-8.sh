#!/bin/bash

echo "=== 폴더 및 파일 관리 ==="

# 1. DB 폴더 확인 및 생성
if [ -d "DB" ]; then
    echo "DB 폴더가 이미 존재합니다."
else
    mkdir DB
    echo "DB 폴더를 생성했습니다."
fi

# 2. DB 폴더에 파일 5개 생성
cd DB
echo ""
echo "5개의 파일을 생성합니다..."
for i in {1..5}; do
    echo "This is file number $i" > "file$i.txt"
    echo "파일 생성: file$i.txt"
done

# 3. 파일 압축
echo ""
echo "파일을 압축합니다..."
tar -czf db_files.tar.gz file*.txt
echo "압축 완료: db_files.tar.gz"

# 4. 상위 디렉토리로 이동
cd ..

# 5. train 폴더 생성
if [ -d "train" ]; then
    echo ""
    echo "train 폴더가 이미 존재합니다. 삭제 후 재생성합니다."
    rm -rf train
fi
mkdir train
echo "train 폴더를 생성했습니다."

# 6. DB의 파일들을 train에 링크
echo ""
echo "DB의 파일들을 train에 링크합니다..."
cd train
for file in ../DB/file*.txt; do
    ln -s "$file" "$(basename $file)"
    echo "링크 생성: $(basename $file) -> $file"
done

# 7. 결과 확인
echo ""
echo "=== 작업 완료 ==="
echo ""
echo "DB 폴더 내용:"
ls -lh ../DB/
echo ""
echo "train 폴더 내용 (심볼릭 링크):"
ls -lh
