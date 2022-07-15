#!/bin/bash
# no such command

# input
cat > temp-in.txt <<zzz
fraggle
exit
zzz

# correct output
cat > gold-out.txt <<zzz
msh: fraggle: No such file or directory
zzz

# actual output
rm -f temp-out.txt
./msh2 < temp-in.txt > temp-out.txt

diff -wB temp-out.txt gold-out.txt > diffs.txt
