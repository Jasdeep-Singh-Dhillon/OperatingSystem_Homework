#include <stdio.h> 
#include <stdlib.h> // For exit() 
  
int main(int argc, char *argv[]) 
{ 
	char s[162];

	printf("Argv 1: %s\n", argv[1]);

	FILE *f = fopen(argv[1], "r");
    // char *status = fgets(s, 162, f);

    if (f == NULL){
        printf("Could not open file %s",argv[1]);
        return 1;
    }

    while (fgets(s, 162, f) != NULL)
        printf("%s\n", s);
    fclose(f);
    return 0; 
}