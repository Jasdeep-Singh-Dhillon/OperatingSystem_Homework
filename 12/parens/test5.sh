#!/bin/bash
# test 5
test $(./parens <<< "( a ) )") = no
