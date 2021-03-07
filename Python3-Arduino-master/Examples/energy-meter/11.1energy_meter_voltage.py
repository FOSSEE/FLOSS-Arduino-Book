#!/usr/bin/python

import serial,time
import struct
import sys

if serial.Serial('COM2',9600).isOpen():
	serial.Serial('COM2',9600).close()
s= serial.Serial('COM2',9600)
#s.write("A")
s.flushOutput()
s.flushInput()
time.sleep(2)

a = '00000001'
b = '00000011'
c = '00001111'
d = '01010110'
e = '00000000'
f = '00000010'
g = '00100111'
h = '00001111'
aa = str(chr(int(a,2)))
bb =  str(chr(int(b,2)))
cc =  str(chr(int(c,2)))
dd =  str(chr(int(d,2)))
ee =  str(chr(int(e,2)))
ff =  str(chr(int(f,2)))
gg =  str(chr(int(g,2)))
hh =  str(chr(int(h,2)))
fin = aa + bb + cc + dd + ee + ff + gg + hh
#s.flushOutput()
finaly = s.write(fin.encode('utf-8'))
time.sleep(0.5)

i = 0 
ll = []
while True:
	time.sleep(0.001)
	if s.inWaiting() != 0:
#s.flushInput()
		ll.append(s.read())
		#print ll
	if len(ll) == 9:
		temp = str(ll[5].encode('hex')) + str(ll[6].encode('hex')) + str(ll[3].encode('hex')) + str(ll[4].encode('hex'))
		#print temp
		ans = struct.unpack('!f', temp.decode('hex'))[0]
		temp = str(ans).split("e")
		print ('Value of voltage on energy meter is %s' %(ans))
		break
s.close()
time.sleep(1)
