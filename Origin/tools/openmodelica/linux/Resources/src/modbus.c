#include <errno.h>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdio.h>
#include <math.h>
#include "../Include/serial.h"
#include "../Include/ieeesingle2num.h"
#include "../Include/modbus.h"

char ascii_n(int num)
{
	return (char)num;
}

int ascii_c(char c)
{
	return (int)c;
}

void read_voltage()
{
	char arr[9]={ascii_n(1),ascii_n(3),ascii_n(15),ascii_n(86),ascii_n(00),ascii_n(2),ascii_n(39),ascii_n(15),'\0'};
	
	//printf("%s\n",arr);//debug
    
	int x,wr,rd;
    char buf[12];
    for(x=0;x<5;x++)
    {
        wr=write_serial(1,arr,8);
        rd = read_serial(1,buf,11);
		usleep(500);
	}
	buf[11]='\0';
    
	//printf("%s\n",buf );//debug
    
	int b1=0,b2=0,b3=0,b4=0;
    int myresult[12];
    int i;
    for (i = 0; i < 11; ++i)
    {
        myresult[i]=ascii_c(buf[i]);
		//printf("%d",myresult[i]);//debug
    }
    
	//printf("%d %d %d %d\n",myresult[4],myresult[5],myresult[6],myresult[7]);//debug
    
	int a1=myresult[4];
    if (a1<16)
    {
        b1=1;
    }
    char v1[3];
	dec2hex(a1,v1);
    if (b1)
    {
        sprintf(v1,"0%s",v1);
    }
	else
	{
		sprintf(v1,"%s",v1);
	}	
    int a2=myresult[5];
    if (a2<16)
    {
        b2=1;
    }
    char v2[3];
	dec2hex(a2,v2);
    if (b2)
    {
        sprintf(v2,"0%s",v2);
    }
	else
	{
		sprintf(v2,"%s",v2);
	}
    int a3=myresult[6];
    if (a3<16)
    {
        b3=1;
    }
    char v3[3];
	dec2hex(a3,v3);
    if (b3)
    {
        sprintf(v3,"0%s",v3);
    }
	else
	{
		sprintf(v3,"%s",v3);
	}
    int a4=myresult[7];
    if (a4<16)
    {
        b4=1;
    }
    char v4[3];
	dec2hex(a4,v4);
    if (b4)
    {
        sprintf(v4,"0%s",v4);
    }
	else
	{
		sprintf(v4,"%s",v4);
	}	
    char a6[20]="";
	strcat(a6,v3);
	strcat(a6,v4);
	strcat(a6,v1);
	strcat(a6,v2);
	a6[8]='\0';
	
	//printf("%s",a6);//debug
	
    int cl=close_serial(1);
    double p=ieeesingle2num(a6);
    printf("Voltage(in V)=%f\n",p);
}


void read_current()
{
	char arr[9]={ascii_n(1),ascii_n(3),ascii_n(15),ascii_n(88),ascii_n(00),ascii_n(2),ascii_n(70),ascii_n(204),'\0'};
	//printf("%s\n",arr);//debug
    
	int x,wr,rd;
    char buf[12];
    for(x=0;x<5;x++)
    {
        wr=write_serial(1,arr,8);
        rd = read_serial(1,buf,11);
		usleep(500);
	}
	buf[11]='\0';
    
	//printf("%s\n",buf );//debug
    
	int b1=0,b2=0,b3=0,b4=0;
    int myresult[12];
    int i;
    for (i = 0; i < 11; ++i)
    {
        myresult[i]=ascii_c(buf[i]);
		//printf("%d",myresult[i]);//debug
    }
    
	//printf("%d %d %d %d\n",myresult[4],myresult[5],myresult[6],myresult[7]);//debug
    
	int a1=myresult[4];
    if (a1<16)
    {
        b1=1;
    }
    char v1[3];
	dec2hex(a1,v1);
    if (b1)
    {
        sprintf(v1,"0%s",v1);
    }
	else
	{
		sprintf(v1,"%s",v1);
	}	
    int a2=myresult[5];
    if (a2<16)
    {
        b2=1;
    }
    char v2[3];
	dec2hex(a2,v2);
    if (b2)
    {
        sprintf(v2,"0%s",v2);
    }
	else
	{
		sprintf(v2,"%s",v2);
	}
    int a3=myresult[6];
    if (a3<16)
    {
        b3=1;
    }
    char v3[3];
	dec2hex(a3,v3);
    if (b3)
    {
        sprintf(v3,"0%s",v3);
    }
	else
	{
		sprintf(v3,"%s",v3);
	}
    int a4=myresult[7];
    if (a4<16)
    {
        b4=1;
    }
    char v4[3];
	dec2hex(a4,v4);
    if (b4)
    {
        sprintf(v4,"0%s",v4);
    }
	else
	{
		sprintf(v4,"%s",v4);
	}	
    char a6[20]="";
	strcat(a6,v3);
	strcat(a6,v4);
	strcat(a6,v1);
	strcat(a6,v2);
	a6[8]='\0';
	
	//printf("%s",a6);//debug
	
    int cl=close_serial(1);
    double p=ieeesingle2num(a6);
    printf("Current(in A)=%f\n",p);
}

