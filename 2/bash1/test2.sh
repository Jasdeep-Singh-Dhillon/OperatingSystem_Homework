#!/bin/bash
# problem 2
hash=$(./get-response.awk -v ID=2 bash1.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "a77d5dda1df1e344ccec3fba24415bd0d91394d524a37e1c6de0115e766fdcc3"
diff -w temp1.txt temp2.txt > diffs.txt
