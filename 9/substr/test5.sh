#!/bin/bash
# count substrings length 4, words length 7
rm -f out.txt
./substr-cnt.sh 3 7 | head -100 > out.txt
diff -w out.txt gold5.txt > diffs.txt
