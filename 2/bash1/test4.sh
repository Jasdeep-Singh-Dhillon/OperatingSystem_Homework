#!/bin/bash
# problem 4
hash=$(./get-response.awk -v ID=4 bash1.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "d3b3efbef1d161571966c56f3c109e55214fc6b06917b93c8c86d2ad9a61379b"
diff -w temp1.txt temp2.txt > diffs.txt
