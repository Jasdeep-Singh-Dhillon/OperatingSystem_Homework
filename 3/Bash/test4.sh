#!/bin/bash
# problem 4
hash=$(./get-response.awk -v ID=4 bash2.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "f205e51f48e2ff3ee192db408ed694b067667abe99892a12097b082e5dd5003b"
diff -w temp1.txt temp2.txt > diffs.txt
