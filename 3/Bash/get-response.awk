#!/usr/bin/awk -f
# get problem with problem id ID from problem file
# usage: get-problem.awk -v ID=i problem-file.txt

/^#@ / {
    if ($2 == ID) {
        state = "printing" 
    } else {
        state = ""
    }
}
!/^#@/ {
    if (state == "printing")	
        print $0
}
