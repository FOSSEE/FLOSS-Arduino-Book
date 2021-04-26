
import sys
import serial
from serial import Serial
from serial.tools.list_ports import comports
from time import sleep

p1=0               #Initial Position of servo motor 
p2=0               #Final Position of servo motor

a=["0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","A","B","C","D"]
class Initialization:
    def __init__(self):
        pass
        
    def locateport(self):
        if sys.platform.startswith('win'):
            port =''
            ports = list(comports())
            for i in ports:
                for j in i:
                    if 'Arduino' in j:
                        port = i[0]
        elif sys.platform.startswith('linux'):
            b=[]
            port =''
            ports = list(comports())
            for i in range(len(ports)):
                for x in range(7):
                    portname="/dev/ttyACM"+str(x)
                    if ports[i][0]==portname:
                        b.append(ports[i][0])
            port=b[0]
        return port
    
    def open_serial(self,ard_no, PortNo,baudrate):
        #global ser
        if PortNo =='':
            sys.exit("aa..error..! arduino not found")
        else:
            self.ser = Serial(PortNo,baudrate)
        sleep(2)
        self.checkfirmware()
        
    def close_serial(self):
        #global ser     
        self.ser.close()
    
    def checkfirmware(self):
        print ("Check Firm Ware")
        #global ser
        self.ser.write(bytes([118])) #chr(118)
        try: 
            x=self.ser.read()
            #print(x)
            #x=self.ser.read()
            #print(x)
            if x==b'o':
                try:
                    x=self.ser.read()
                except:
                    sys.exit("aa..! error..! it seems correct firmware not loaded")
            else:
                sys.exit("aa..! error..! it seems correct firmware not loaded")
        except:
            sys.exit("aa..! error..! it seems correct firmware not loaded")
    
        
class Arduino(Initialization):
    def __init__(self):
        print ("Init Arduino")
        #self.baudrate=0
        #self.ard_no=1
        #self.PortNo=0
        #self.pin=0
        #self.val=0
        #self.mode=0
        #self.mno=0
        #self.pin1=0
        #self.pin2=0
        #self.servo=0
    
    
    
    def cmd_digital_out(self,ard_no,pin,val):
        cmd=""
        a=["0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","A","B","C","D"]   
        cmd="D"+"a"+a[pin]+"1"    
        self.ser.write(cmd.encode('utf-8'))
        cmd=""
        cmd="D"+"w"+a[pin]+str(val)
        self.ser.write(cmd.encode('utf-8'))
        
    def cmd_digital_in(self,ard_no,pin):
        b=[]
        cmd=""
        a=["0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","A","B","C","D"]   
        cmd="D"+"a"+a[pin]+"0"    
        self.ser.write(cmd.encode('utf-8'))
        cmd=""
        cmd="D"+"r"+a[pin]
        self.ser.write(cmd.encode('utf-8'))
        a=self.ser.read()
        return(a.decode('UTF-8'))
    
    def cmd_analog_in(self,ard_no,pin):
        cmd=""
        a=["0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","A","B","C","D"]    
        cmd="A"+a[pin]    
        self.ser.write(cmd.encode('utf-8'))
        analog_times=[]
        b1=ord(self.ser.read(1))
        b2=ord(self.ser.read(1))
        a=b1+b2*256
        #a=ser.read()
        return(a)
        #return(int((1023-0)*int(ord(a))/(255-0)))
        
        
    def cmd_analog_out(self,ard_no, pin, val):
        a=["0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","A","B","C","D"]
        cmd = "W" + a[pin] + chr(val)
        self.ser.write(cmd.encode('utf-8'))
        
    def cmd_dcmotor_setup(self,ard_no,mode,mno,pin1,pin2):
        cmd=""
        a=["0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","A","B","C","D"]  
        cmd="C"+a[mno]+a[pin1]+a[pin2]+a[mode]   
        self.ser.write(cmd.encode('utf-8'))
        
    def cmd_dcmotor_run(self,ard_no,mno,val):
        cmd=""
        if(val <0):
            dirc=0
        else:
            dirc=1
        a=["0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","A","B","C","D"]  
        cmd="M"+a[mno]+a[dirc]+chr(abs(val))  
        self.ser.write(cmd.encode('utf-8'))
    
    def cmd_dcmotor_release(self,ard_no,mno):
        cmd=""
        a=["0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","A","B","C","D"]   
        cmd="M"+a[mno]+"r"   
        self.ser.write(cmd.encode('utf-8'))
        
    def cmd_servo_attach(self,ard_no,servo): #1->pin=9  #2->pin=10
        cmd=""
        a=["0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","A","B","C","D"]  
        cmd="S"+"a"+a[servo]   
        self.ser.write(cmd.encode('utf-8'))
        
    def cmd_servo_detach(self,ard_no,servo): #1->pin=9  #2->pin=10
        cmd=""
        a=["0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","A","B","C","D"]    
        cmd="S"+"d"+a[servo]   
        self.ser.write(cmd.encode('utf-8'))

    def cmd_servo_move(self,ard_no,servo,angle): #1->pin=9  #2->pin=10
        cmd=""
        a=["0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","A","B","C","D"]
        cmd="S"+"w"+a[servo]+chr(angle)   
        self.ser.write(cmd.encode('utf-8'))




