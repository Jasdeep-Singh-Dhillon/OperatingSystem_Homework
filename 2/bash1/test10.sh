#!/bin/bash
# problem 10
hash=$(./get-response.awk -v ID=10 bash1.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "5a6942de4fbb9281935567b14b21eff491e95675eab51866ba5469cb3dc36302"
diff -w temp1.txt temp2.txt > diffs.txt
