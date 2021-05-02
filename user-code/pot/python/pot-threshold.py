import os 
import sys
cwd = os.getcwd()
(setpath, Examples) = os.path.split(cwd)
sys.path.append(setpath)

from Arduino.Arduino import Arduino
from time import sleep

class POT:
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
		self.pot = 2
		self.blue = 9
		self.green = 10
		self.red = 11
		for i in range(20):
			val = self.obj_arduino.cmd_analog_in(1, self.pot)
			print (val)

			if (int(val) >= 0 and int(val) < 320):
				self.obj_arduino.cmd_digital_out(1, self.blue, 1)
				sleep(1)
				self.obj_arduino.cmd_digital_out(1, self.blue, 0)
			elif (int(val) >= 320 and int(val) < 900):
				self.obj_arduino.cmd_digital_out(1, self.green, 1)
				sleep(1)			
				self.obj_arduino.cmd_digital_out(1, self.green, 0)			
			else:
				self.obj_arduino.cmd_digital_out(1, self.red, 1)
				sleep(1)
				self.obj_arduino.cmd_digital_out(1, self.red, 0)

	def exit(self):
		self.obj_arduino.close_serial()

def main():
	obj_pot = POT(115200)

if __name__=='__main__':
	main()
