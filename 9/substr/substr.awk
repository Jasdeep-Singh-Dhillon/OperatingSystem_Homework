# given an input file of words, output all N letter substrings
# of all words of length M or less (N must be provided on command line)
# default value of M is 100

BEGIN {
	if(!M){
		M = 100
	}
	if(M < N) {
		print "error: parameter M should be >= parameter N"
	}
}
{
	if( length($0) <= M ) {
		if( length($0) > N ) {
			i=1
			while(1){
				if(length($0)-i < N-1){
					break
				}
				printf("%s\n", substr($0,i,N))
				i++
			}
		}
		else if ( length($0) == N){
			print $0
		}
	}
}