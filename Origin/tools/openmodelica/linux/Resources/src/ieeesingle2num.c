#include <errno.h>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include "../Include/serial.h"

#ifdef NAN
/* NAN is supported */
#endif
#ifdef INFINITY
/* INFINITY is supported */
#endif


long int hex2dec(char hexadecimal[])
{
	long int decimalNumber=0;
    char hexDigits[16] = {'0', '1', '2', '3', '4', '5', '6', '7', '8',
      '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    int i, j, power=0;    
     
    /* Converting hexadecimal number to decimal number */
    for(i=strlen(hexadecimal)-1; i >= 0; i--) {
        /*search currect character in hexDigits array */
        if(isalpha(hexadecimal[i]))
        		hexadecimal[i]=toupper(hexadecimal[i]);
        for(j=0; j<16; j++){
            if(hexadecimal[i] == hexDigits[j]){
                decimalNumber += j*pow(16, power);
            }
        // }
        power++;
        }
    }
    return decimalNumber;
}

void dec2hex(long int decimalnum,char hexadecimalnum[])
{
	long quotient, remainder;
    int j = 1;
    quotient = decimalnum;
 
    while (quotient != 0)
    {
        remainder = quotient % 16;
        if (remainder < 10)
            hexadecimalnum[j--] = 48 + remainder;
        else
            hexadecimalnum[j--] = 55 + remainder;
        quotient = quotient / 16;
    }
    hexadecimalnum[2]='\0';
}

double ieeesingle2num(char hexa[])
{
	long int x=hex2dec(hexa);
	long int k =(long int)pow(2,31);   //pow2(31);
	int s = (x >= k);
	if (s) 
		x = x - k;
	//t = pow2(x,-23);
	double t = x*pow(2,-23);
	long int e = floor(t);
	double f = t - e;
	double y;
	if (e == 255)
	 	if(f == 0)
	 		y = INFINITY; 
	 	else 
	 		y = NAN;
	else if(e > 0)
		y = (1+f)*pow(2,e-127);
	 //y = (1+f).*2.^(e-127);
	else
	    y = f*pow(2,-126);
	//y = f.*2.^-126;
	if (s) 
		y = -y;
	return y;
}