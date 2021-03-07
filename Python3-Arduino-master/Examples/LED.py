
import os
import sys
#Setting PYTHONPATH
cwd = os.getcwd()
(setPath,Examples) = os.path.split(cwd)
print setPath 
sys.path.append(setPath)

from Arduino.Arduino import Arduino
from time import sleep




class LED_ON:

    def __init__(self,baudrate):
	self.baudrate=baudrate
        self.setup()
        self.run()
        self.exit()
   
    def setup(self):
        #self.baudrate = baudrate
        self.obj_arduino = Arduino()
        self.port = self.obj_arduino.locateport()
        #Open Serial PORT
        self.obj_arduino.open_serial(1, self.port,self.baudrate)
       
    def run(self):
        self.blue = 9
        self.obj_arduino.cmd_digital_out(1,self.blue,1)
        #sleep(2)
        #self.obj_arduino.cmd_digital_out(1,self.blue,0)
        #sleep(2)
   
    def exit(self):
        self.obj_arduino.close_serial()
#    def __init__(self):
#        self.obj_arduino = Arduino()
#        self.port = self.obj_arduino.locateport()
#        #Open Serial PORT
#        self.obj_arduino.open_serial(1, self.port, 115200)
#	for i in range(10):
#		print i
#	        self.red = 9
#	        self.obj_arduino.cmd_digital_out(1,self.red,1)
#		sleep(2)
#		#self.red = 13
#	        self.obj_arduino.cmd_digital_out(1,self.red,0)
#		sleep(2)
#    		#print "ok"
#    def close(self):
#        self.obj_arduino.close_serial()

def main():
    obj_led = LED_ON(115200)
    #sleep(2)
    #obj_led.close()

if __name__ == '__main__':
    main()