void read_active_power()
{
    char arr[9]={ascii_n(1),ascii_n(3),ascii_n(15),ascii_n(78),ascii_n(00),ascii_n(2),ascii_n(167),ascii_n(8),'\0'};
	//printf("%s\n",arr);//debug
    
	int x,wr,rd;
    char buf[12];
    for(x=0;x<5;x++)
    {
        wr=write_serial(1,arr,8);
        rd = read_serial(1,buf,11);
		usleep(500);
	}
	buf[11]='\0';
    
	//printf("%s\n",buf );//debug
    
	int b1=0,b2=0,b3=0,b4=0;
    int myresult[12];
    int i;
    for (i = 0; i < 11; ++i)
    {
        myresult[i]=ascii_c(buf[i]);
		//printf("%d",myresult[i]);//debug
    }
    
	//printf("%d %d %d %d\n",myresult[4],myresult[5],myresult[6],myresult[7]);//debug
    
	int a1=myresult[4];
    if (a1<16)
    {
        b1=1;
    }
    char v1[3];
	dec2hex(a1,v1);
    if (b1)
    {
        sprintf(v1,"0%s",v1);
    }
	else
	{
		sprintf(v1,"%s",v1);
	}	
    int a2=myresult[5];
    if (a2<16)
    {
        b2=1;
    }
    char v2[3];
	dec2hex(a2,v2);
    if (b2)
    {
        sprintf(v2,"0%s",v2);
    }
	else
	{
		sprintf(v2,"%s",v2);
	}
    int a3=myresult[6];
    if (a3<16)
    {
        b3=1;
    }
    char v3[3];
	dec2hex(a3,v3);
    if (b3)
    {
        sprintf(v3,"0%s",v3);
    }
	else
	{
		sprintf(v3,"%s",v3);
	}
    int a4=myresult[7];
    if (a4<16)
    {
        b4=1;
    }
    char v4[3];
	dec2hex(a4,v4);
    if (b4)
    {
        sprintf(v4,"0%s",v4);
    }
	else
	{
		sprintf(v4,"%s",v4);
	}	
    char a6[20]="";
	strcat(a6,v3);
	strcat(a6,v4);
	strcat(a6,v1);
	strcat(a6,v2);
	a6[8]='\0';
	
	//printf("%s",a6);//debug
	
    int cl=close_serial(1);
    double p=ieeesingle2num(a6);
    printf("Active Power(in W)=%f\n",p);
}

double read_val(int addr_byte)
{	
	char* arr;
    if(addr_byte==86)
    {   
        char code[9]={ascii_n(1),ascii_n(3),ascii_n(15),ascii_n(86),ascii_n(00),ascii_n(2),ascii_n(39),ascii_n(15),'\0'};
        arr = code;
        printf("Voltage(in V)=");
    }
    else if(addr_byte==88)
    {   
        char code[9]={ascii_n(1),ascii_n(3),ascii_n(15),ascii_n(88),ascii_n(00),ascii_n(2),ascii_n(70),ascii_n(204),'\0'};
        arr =code;
        printf("Current(in A)=");
    }
    else if(addr_byte==78)
    {   
        char code[9]={ascii_n(1),ascii_n(3),ascii_n(15),ascii_n(78),ascii_n(00),ascii_n(2),ascii_n(167),ascii_n(8),'\0'};
        arr = code;
        printf("Active Power(in W)=");
    }
	//printf("%s\n",arr);//debug
    
	int x,wr,rd;
    char buf[12];
    for(x=0;x<5;x++)
    {
        wr=write_serial(1,arr,8);
        rd = read_serial(1,buf,11);
		usleep(500);
	}
	buf[11]='\0';
    
	//printf("%s\n",buf );//debug
    
	int b1=0,b2=0,b3=0,b4=0;
    int myresult[12];
    int i;
    for (i = 0; i < 11; ++i)
    {
        myresult[i]=ascii_c(buf[i]);
		//printf("%d",myresult[i]);//debug
    }
    
	//printf("%d %d %d %d\n",myresult[4],myresult[5],myresult[6],myresult[7]);//debug
    
	int a1=myresult[4];
    if (a1<16)
    {
        b1=1;
    }
    char v1[3];
	dec2hex(a1,v1);
    if (b1)
    {
        sprintf(v1,"0%s",v1);
    }
	else
	{
		sprintf(v1,"%s",v1);
	}	
    int a2=myresult[5];
    if (a2<16)
    {
        b2=1;
    }
    char v2[3];
	dec2hex(a2,v2);
    if (b2)
    {
        sprintf(v2,"0%s",v2);
    }
	else
	{
		sprintf(v2,"%s",v2);
	}
    int a3=myresult[6];
    if (a3<16)
    {
        b3=1;
    }
    char v3[3];
	dec2hex(a3,v3);
    if (b3)
    {
        sprintf(v3,"0%s",v3);
    }
	else
	{
		sprintf(v3,"%s",v3);
	}
    int a4=myresult[7];
    if (a4<16)
    {
        b4=1;
    }
    char v4[3];
	dec2hex(a4,v4);
    if (b4)
    {
        sprintf(v4,"0%s",v4);
    }
	else
	{
		sprintf(v4,"%s",v4);
	}	
    char a6[20]="";
	strcat(a6,v3);
	strcat(a6,v4);
	strcat(a6,v1);
	strcat(a6,v2);
	a6[8]='\0';
	
	//printf("%s",a6);//debug
	
    int cl=close_serial(1);
    double p=ieeesingle2num(a6);
    printf("%f\n",p);
    return p;
}
