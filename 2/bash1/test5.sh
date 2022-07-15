#!/bin/bash
# problem 5
hash=$(./get-response.awk -v ID=5 bash1.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "fef91e3117fbd20e3513a67d5870a9e7a76d4cfa7f1d803f880de8778697d85c"
diff -w temp1.txt temp2.txt > diffs.txt
