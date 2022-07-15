#!/bin/bash
# cd command works

set -e
 
# input
cat > temp-in.txt <<zzz
cd $HOME
pwd
cd ..
pwd
exit
zzz
 
# correct output
echo $HOME > gold-out.txt
readlink -f $HOME/.. >> gold-out.txt
 
# actual output
rm -f temp-out.txt
./msh3 < temp-in.txt > temp-out.txt
 
diff -wB temp-out.txt gold-out.txt > diffs.txt
