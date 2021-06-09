import os 
import sys
cwd = os.getcwd()
(setpath, Examples) = os.path.split(cwd)
sys.path.append(setpath)

from Arduino.Arduino import Arduino
from time import sleep

class SERVO_POT:
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
		self.pot = 2
		self.obj_arduino.cmd_servo_attach(1, 1)
		for i in range(50):
			val = self.obj_arduino.cmd_analog_in(1, self.pot)
			val = int(val*180/1023)
			self.obj_arduino.cmd_servo_move(1, 1 ,val)
			sleep(0.5)
		self.obj_arduino.cmd_servo_detach(1, 1)
		
	def exit(self):
		self.obj_arduino.close_serial()

def main():
	obj_servo = SERVO_POT(115200)

if __name__=='__main__':
	main()
