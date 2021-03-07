using SerialPorts
using ArduinoTools

ser = connectBoard(115200)

for i = 1:20
  p = analogRead(ser,4)
  println(p)
  sleep(0.5)
end
close(ser)
