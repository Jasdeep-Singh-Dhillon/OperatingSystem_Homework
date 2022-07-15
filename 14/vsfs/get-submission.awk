#!/usr/bin/awk -f

#
# get a problem submission by number and print to standard out
# 
# A problem starts with a ^#@ line, and ends with either
# a comment line, another problem line, or EOF.  Blank
# lines in the submission are ignored.
#
# The problem number is given by command line variable ID.
#
# usage: ./get-submission.awk -v ID=1 <submission-file>

/^#[^@]*/ {
  in_prob = 0
}
{ 
  if (in_prob == 1 && NF > 0) {
     print
  }
}
/^#@/ { 
  if (ID == $2) {
     in_prob = 1
  }
}
