#!/bin/bash
#  code compiles
rm -f test-code
gcc -o bindec bindec.c -lm && chmod +x test-code
