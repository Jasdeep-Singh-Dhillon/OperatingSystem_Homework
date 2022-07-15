BEGIN{
	maxr = 0
	maxw = 0
	sr = 0
	sw = 0
	rwtest="PASS"
	wwtest="PASS"
}
{
	if($0 == "sr") {
		if(sw > 0) {
			rwtest = "FAIL"
		}
		sr++
	}
	else if($0 == "dr") {
		if(maxr < sr) {
			maxr = sr
		}
		sr--
	}
	else if($0 == "sw") {
		if(sr > 0) {
			rwtest = "FAIL"
		}
		if(sw > 0) {
			wwtest = "FAIL"
		}
		sw++	
	}
	else if($0 == "dw") {
		if(maxw < sw) {
			maxw = sw
		}
		sw--
	}
}
END {
	printf("maxr = %d, maxw = %d\n", maxr, maxw)
	printf("reader/writer test: %s\n", rwtest)
	printf("writer/writer test: %s\n", wwtest)
}