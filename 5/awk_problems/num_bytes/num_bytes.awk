$3 ~ /Alloc/ {
	print (length($3)==9) ? substr($3, 7, 2) : substr($3, 7, 1) 
}