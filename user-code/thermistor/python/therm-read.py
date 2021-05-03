import os 
import sys
cwd = os.getcwd()
(setpath,Examples) = os.path.split(cwd)
sys.path.append(setpath)

from Arduino.Arduino import Arduino
from time import sleep

class THERM_BUZZER:
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
		self.therm = 4

		for i in range(20):
			val = self.obj_arduino.cmd_analog_in(1, self.therm)
			print(val)
			sleep(0.5)

	def exit(self):
		self.obj_arduino.close_serial()

def main():
	obj_pot = THERM_BUZZER(115200)

if __name__== '__main__':
	main()
