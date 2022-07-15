#!/bin/bash
# problem 6
hash=$(./get-response.awk -v ID=6 bash1.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "8a14c103f65155292b580b759dd4080ba431938d6b42bbfd07b8c0f25542ea32"
diff -w temp1.txt temp2.txt > diffs.txt
