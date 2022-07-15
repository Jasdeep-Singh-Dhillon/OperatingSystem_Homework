#!/bin/bash
# problem 7
hash=$(./get-response.awk -v ID=7 bash1.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "ff711537cb5e9156a9968f4135643e0c5a0987d0f6dcb10e1c99a4697dd96bf1"
diff -w temp1.txt temp2.txt > diffs.txt
