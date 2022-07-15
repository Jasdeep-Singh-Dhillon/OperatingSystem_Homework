#!/bin/bash
# problem 10
hash=$(./get-response.awk -v ID=10 bash2.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "a85bc76ebd17fca8548b483adf50960ac9affbf56f1b21fd77de0b56a06ee95c"
diff -w temp1.txt temp2.txt > diffs.txt
