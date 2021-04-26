#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <Windows.h>
//prototypes for the functions used in SerialComm.c

__declspec (dllexport) __stdcall int open_serial(int handle, int port, int baudrate);
__declspec (dllexport) __stdcall int write_serial(int handle, char str[],int size);
__declspec (dllexport) __stdcall int read_serial(int handle,char buf[],int size);
__declspec (dllexport) __stdcall int status_serial(int handle,int nb[]);
__declspec (dllexport) __stdcall int close_serial(int handle);
__declspec (dllexport) __stdcall int cmd_digital_out(int h,int pin_no,int val);
__declspec (dllexport) __stdcall int cmd_digital_in(int h,int pin_no);
__declspec (dllexport) __stdcall void delay(long int t);
__declspec (dllexport) __stdcall int  cmd_analog_out(int h,int pin_no,double val);
__declspec (dllexport) __stdcall uint16_t cmd_analog_in(int h,int pin_no);
__declspec (dllexport) __stdcall void cmd_dcmotor_setup(int h,int driver_type,int motor_no,int pin_no_1,int pin_no_2);
__declspec (dllexport) __stdcall void cmd_dcmotor_run(int h,int motor_no,int u1);
__declspec (dllexport) __stdcall void cmd_dcmotor_release(int h,int motor_no);
__declspec (dllexport) __stdcall void cmd_servo_attach(int h,int servo_no);
__declspec (dllexport) __stdcall void cmd_servo_move(int h,int servo_no,int u1);
__declspec (dllexport) __stdcall void cmd_servo_detach(int h,int servo_no);
__declspec (dllexport) __stdcall int mfloor(float num);
__declspec (dllexport) __stdcall int cmd_analog_out_volt(int h,int pin_no,double val);
__declspec (dllexport) __stdcall uint16_t cmd_analog_in_volt(int h,int pin_no);
__declspec (dllexport) __stdcall long int hex2dec(char hexadecimal[]);
__declspec (dllexport) __stdcall void dec2hex(long int decimalnum,char hexadecimalnum[]);
__declspec (dllexport) __stdcall double ieeesingle2num(char hexa[]);
__declspec (dllexport) __stdcall void read_active_power();
__declspec (dllexport) __stdcall void read_current();
__declspec (dllexport) __stdcall void read_voltage();
__declspec (dllexport) __stdcall double read_val(int addr_byte);
__declspec (dllexport) __stdcall int ascii_c(char c);
__declspec (dllexport) __stdcall char ascii_n(int num);
