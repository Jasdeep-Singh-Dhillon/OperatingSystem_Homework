
/^Free List/ { 
	for(i=9; i<NF; i=i+4){
		printf("%s ",substr($i,4,4))
	} 
	printf("\n") 
}
