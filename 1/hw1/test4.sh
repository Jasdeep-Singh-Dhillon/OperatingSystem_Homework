#!/bin/bash
# empty input

# create input file and file with correct output
cat > temp-in.txt <<< ""
cat > gold-out.txt <<< 0

# run test code on input file
rm -f temp-out.txt 
./bindec < temp-in.txt > temp-out.txt 

# compare output to correct output
diff -w temp-out.txt gold-out.txt > diffs.txt
