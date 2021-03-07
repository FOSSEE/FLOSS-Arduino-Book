
import os 
import sys
cwd=os.getcwd()
(setpath,Examples)=os.path.split(cwd)
#print setpath
sys.path.append(setpath)

from Arduino.Arduino import Arduino
from time import sleep

class SERVO_INIT:
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
		self.obj_arduino.cmd_servo_attach(1,1)
		self.obj_arduino.cmd_servo_move(1,1,30)
		sleep(1)
		self.obj_arduino.cmd_servo_detach(1,1)
		sleep(1)
		
		
			

	def exit(self):
		self.obj_arduino.close_serial()

def main():
	obj_servo=SERVO_INIT(115200)

if __name__=='__main__':
	main()
