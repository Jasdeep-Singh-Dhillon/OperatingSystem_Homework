#!/usr/bin/awk -f
BEGIN{
	printf("Identifier,\"Full name\",")
	count = 0
}
{
	if(/}/) {
		count--
	}
	if(NF == 2) {
		string[count] = substr($1, 2, length($1)-2)
		count++
	}
	if(NF >= 3) {
		for(i=0; i<count; i++) {
			printf("%s_", string[i])
		}
		printf("%s,", substr($1, 2, length($1)-2))
	}
}
END {
	printf("comments\n")
}

