#!/bin/bash
# substrings length 3, words any length
rm -f out.txt
awk -v N=3 -f substr.awk words.txt > out.txt
diff -w out.txt gold1.txt > diffs.txt
