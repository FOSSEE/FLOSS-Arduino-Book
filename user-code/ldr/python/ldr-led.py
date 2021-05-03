import os 
import sys
cwd = os.getcwd()
(setpath,Examples) = os.path.split(cwd)
sys.path.append(setpath)

from Arduino.Arduino import Arduino
from time import sleep

class LDR:
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
		self.ldr = 5
		self.blue = 9
		self.green = 10
		self.red = 11
		for i in range(50):
			val = self.obj_arduino.cmd_analog_in(1, self.ldr)
			print (val)
			if int(val) < 300:
				self.obj_arduino.cmd_digital_out(1, self.red, 1)
			else:
				self.obj_arduino.cmd_digital_out(1, self.red, 0)
			sleep(0.5) 	

	def exit(self):
		self.obj_arduino.close_serial()

def main():
	obj_ldr = LDR(115200)

if __name__== '__main__':
	main()
