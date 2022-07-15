#!/bin/bash
# problem 9
hash=$(./get-response.awk -v ID=9 bash2.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "1e2ad31f973290f159d3b56074442cce3ed5a7b66e0110b84ae3c2445601bc32"
diff -w temp1.txt temp2.txt > diffs.txt
