#!/bin/bash
# problem 8
# compute hash of answer
./get-submission.awk -v ID=8 vsfs.txt | md5sum > temp1.txt
# hash of correct answer
echo '3bb86767ccb33cb1755c87291b574a3c  -' > temp2.txt
diff -w temp1.txt temp2.txt > diffs.txt
