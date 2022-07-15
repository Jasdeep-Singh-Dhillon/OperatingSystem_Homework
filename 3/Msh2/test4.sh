#!/bin/bash
# multiple commands are accepted

# input
cat > temp-in.txt <<zzz
wc -l test1.sh
wc -c test2.sh
exit
zzz

# correct output
wc -l test1.sh > gold-out.txt
wc -c test2.sh >> gold-out.txt

# actual output
rm -f temp-out.txt
./msh2 < temp-in.txt > temp-out.txt

diff -wB temp-out.txt gold-out.txt > diffs.txt
