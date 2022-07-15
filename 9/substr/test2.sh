#!/bin/bash
# substrings length 3, words length 7
rm -f out.txt
awk -v N=3 -v M=7 -f substr.awk words.txt > out.txt
diff -w out.txt gold2.txt > diffs.txt
