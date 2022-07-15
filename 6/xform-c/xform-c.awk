#!/usr/bin/awk -f 
BEGIN {
	FS = ","
}

{
	if(NR == 1){
		str = "comments"
		$4 = str
	}
	else{
		$1 = "Participant " $1
		if($3 == 1){
			$3 = 0
		}
		else{
			$3 = $3 + 5
			if($2 == 1)
			$3 = $3 + 5
		}
		
		if($2 == 1)
		str = "a"
		else if($2 == 2)
		str = "b"
		else if($2 == 3)
		str = "c"
		else if($2 == 4)
		str = "d"
		else if($2 == 5)
		str = "e"

		$2 = "3_" str
	}
}
{
	for(i=1; i<=4; i++){
		if(i !=1)
			printf(",")
		printf("%s", (string)$i)
	}
	printf("\n")
}