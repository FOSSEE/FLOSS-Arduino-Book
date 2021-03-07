import os
import sys
import os 
import sys
cwd=os.getcwd()
(setpath,Examples)=os.path.split(cwd)
#print setpath
sys.path.append(setpath)

from Arduino.Arduino import Arduino
from time import sleep

class DCMOTOR_ROTATION:
	def __init__(self,baudrate):
		self.baudrate=baudrate
		self.setup()
		self.run()
		self.exit()

	def setup(self):
		self.obj_arduino=Arduino()
		self.port=self.obj_arduino.locateport()
		self.obj_arduino.open_serial(1,self.port,self.baudrate)

	def run(self):
		self.pin1=9
		self.pin2=10
		self.obj_arduino.cmd_dcmotor_setup(1,3,1,self.pin1,self.pin2)
		self.obj_arduino.cmd_dcmotor_run(1,1,100)
		sleep(2)
		self.obj_arduino.cmd_dcmotor_release(1,1)
		
		
			

	def exit(self):
		self.obj_arduino.close_serial()

def main():
	obj_dcmotor=DCMOTOR_ROTATION(115200)

if __name__=='__main__':
	main()
