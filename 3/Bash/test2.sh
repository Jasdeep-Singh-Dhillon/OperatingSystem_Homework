#!/bin/bash
# problem 2
hash=$(./get-response.awk -v ID=2 bash2.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "7fedcd65856cc29429b2b1b1ca5b2ecc8ae23ff668e11688027146236f1cf955"
diff -w temp1.txt temp2.txt > diffs.txt
