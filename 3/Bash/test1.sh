#!/bin/bash
# problem 1
hash=$(./get-response.awk -v ID=1 bash2.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "99163c8dfb36c58eb2fd5997348aa767f66dc0f8cbbae159b1eab3e56bf1c79c"
diff -w temp1.txt temp2.txt > diffs.txt
