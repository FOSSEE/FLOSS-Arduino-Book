#include <errno.h>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include "../Include/serial.h"
#include "../Include/servomotor.h"

void cmd_servo_attach(int h,int servo_no)
{
	char pin[5];
	int wr;
	printf("init servo write\n");
    if(servo_no==1)//servo 1 on pin 9
    {
    	strcpy(pin,"Sa1");
        //printf("%s\n",pin);
        wr=write_serial(h,pin,3);
    }     
    else if(servo_no==2)//servo 2 on pin 10
    {
    	strcpy(pin,"Sa2");
        wr=write_serial(h,pin,3);
    }
    else
           perror("Error.");
}


void cmd_servo_move(int h,int servo_no,int u1)
{
	int wr;
	char servo[2];
	char v[2];
	char pin[5]="Sw";
	if (u1<0)
	{
		sprintf(servo,"%c",48+servo_no);
		sprintf(v,"%c",0);
		strcat(pin,servo);
		strcat(pin,v);
        //printf("%s\n",pin );
          //pin="Sw"+ascii(48+servo_no)+ascii(0);
	}
    else if(u1>180)
    {
    	sprintf(servo,"%c",48+servo_no);
		sprintf(v,"%c",180);
		strcat(pin,servo);
		strcat(pin,v);
        //printf("%s\n",pin );
    }      //pin="Sw"+ascii(48+servo_no)+ascii(180);
    else
    {
    	sprintf(servo,"%c",48+servo_no);
		sprintf(v,"%c",(uint8_t)u1);
		strcat(pin,servo);
		strcat(pin,v);
        //printf("%s\n",pin );
    }      //pin="Sw"+ascii(48+servo_no)+ascii(uint8(u1));
    wr=write_serial(1,pin,4);
}


void cmd_servo_detach(int h,int servo_no)
{
	int wr;
	char pin[5]="Sd";
	if(servo_no==1) //servo 1 on pin 10
    {
    	strcat(pin,"1");
           //pin="Sd1"
        wr=write_serial(h,pin,3);
    }
    else if(servo_no==2) //servo 2 on pin 9
    {
    	strcat(pin,"2");
           //pin="Sd2"
        wr=write_serial(h,pin,3);
    }
    else
    perror("Error.");

}