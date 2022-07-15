
/Alloc.*returned/ {
	($5=="-1") ? fail++ : success++
}
END {
	printf("num successes: %d; num failures: %d\n",success, fail)
}


