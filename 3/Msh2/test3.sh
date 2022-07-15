#!/bin/bash
# ls command works with options

# input
cat > temp-in.txt <<zzz
ls -t test2.sh test3.sh
exit
zzz

# correct output
touch gold-out.txt
ls -t test2.sh test3.sh > gold-out.txt
cat >> gold-out.txt <<zzz
zzz

# actual output
rm -f temp-out.txt
./msh2 < temp-in.txt > temp-out.txt

diff -wB temp-out.txt gold-out.txt > diffs.txt
