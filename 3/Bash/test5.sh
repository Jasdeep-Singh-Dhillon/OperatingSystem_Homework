#!/bin/bash
# problem 5
hash=$(./get-response.awk -v ID=5 bash2.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "a6f090a3703f2c1790661df335806bcb539da9938a6f142076095019bc863ee7"
diff -w temp1.txt temp2.txt > diffs.txt
