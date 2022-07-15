$3 ~ /Alloc/ {
	if(length($3)==9){
		l = 2;
	}
	else{
		l = 1;
	}
	printf("%s %s\n", substr($3,7,l), ($5!=-1))
}

