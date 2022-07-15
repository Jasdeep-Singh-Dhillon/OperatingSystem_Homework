#!/bin/bash
# problem 6
hash=$(./get-response.awk -v ID=6 bash2.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "28b2773905138ab7c59d0a3776f25f57ace0ee03a7d69e76116dab9c970cd1c4"
diff -w temp1.txt temp2.txt > diffs.txt
