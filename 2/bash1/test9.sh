#!/bin/bash
# problem 9
hash=$(./get-response.awk -v ID=9 bash1.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "f87ebaedbfab9c0b3b778436850a94d9f2b5822bebc01ee9f83c722e3f2617fe"
diff -w temp1.txt temp2.txt > diffs.txt
