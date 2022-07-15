#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <time.h>

/*
 * A very simple shell that supports only commands 'exit', 'help', and 'today'.
 */

#define MAX_BUF 160
#define MAX_TOKS 100

int main() {
	int ch;
	char *pos;
	char s[MAX_BUF+2];   // 2 extra for the newline and ending '\0'
	static const char prompt[] = "msh> ";
	char *toks[MAX_TOKS];

	// 
	// YOUR CODE HERE   (add declarations as needed)
	//

	while (1) {
		// prompt for input if input from terminal
		if (isatty(fileno(stdin))) {
			printf(prompt);
		}

		// read input
		char *status = fgets(s, MAX_BUF+2, stdin);

		// exit if ^d entered
		if (status == NULL) {
			printf("\n");
			break;
		}

		// input is too long if last character is not newline 
		if ((pos = strchr(s, '\n')) == NULL) {
			printf("error: input too long\n");
			// clear the input buffer
			while ((ch = getchar()) != '\n' && ch != EOF) ;
			continue; 
		}

		// remove trailing newline
		*pos = '\0';

		//
		// YOUR CODE HERE
		//

		//to keep track of number of tokens
		int size=0;

		char *token;

		//while loop to store each token in toks[]
		while(size<MAX_TOKS)
		{
			//to get the first token of the input string
			if(size==0)
				token = strtok(s, " ");

			//to get the all the other token from the input string
			else
				token = strtok(NULL, " ");

			// stop when there are no more token in the string
			if(token == NULL)
				break;

			toks[size] = token;
			size++;
		}

		//if the input string is nothing
		if(size == 0)
		{
			continue;
		}
		
		//if the input string starts with help
		if(strcmp(toks[0],"help")==0)
		{
			printf("enter 'help', 'today', or 'exit' to quit\n");
			continue;
		}

		//if the input string starts with exit
		if(strcmp(toks[0],"exit")==0)
		{
			break;
		}

		//if the input string starts with today
		if(strcmp(toks[0],"today")==0)
		{
			time_t t = time(NULL);
  			struct tm *time = localtime(&t);
  			printf("%02d/%02d/%d\n", time->tm_mon+1, time->tm_mday, time->tm_year+1900);
			continue;
		}

		//printing all the tokens stored in toks[]
		int k;
		for(k=0; k<size; k++)
		{
			printf("token: '%s'\n", toks[k]);
		}
		
		//clearing all the tokens stored in toks[]
		for(k=0; k<size; k++)
		{
			toks[k] = NULL;
		}	
	}
	exit(EXIT_SUCCESS);
}
