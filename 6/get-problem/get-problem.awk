#!/usr/bin/awk -f
BEGIN{
	str = ".";
	quesno = ID str;
}
/^--/{
	solution = 0
}
$2 == quesno {
	solution = 1
}
$1 !~ /^--/ {
	if(solution == 1 && $0!~/^$/){
		print $0
	}
}