#For PISO shift register
    def cmd_shift_in(self,dataPin,clockPin,ledPin,clockLed):
        value=[0 for _ in range(0,8)]
        #print value
        value2=[value for _ in range(0,8)]
        #print value2
        for i in range(0,8):
            so= self.cmd_digital_in(1,dataPin) #Reads serial out of IC
            print (so)
            if so=='1':
                self.cmd_digital_out(1,ledPin,1)
                sleep(0.1)
            else:
                self.cmd_digital_out(1,ledPin,0)
                sleep(0.1)
            value2[i][i]=int(so)
            #performs value=value|value2[i]
            for j in range(0,8):
                if value[j]==1 or value2[i][j]==1:
                    value[j]=1
                else:
                    value[j]=0
            self.cmd_digital_out(1,clockPin,1)
            self.cmd_digital_out(1,clockLed,1)
            sleep(0.5)
            self.cmd_digital_out(1,clockPin,0)
            self.cmd_digital_out(1,clockLed,0) #clockLED: Led indicating clock pulses
            sleep(0.4)
            #after every clock pulse, 1 right shift occurs for every bit
            #thus after 8 clock pulses, the entire parallel input is shifted out,
            #and obtained at the dataPin, one bit per clock pulse
            #Thus we get the bit by bit serial output of the Parallel Load
        print (value)




#For PISO shift register
#shift in for n bits
    def cmd_shift_in_n(self,dataPin,clockPin,ledPin,clockLed,numBits):
        n=numBits #no. of bits
        value=[0 for _ in range(0,n)] #a list of n elements, all 0s, to store the n bits of the inputs together
        value2=[value for _ in range(0,n)] #a list of lists, analogous to nxn array of all 0s
        for i in range(0,n): #n iterations since n bit input is given
            so=self.cmd_digital_in(1,dataPin)
            if so=='1':
                self.cmd_digital_out(1,ledPin,1)
                sleep(0.1)
            else:
                self.cmd_digital_out(1,ledPin,0)
                sleep(0.1)
            value2[i][i]=int(so)
            #performs value=value|value2[i]
            for j in range(0,n):
                if value[j]==1 or value2[i][j]==1:
                    value[j]=1
                else:
                    value[j]=0
            self.cmd_digital_out(1,clockPin,1)
            self.cmd_digital_out(1,clockLed,1)
            sleep(0.5)
            self.cmd_digital_out(1,clockPin,0)
            self.cmd_digital_out(1,clockLed,0) #clockLED: Led indicating clock pulses
            sleep(0.4)
        print (value)





#For SIPO shift register
    def cmd_shift_out(self,dataPin,clockPin,bitOrder,val):
        val2=0
        mat=[]
        if bitOrder=='MSBFIRST':
            #to create identity matrix
            for i in range(0,8):
                matsub=[0 for _ in range(0,8)]
                matsub[i]=1
                mat.append(matsub)
        else:
            #to create horizontally flipped identity matrix
            for i in range(0,8):
                matsub=[0 for _ in range(0,8)]
                matsub[7-i]=1
                mat.append(matsub)
        for i in range(0,8):
            #performs & operation on corresponding elements of list
            for x,y in zip(val,mat[i]):
                if x==1 and y==1:
                    val2=1
                    break
                else:
                    val2=0
            self.cmd_digital_out(1,dataPin,val2)
            self.cmd_digital_out(1,clockPin,1)
            self.cmd_digital_out(1,clockPin,0)



#For SIPO shift register
    def cmd_shift_out_(self,dataPin,clockPin,inPin):
        print ("Give serial input: ")
        sleep(0.25)
        self.cmd_digital_out(1,dataPin,self.cmd_digital_in(1,inPin)) #if inPin is HIGH,
        #i.e. if input is given, write HIGH on Serial In Pin of IC
        print("Serial input stored: ")
        self.cmd_digital_out(1,clockPin,1)
        self.cmd_digital_out(1,clockPin,0) #One clock pulse
        sleep(0.15)





#For SIPO shift register
#shift out for n bits
    def cmd_shift_out_n(self,dataPin,clockPin,bitOrder,val,numBits):
        n=int(numBits) #number of bits
        if (n%8)==0:
            p=n
        else:
            p=(8*(n/8))+8
        val1=[0 for _ in range(0,n)] #output matrix.
            #If all elements of the matrix are 0,
            #output pinstate will be 0 (i.e LOW).
            #If 1 or more elements of the matrix is 1,
            #output pinstate will be 1 (i.e HIGH)
        val2=0
        mat=[]
        if bitOrder=='MSBFIRST':
            for i in range(0,n):
                matsub=[0 for _ in range(0,n)]
                matsub[i]=1
                mat.append(matsub)
        else:
            for i in range(0,n):
                matsub=[0 for _ in range(0,n)]
                matsub[(n-1)-i]=1
                mat.append(matsub)
        for j in range(0,(p-n)): #do nothing for the first (p-n) clock  pulses
            self.cmd_digital_out(1,dataPin,0)
            self.cmd_digital_out(1,clockPin,1)
            self.cmd_digital_out(1,clockPin,0)
        for i in range(0,n): #shift for last n clock pulses
            #to perform val & mat[i]
            for x,y in zip(val,mat[i]):
                if x==1 and y==1:
                    val2=1
                    break
                else:
                    val2=0
            print (val2,)
            self.cmd_digital_out(1,dataPin,val2)
            self.cmd_digital_out(1,clockPin,1)
            self.cmd_digital_out(1,clockPin,0)
        
        
        
    
