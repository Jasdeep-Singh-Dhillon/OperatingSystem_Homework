#!/bin/bash
# problem 8
hash=$(./get-response.awk -v ID=8 bash1.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "b1119ecaf54feb68aa5ca8387277e0a929c71cd99fc70f1985b1de1b3b8724b6"
diff -w temp1.txt temp2.txt > diffs.txt
