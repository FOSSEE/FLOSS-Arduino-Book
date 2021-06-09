#include <errno.h>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h> /* memset */
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <stdint.h>
#include "../Include/serial.h"
#include "../Include/analog.h"

uint16_t cmd_analog_in(int h,int pin_no)
{	
	char pin[5],v1[2];
	int stat;
	int read[3];
	sprintf(v1,"%c",pin_no+48);
	strcpy(pin,"A");
	strcat(pin,v1);
    int wr=write_serial(h,pin,2);
    stat=status_serial(h,read);
    //printf("Read:%d\n",read[0] );
    while (read[0] < 2)
    	stat=status_serial(h,read);
    char values[5];
    int a_rd=read_serial(h,values,2);
    values[2]='\0';
    printf("%s\n",values);
    int l=strlen(values);
    //printf("%d\n",l );
    uint8_t temp[l+1];
    int i;
    for (i = 0; i < l; ++i)
    {
    	temp[i]=(uint8_t)(values[i]);
    }
    //printf("%u %u\n",temp[0],temp[1]);
    uint16_t result=(uint16_t)(256*temp[1]+temp[0]);
    //printf("%u\n",result);
    return result;
}

int cmd_analog_out(int h,int pin_no,double val)
{
	char v1[2],v2[2];
	if(val > 255)
    	val = 255;
    else if(val < 0)
        val = 0;
    //printf("%f\n",val);
    char code_sent[10];
    strcpy(code_sent,"W");
    sprintf(v1,"%c",pin_no+48);
    sprintf(v2,"%c",abs(ceil(val)));
    strcat(code_sent,v1);
    strcat(code_sent,v2);
    //printf("%s\n",code_sent);
    return write_serial(h,code_sent,3);

}