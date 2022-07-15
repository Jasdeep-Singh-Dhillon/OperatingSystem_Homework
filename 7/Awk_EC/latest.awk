BEGIN {
	print "pages,trials,time"
}
{
	if(NR%3==0) {
		print($1)
	}
	else {
		printf("%s,",$2)	
	}
}
