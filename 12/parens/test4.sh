#!/bin/bash
# test 4
test $(./parens <<< "( ( a )") = no 
