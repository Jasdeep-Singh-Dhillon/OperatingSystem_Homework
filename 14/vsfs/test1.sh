#!/bin/bash
# problem 1
# compute hash of answer
./get-submission.awk -v ID=1 vsfs.txt | md5sum > temp1.txt
# hash of correct answer
echo '51ffcd517a811af07cbc925a876338af  -' > temp2.txt
diff -w temp1.txt temp2.txt > diffs.txt
