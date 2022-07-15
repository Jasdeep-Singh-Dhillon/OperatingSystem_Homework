#!/bin/bash
# tlb.csv
awk -f tlb.awk tlb-trials.txt > temp.csv
diff -w temp.csv tlb.csv > diffs.txt
