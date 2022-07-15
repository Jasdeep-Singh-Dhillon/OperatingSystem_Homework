#!/bin/bash
# problem 1
hash=$(./get-response.awk -v ID=1 bash1.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "23ebfd6ce3c39827e057564ce4fa16184c8c56554b6c6fdda2a969d94bb4fcb3"
diff -w temp1.txt temp2.txt > diffs.txt
