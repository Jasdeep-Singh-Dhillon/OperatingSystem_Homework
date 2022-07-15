#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

// max length input string
#define MAXSTR 25

// convert input binary string to a number


int main() {

   // user input string
   char s[MAXSTR+3]; 

   // prompt for input if input from terminal
   if (isatty(fileno(stdin))) {
       printf("> ");
   }

   // read input string; at most MAXSTR+1 chars accepted
   // Note: this is tricky. If we accept only MAXSTR chars,
   // we can't see if user entered more chars and they are
   // being dropped by fgets.
   fgets(s, MAXSTR+3, stdin);

   // check input length; n does not include final carriage return
   int n = strlen(s)-1;  
   if (n > MAXSTR) {
     printf("input cannot be more than %d characters\n", MAXSTR);
     exit(1);
   }

   // convert s from a string in binary, to an int, and output
   
   // YOUR CODE HERE    

   //convert the binary value and store it in decimal
   //temp is used to calculate the powers of 2 to help the conversion
   //i is the counter for the loop
   int i, decimal=0, power=1;
   int flag = 0;
   for(i=n-1; i>=0; i--)
   {
      if(i!=n-1)
      {
	 power = power * 2;
      }
      // to make sure there aren't any value other than 0 or 1
      if(s[i]=='1')
      {
	 decimal = decimal + (1*power);
      }
      else if(s[i]=='0')
      {
	 decimal = decimal + 0;
      }
      else
      {
	 printf("input must contain only zeros and ones\n");
	 flag = 1;
	 break;
      }
   }
   if(flag == 0)
   {
      printf("%d\n", decimal);
   }

   return 0;
}

