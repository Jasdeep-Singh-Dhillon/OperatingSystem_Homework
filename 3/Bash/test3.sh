#!/bin/bash
# problem 3
hash=$(./get-response.awk -v ID=3 bash2.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "09444f1be3a1661fe613f832fdef1472405992fdeb1cd03cad696f60ae82d645"
diff -w temp1.txt temp2.txt > diffs.txt
