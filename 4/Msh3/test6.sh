#!/bin/bash
# cd with no arguments

set -e

# input
cat > temp-in.txt <<zzz
cd
pwd
exit
zzz

# correct output
echo $HOME > gold-out.txt

# actual output
rm -f temp-out.txt
./msh3 < temp-in.txt > temp-out.txt

diff -wB temp-out.txt gold-out.txt > diffs.txt
