import os 
import sys
cwd = os.getcwd()
(setpath, Examples)=os.path.split(cwd)
sys.path.append(setpath)

from Arduino.Arduino import Arduino
from time import sleep

class SERVO_INCR:
	def __init__(self,baudrate):
		self.baudrate = baudrate
		self.setup()
		self.run()
		self.exit()

	def setup(self):
		self.obj_arduino = Arduino()
		self.port = self.obj_arduino.locateport()
		self.obj_arduino.open_serial(1, self.port, self.baudrate)

	def run(self):
		self.pin1 = 5
		self.obj_arduino.cmd_servo_attach(1, 1)
		sleep(1)
		self.angle = 20
		for i in range(10):
			self.obj_arduino.cmd_servo_move(1, 1, self.angle*i)
			sleep(1)
		self.obj_arduino.cmd_servo_detach(1, 1)
		
	def exit(self):
		self.obj_arduino.close_serial()

def main():
	obj_servo=SERVO_INCR(115200)

if __name__=='__main__':
	main()
