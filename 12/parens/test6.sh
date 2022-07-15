#!/bin/bash
# test 6
test $(./parens <<< "( ( a ) )") = yes
