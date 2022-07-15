#!/bin/bash
# cd to non-existent directory

set -e

# input
cat > temp-in.txt <<zzz
cd foo
exit
zzz

# correct output
cat > gold-out.txt <<zzz
msh: cd: foo: No such file or directory
zzz

# actual output
rm -f temp-out.txt
./msh3 < temp-in.txt > temp-out.txt

diff -wB temp-out.txt gold-out.txt > diffs.txt
