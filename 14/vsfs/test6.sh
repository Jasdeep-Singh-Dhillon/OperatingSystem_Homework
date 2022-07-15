#!/bin/bash
# problem 6
# compute hash of answer
./get-submission.awk -v ID=6 vsfs.txt | md5sum > temp1.txt
# hash of correct answer
echo '60c40df3027828f396e44b7baa9b665c  -' > temp2.txt
diff -w temp1.txt temp2.txt > diffs.txt
