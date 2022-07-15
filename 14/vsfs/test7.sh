#!/bin/bash
# problem 7
# compute hash of answer
./get-submission.awk -v ID=7 vsfs.txt | md5sum > temp1.txt
# hash of correct answer
echo 'c7df6c34a04fc2930cd32aa8f4566b2d  -' > temp2.txt
diff -w temp1.txt temp2.txt > diffs.txt
