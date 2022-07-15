#!/bin/bash
# test 2
test $(./parens <<< "( a )") = yes
