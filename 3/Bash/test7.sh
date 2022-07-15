#!/bin/bash
# problem 7
hash=$(./get-response.awk -v ID=7 bash2.txt | xargs | sha256sum)
echo ${hash/ */} > temp1.txt
cat > temp2.txt <<< "4c86c3f6a3d56b508d1e35fad145341dc1ba4f0397cbced2c1fdd5a256c96823"
diff -w temp1.txt temp2.txt > diffs.txt
