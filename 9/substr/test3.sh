#!/bin/bash
# substrings length 7, words length 9
rm -f out.txt
awk -v N=7 -v M=9 -f substr.awk words.txt > out.txt
diff -w out.txt gold3.txt > diffs.txt
