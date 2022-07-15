#!/bin/bash
# problem 2 
# compute hash of answer
./get-submission.awk -v ID=2 vsfs.txt | md5sum > temp1.txt
# hash of correct answer
echo 'e8c7c22db7842fa6cd8d6356eb50b6e1  -' > temp2.txt
diff -w temp1.txt temp2.txt > diffs.txt
