#!/bin/bash
# exit command works

set -e

# input
cat > temp-in.txt <<zzz
exit
zzz

# correct output
cat > gold-out.txt <<zzz
zzz

# actual output
rm -f temp-out.txt
./msh3 < temp-in.txt > temp-out.txt

diff -wB temp-out.txt gold-out.txt > diffs.txt
