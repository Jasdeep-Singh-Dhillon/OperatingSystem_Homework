#!/bin/bash
# problem 3
hash=$(./get-response.awk -v ID=3 bash1.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "1a75115465d6786d84432e1401dcb3818aeef7143e9682df90756eb2c3c77c0e"
diff -w temp1.txt temp2.txt > diffs.txt
