BEGIN{
	print "pages,trials,time"
}
{
	if($1 == "num_pages" || $1 == "num_trials")
	printf("%s,", $2)
	else
	printf("%.02f\n", $1)
}