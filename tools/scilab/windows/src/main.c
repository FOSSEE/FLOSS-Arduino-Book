/**************************************************

file: main.c
purpose: serial librairie for Scilab

Alain Caignot 
**************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <time.h>

//#ifdef _WIN32
#include <Windows.h>
//#else
//#include <unistd.h>
//#endif

#define MAXPORTS 5 //unused : can be used to opened several COM to have several Arduino card

// Static definition to stock HANDLE of Port.
static HANDLE hport;

// Function to open port COM
__declspec(dllexport) void __stdcall open_serial(int *handle,int *port, int *baudrate, int *OK){
	DCB dcbSerialParams ;
	DWORD dwBytesWrite = 0;
	DWORD dwBytesRead = 10;
	COMMTIMEOUTS timeouts={0};

	char tmp[5]="COM5";
	itoa(*port,&tmp[3],10);
	
	*OK=0;
	

  	hport = CreateFile(tmp,
							GENERIC_READ | GENERIC_WRITE,
							0,//FILE_SHARE_READ | FILE_SHARE_WRITE //to test : recuperation COM port if simulation crashes
							0,
							OPEN_EXISTING,
							FILE_ATTRIBUTE_NORMAL,
							0);

	if(hport==INVALID_HANDLE_VALUE){
	  if(GetLastError()==ERROR_FILE_NOT_FOUND){
	     //serial port does not exist. Inform user.
	     *OK = GetLastError();
		 return;
	  }
	//some other error occurred. Inform user.
	  *OK = GetLastError();
	  return;
	}



	dcbSerialParams.DCBlength=sizeof(dcbSerialParams);
	if (!GetCommState(hport, &dcbSerialParams)) {
	//error getting state
	     *OK = GetLastError();
		 return;
	}
	dcbSerialParams.BaudRate=*baudrate;
	dcbSerialParams.ByteSize=8;
	dcbSerialParams.StopBits=ONESTOPBIT;
	dcbSerialParams.Parity=NOPARITY;
	if(!SetCommState(hport, &dcbSerialParams)){
		//error setting serial port state
	    *OK = GetLastError();
		return;
	}
    

	timeouts.ReadIntervalTimeout=50;
	timeouts.ReadTotalTimeoutConstant=50;
	timeouts.ReadTotalTimeoutMultiplier=1;
	timeouts.WriteTotalTimeoutConstant=50;
	timeouts.WriteTotalTimeoutMultiplier=1;
	if(!SetCommTimeouts(hport, &timeouts)){
	//error occureed. Inform user
		*OK = GetLastError();
	    return;
	}
	Sleep(1000);
}


__declspec (dllexport) __stdcall void close_serial(int *handle, int *OK){
	int res;
	*OK=0;
	res=CloseHandle(hport);
	if (res==0)//error
		*OK = GetLastError();
}

__declspec (dllexport) __stdcall void write_serial(int *handle, char str[],int *size, int *OK){
	DWORD dwBytesWrite = 0;
	int res;
	*OK=0;
	res=WriteFile(hport,str,*size,&dwBytesWrite,NULL);

	if (res==0) //error
		*OK = GetLastError();

}

__declspec (dllexport) __stdcall void status_serial(int *handle, int *OK,int *nbread, int *nbwrite){
	DWORD dwErrorFlags;
	COMSTAT ComStat;
	int res;

	*OK=0;
	res=ClearCommError( hport, &dwErrorFlags, &ComStat );
	if (res==0) {//error
		*OK = GetLastError();
        return;
	}
	*nbread=ComStat.cbInQue;
	*nbwrite=ComStat.cbOutQue;
}

__declspec (dllexport) __stdcall void read_serial(int *handle,char buf[],int *size){
	DWORD dwBytesRead = 0;
	int res;

	//*OK=0;
	res=ReadFile(hport, buf, *size, &dwBytesRead, NULL);
	//if (res==0) {//error
	//	*OK = GetLastError();
    //    return;
	//}
}
