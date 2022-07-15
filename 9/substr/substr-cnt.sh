#!/bin/bash
# list the number of times subsequences appear in wordlist.txt, with
# most common subsequences first
# Two command-line parameters must be provided:
#   m is a number > 0 giving the subsequence length
#   n is a number >= m giving the maximum word length to consider

#
# YOUR CODE HERE
#
if [ $# -eq 2 ]; then
	awk -v N=$1 -v M=$2 -f substr.awk wordlist.txt | sort | uniq -c | sort -k1,1 -sr
fi
if [ $# -eq 1 ]; then
	echo "usage: ./substr-cnt.sh m n"
fi
