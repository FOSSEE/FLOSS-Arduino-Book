#include <errno.h>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h> /* memset */
#include <stdio.h>

int set_interface_attribs (int fd, int speed, int parity);
void set_blocking (int b, int should_block);
int open_serial(int handle,int port, int baudrate);
int close_serial(int handle);
int write_serial(int handle, char str[],int size);
int status_serial(int handle,int nb[]);
int read_serial(int handle,char* buf,int size);
//int read_serial(int *handle,char buf[],int *size);

void delay(long int t);



/*int set_interface_attribs (int fd, int speed, int parity);
void set_blocking (int b, int should_block);
void open_serial(int *handle,int *port, int *baudrate, int *OK);
void close_serial(int *handle, int *OK);
void write_serial(int *handle, char str[],int *size, int *OK);
void status_serial(int *handle, int *OK,int *nbread, int *nbwrite);
void read_serial(int *handle,char buf[],int *size);
*/