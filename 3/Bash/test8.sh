#!/bin/bash
# problem 8
hash=$(./get-response.awk -v ID=8 bash2.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "eae4b5fad78926880581d46b14a6782ce9e3ca910429fe691bea4886937ee13a"
diff -w temp1.txt temp2.txt > diffs.txt
