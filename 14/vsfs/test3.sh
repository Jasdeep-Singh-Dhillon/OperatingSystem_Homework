#!/bin/bash
# problem 3 
# compute hash of answer
./get-submission.awk -v ID=3 vsfs.txt | md5sum > temp1.txt
# hash of correct answer
echo '1c48ad1a3f9dd0fdea69ef277ea3cd02  -' > temp2.txt
diff -w temp1.txt temp2.txt > diffs.txt
