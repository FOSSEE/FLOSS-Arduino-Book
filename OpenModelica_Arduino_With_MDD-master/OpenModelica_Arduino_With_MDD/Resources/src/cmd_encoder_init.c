#include <errno.h> 
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "../Include/encoder.h"
#include "../Include/serial.h"

void cmd_encoder_init(int h,int enc_mode,int pin_no_1,int pin_no_2)
{   
    
    int wr;
    char code_sent[10]="Ea";
    char c[2];

    sprintf(c,"%c",48+corresp[block->rpar[2]]);
    strcat(code_sent,c);
    if(block.rpar(2)==4)
    { 
    	char c1[2],c2[2],v[10];
    	sprintf(c1,"%c",48+0+corresp[block->rpar[3]]);
    	sprintf(v,"%s",(block->rpar[1]));
        strcat(code_sent,c1);
        strcat(code_sent,v);
    }
    else
    {
       	char c2[2],v[10];
    	sprintf(c2,"%c",48+0+corresp[block->rpar[3]]);
    	sprintf(v,"%s",block->rpar[1]);
    	strcat(code_sent,c1);
        strcat(code_sent,v);
    }
    wr=write_serial(1,code_sent,5);
    strcpy(code_sent,"Ez");
    sprintf(c,"%c",corresp[block->rpar[2]])
    strcat(code_sent,c);
    wr=write_serial(1,code_sent,3)
}