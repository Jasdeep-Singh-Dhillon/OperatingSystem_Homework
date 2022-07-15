#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main()
{
	int rc = 1;
	if(rc < 0) {
		fprintf(stderr, "fork failed\n");
		exit(1);
	}
	else if(rc == 0){
		printf("This is the child process: %d\n", getpid());
	}
	else{
		int r = wait(NULL);
		printf("This is the parent process with wait return %d: %d\n", r, getpid());
	}
	return 0;
}
