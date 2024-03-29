#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

/*
 * A simple shell
 */

#define MAX_BUF 160
#define MAX_TOKS 100

int main(int argc, char *argv[]) {
    int ch;
    int i;
    char *pos;
    char *tok;
    char s[MAX_BUF+2];   // 2 extra for the newline and ending '\0'
    static const char prompt[] = "msh> ";
    char *toks[MAX_TOKS];
    time_t rawtime;
    struct tm *timeinfo;
    char *path;
    FILE *infile;
    int input = 0; 
    int output = 0;
    char* inputFile;
    char *outputFile;

    // process command-line arguments
    if (argc > 2) {
        fprintf(stderr, "msh: usage: msh [file]\n");
        exit(EXIT_FAILURE);
    }
    if (argc == 2) {
        // read from script supplied on the command line
        infile = fopen(argv[1], "r");
        if (infile == NULL) {
            fprintf(stderr, "msh: cannot open script '%s'.\n", argv[1]);
            exit(EXIT_FAILURE);
        }
    } else {
        infile = stdin;
    }

    while (1) {
        // prompt for input if input from terminal
        if (isatty(fileno(infile))) {
            printf(prompt);
        }

        // read input
        char *status = fgets(s, MAX_BUF+2, infile);

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

        // break input into tokens
        i = 0;
        char *rest = s;
        while ((tok = strtok_r(rest, " ", &rest)) != NULL && i < MAX_TOKS) {
            toks[i] = tok;
            i++;
        }
        if (i == MAX_TOKS) {
            printf("error: too many tokens\n");
            continue;
        }
        toks[i] = NULL;

        // if no tokens do nothing
        if (toks[0] == NULL) {
            continue;
        }

        // exit if command is 'exit'
        if (strcmp(toks[0], "exit") == 0) {
            break;
        }

        // print help info if command is 'help'
        if (strcmp(toks[0], "help") == 0) {
            printf("enter a Linux command, or 'exit' to quit\n");
            continue;
        }

        // print date if command is 'date'
        if (strcmp(toks[0], "today") == 0) {
            time(&rawtime);
            timeinfo = localtime(&rawtime);
            printf("%02d/%02d/%4d\n", 1 + timeinfo->tm_mon, timeinfo->tm_mday, 1900 + timeinfo->tm_year);
            continue;
        }

        // cd command
        if (strcmp(toks[0], "cd") == 0) {
            // cd 
            if (toks[1] == NULL) {
                path = getenv("HOME");
            } else {
                path = toks[1];
            }
            int cd_status = chdir(path);
            if (cd_status != 0) {
                printf("msh: %s: %s: %s\n", toks[0], path, strerror(errno));
            }
            continue;
        }

        int j;

        // loop to check for input or output redirectors
        for(i=0; toks[i]!=NULL; i++){

            //if input redirector is present in the tokens
            if(strcmp(toks[i], "<") == 0){

                // store the filename for the input file
                inputFile = toks[i+1];
                input = 1;

                // rearrange the tokens while removing the input redirector and input file name
                for(j=i; toks[j]!=NULL; j++){
                    toks[j] = toks[j+2];
                }
                toks[j] = NULL;
            }

            // if output redirector is present in the tokens
            if(toks[i] != NULL && strcmp(toks[i], ">") == 0){

                // store the filename for the output file
                outputFile = toks[i+1];
                output = 1;

                // rearrange the tokens while removing the output redirector and output file name
                for(j=i; toks[j]!=NULL; j++){
                    toks[j] = toks[j+2];
                }
                toks[j] = NULL;
            }
        }

        // otherwise fork a process to run the command
        int rc = fork();
        if (rc < 0) {
            fprintf(stderr, "fork failed\n");
            exit(1);
        }
        if (rc == 0) {
            FILE *i;
            FILE *o;

            // if input redirector was found open the inputfile
            if(input == 1){

                // opening the input file, read only
                i = fopen(inputFile, "r");
                if(i == NULL){
                    fprintf(stderr, "Cannot open file %s\n", inputFile);
                }

                // changing the standard input to file
                dup2(fileno(i), fileno(stdin));
            }

            // if output redirector was found
            if(output == 1){

                // opening the input file, read and write and create if does not exist
                o = fopen(outputFile, "w+");
                if(o == NULL){
                    fprintf(stderr, "Cannot open file %s\n", outputFile);
                }

                // chaning the standard output to file
                dup2(fileno(o), fileno(stdout));
            }
            // child process: run the command indicated by toks[0]
            execvp(toks[0], toks);  
            // if execvp returns than an error occurred
            printf("msh: %s: %s\n", toks[0], strerror(errno));
            exit(1);
        } else {
            // wait for command to finish running
            wait(NULL);
        }
    }
    exit(EXIT_SUCCESS);
}
