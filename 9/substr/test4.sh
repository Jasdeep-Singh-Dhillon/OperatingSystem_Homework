#!/bin/bash
# substrings length 7, words length 5
rm -f out.txt
awk -v N=7 -v M=5 -f substr.awk words.txt > out.txt
diff -w out.txt gold4.txt > diffs.txt
