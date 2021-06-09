#include <errno.h>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdio.h>
#include <math.h>
#include "../Include/serial.h"
#include "../Include/dcmotor.h"

#define abs(x) (x>=0?x:-x)

void cmd_dcmotor_setup(int h,int driver_type,int motor_no,int pin_no_1,int pin_no_2)
{
	printf("init DCmotor\n");
	char code_sent[10]="C";
	int wr;
	char v1[2],v2[2],motor[2];
    if(driver_type==1)
    {
    	sprintf(v1,"%c",pin_no_1+48);
    	sprintf(v2,"%c",pin_no_2+48);
    	sprintf(motor,"%c",motor_no+48);
    	strcat(code_sent,motor);
    	strcat(code_sent,v1);
    	strcat(code_sent,v2);
    	strcat(code_sent,"1");
    }
        //code_sent="C"+string(motor_no)+ascii(48+pin_no_1)+ascii(48+pin_no_2)+"1";    //adafruit
    else if(driver_type==2)
    {
    	sprintf(v1,"%c",pin_no_1+48);
    	sprintf(v2,"%c",pin_no_2+48);
    	sprintf(motor,"%c",motor_no+48);
    	strcat(code_sent,motor);
    	strcat(code_sent,v1);
    	strcat(code_sent,v2);
    	strcat(code_sent,"1");
    }    
        //code_sent="C"+string(motor_no)+ascii(48+pin_no_1)+ascii(48+pin_no_2)+"1";   //code pour initialiser L298
    else if(driver_type==3)
    {
    	sprintf(v1,"%c",pin_no_1+48);
    	sprintf(v2,"%c",pin_no_2+48);
    	sprintf(motor,"%c",motor_no+48);
    	strcat(code_sent,motor);
    	strcat(code_sent,v1);
    	strcat(code_sent,v2);
    	strcat(code_sent,"0");

    }
    //    code_sent="C"+string(motor_no)+ascii(48+pin_no_1)+ascii(48+pin_no_2)+"0";   //code pour initialiser L293
    //printf("%s\n",code_sent);
    wr=write_serial(h,code_sent,5);

    int stat;
    int num_bytes[2];
    //Attente que l'arduino reponde OK
    stat=status_serial(1,num_bytes);
    while (num_bytes[0] < 2) 
        stat=status_serial(1,num_bytes);
    char values[5];
    int dcm_rd=read_serial(1,values,2);
    if (dcm_rd == 0)
        printf("Init motor successful\n");
    else
        printf("Init motor unsuccessful\n");
}

void cmd_dcmotor_run(int h,int motor_no,int u1)
{
	char code_dir[2];
	char code_sent[10]="M";
	char motor[2];
    int val;
	char v[2];
    if(u1>=0)
       	sprintf(code_dir,"%c",49);
              //code_dir=ascii(49);
    else
        sprintf(code_dir,"%c",48);
              //code_dir=ascii(48);
    if(abs(u1)>255)
        val=255;
    else
        val=abs(ceil(u1));
    //printf("%d\n",val);
    sprintf(motor,"%c",motor_no+48);
    sprintf(v,"%c",val);
    strcat(code_sent,motor);
    strcat(code_sent,code_dir);
    strcat(code_sent,v);
    //printf("%s\n",code_sent);      
          //code_sent="M"+ascii(48+motor_no)+code_dir+ascii(val);
    int wr=write_serial(h,code_sent,4);
}

void cmd_dcmotor_release(int h,int motor_no)
{
	char code_sent[6]="M";
	char motor[2];
	char v[2];
	sprintf(motor,"%c",motor_no+48);
	sprintf(v,"%c",0);
    strcat(code_sent,motor);
    strcat(code_sent,"1");
    strcat(code_sent,v);
	//code_sent="M"+ascii(48+motor_no)+"1"+ascii(0);
    //printf("%s\n",code_sent);
    int wr=write_serial(h,code_sent,4);
    strcpy(code_sent,"M");  
    strcat(code_sent,motor);
    strcat(code_sent,"r");
    //printf("%s\n",code_sent);
    //code_sent="M"+ascii(48+motor_no)+"r";
    wr=write_serial(h,code_sent,3);
}
