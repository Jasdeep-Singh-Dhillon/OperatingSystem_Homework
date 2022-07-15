#!/bin/bash
# not enough parameters for substr-cnt.sh
rm -f out.txt
./substr-cnt.sh 50 > out.txt
diff -w out.txt gold6.txt
