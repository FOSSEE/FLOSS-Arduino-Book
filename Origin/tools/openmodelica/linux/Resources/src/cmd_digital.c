#include <errno.h>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h> /* memset */
#include <stdio.h>
#include <stdlib.h>
#include "../Include/serial.h"
#include "../Include/digital.h"

int cmd_digital_out(int h,int pin_no,int val)
{   
	int wr;
	char pin[6]="Da";
    char v[2],temp[2];
	sprintf(temp,"%c",pin_no+48);
	strcat(pin,temp);
	strcat(pin,"1");
    //printf("%s",pin);
  	wr=write_serial(h,pin,4);
  	if (val > 0.5)
    	val = 1;
  	else
    	val = 0;

	sprintf(v,"%d",val);
  	strcpy(pin,"Dw");
    strcat(pin,temp);
	strcat(pin,v);
    //printf("%s",pin);
  	wr=write_serial(h,pin,4);
    return wr;
}

int cmd_digital_in(int h,int pin_no)
{
    int value = 0;
        char pin[6]="Da";
        char v1[2],v2[2];
        int wr1, wr2;
        sprintf(v1,"%c",pin_no+48);
        strcat(pin,v1);
        strcat(pin,"0");
        //printf("%s\n",pin);
        wr1=write_serial(h,pin,4);

        strcpy(pin,"Dr");
        sprintf(v2,"%c",pin_no+48);
        strcat(pin,v2);
        wr2=write_serial(1,pin,3);
        //binary transfer
        int stat;
        int num_bytes[2];
        char st[10];
        stat=status_serial(h,num_bytes);
        while(num_bytes[0]<1)
            stat=status_serial(h,num_bytes);
        char* temp;
        int wr=read_serial(h,st,1);
        value=strtod(st,&temp);
        //printf("%d\n",value);
        return value;
}
