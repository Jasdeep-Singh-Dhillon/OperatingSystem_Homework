#!/bin/bash
# msh runs script

set -e		# exit on any error
 
# input
cat > temp-in.txt <<zzz
wc -l test1.sh
grep cat test2.sh
zzz
 
# correct output
cat > gold-out.txt <<zzz
5 test1.sh
cat > temp-in.txt <<zzz
cat > gold-out.txt <<zzz
zzz
 
# actual output
rm -f temp-out.txt
timeout 2s ./msh4 temp-in.txt > temp-out.txt
 
diff -wB temp-out.txt gold-out.txt > diffs.txt
