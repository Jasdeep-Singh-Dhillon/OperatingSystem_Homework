#!/bin/bash
# ls command works

# input
cat > temp-in.txt <<zzz
ls ..
exit
zzz

# correct output
touch gold-out.txt
ls .. > gold-out.txt
cat >> gold-out.txt <<zzz
zzz

# actual output
rm -f temp-out.txt
./msh2 < temp-in.txt > temp-out.txt

diff -wB temp-out.txt gold-out.txt > diffs.txt
