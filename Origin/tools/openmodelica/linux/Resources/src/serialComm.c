#include <errno.h>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h> /* memset */
#include <stdio.h>
#include <stropts.h>
#include "../Include/serial.h"
#define MAXPORTS 5
static int fd;

int set_interface_attribs (int fd, int speed, int parity)
{
        struct termios tty;
        memset (&tty, 0, sizeof(tty));
        if (tcgetattr (fd, &tty) != 0)
        {
                return -1;
        }
        int posix_baudrate=0;

        switch(speed) {
        case 115200: posix_baudrate = B115200; break;
        //default: return -1;
        }
        cfsetospeed (&tty, posix_baudrate);
        cfsetispeed (&tty, posix_baudrate);

        tty.c_cflag = (tty.c_cflag & ~CSIZE) | CS8;     // 8-bit chars
        // disable IGNBRK for mismatched speed tests; otherwise receive break
        // as \000 chars
        tty.c_iflag &= ~IGNBRK;         // disable break processing
        tty.c_lflag = 0;                // no signaling chars, no echo,
                                        // no canonical processing
        tty.c_oflag = 0;                // no remapping, no delays
        tty.c_cc[VMIN]  = 0;            // read doesn't block
        tty.c_cc[VTIME] = 5;            // 0.5 seconds read timeout

        tty.c_iflag &= ~(IXON | IXOFF | IXANY); // shut off xon/xoff ctrl

        tty.c_cflag |= (CLOCAL | CREAD);// ignore modem controls,
                                        // enable reading
        tty.c_cflag &= ~(PARENB | PARODD);      // shut off parity
        tty.c_cflag |= parity;
        tty.c_cflag &= ~CSTOPB;
        tty.c_cflag &= ~CRTSCTS;

        if (tcsetattr (fd, TCSANOW, &tty) != 0)
        {
                return -1;
        }
        return 0;
}


void set_blocking (int b, int should_block)
{
        struct termios tty;
        memset (&tty, 0, sizeof tty);
        if (tcgetattr (b, &tty) != 0)
        {
                return;
        }

        tty.c_cc[VMIN]  = should_block ? 1 : 0;
        tty.c_cc[VTIME] = 5;            // 0.5 seconds read timeout

        //if (tcsetattr (fd, TCSANOW, &tty) != 0)
        //       error_message ("error %d setting term attributes", errno);
}

int open_serial(int handle,int port, int baudrate){
        char* portname;
        //printf("%d\n",port);
        int OK;
                switch(port){
                case 0: portname = "//dev/ttyACM0";break;
                case 1: portname = "//dev/ttyACM1";break;
                case 2: portname = "//dev/ttyACM2";break;
                case 3: portname = "//dev/ttyACM3";break;
                case 4: portname = "//dev/ttyACM4";break;
                case 5: portname = "//dev/ttyACM5";break;
                case 6: portname = "//dev/ttyACM6";break;
                case 7: portname = "//dev/ttyACM7";break;
                //default : return 2;
        }
        OK = 0;
        //printf("%s\n",portname);
        fd = open (portname, O_RDWR | O_NOCTTY | O_SYNC);
        //fd = open (portname, O_RDWR | O_NOCTTY); //srikant
        //printf("%d\n",fd);
        if (fd < 0)
        {
                OK=2;
                return OK;
        }
        set_interface_attribs (fd, baudrate, 0);
        set_blocking (fd, 0);                // set no blocking
        //printf("Program running with status : %d\n",OK);
        return OK;
}

int close_serial(int handle){
        //usleep(1000);
        close(fd);
        //printf("Program closing....\n");
        return 0;
}

int write_serial(int handle, char str[],int size){
        if(write(fd, str, size)!=-1)
        {        
                //printf("serial write started.\n");
                //printf("%s\n",str );
                //printf("%d\n",(int)str[0] );
        }
        usleep(size*100);
        return 0;
}


int status_serial(int handle,int nb[]){
        nb[0] = 2; 
        nb[1] = 2;
        int OK=0;
        //printf("Getting status.....\n");
        return OK;
}

int read_serial(int handle,char buf[],int size){
        
        char readbuf[size+1];
        //int fl=tcflush(fd,TCOFLUSH);
        //int fl=ioctl(fd,I_FLUSH,FLUSHW);
        if(read(fd, readbuf, size)!=-1)
        {
                readbuf[size]='\0';
                int i;
                for (i = 0; i < size; ++i)
                {
                        buf[i]=(readbuf[i]);
                        //printf("%u\n",buf[i] );
                }
                buf[size]='\0';
                //printf("Reading has commenced..\n");
                //printf("%d\n",(int)strlen(readbuf));
                //printf("%s\n",readbuf);
                return 0;
        }
        else
                return 2 ;
}
/*void read_serial(int *handle,char buf[],int *size){
        read(fd, buf, *size);
        printf("Reading has commenced..\n");
}*/
