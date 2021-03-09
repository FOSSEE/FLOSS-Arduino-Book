using SerialPorts
using ArduinoTools

ser = connectBoard(115200)
pinMode(ser,3,"OUTPUT")
for i = 1:50
  p = analogRead(ser,4)
  println(p)
  if p > 550  
  digiWrite(ser,3,1)
  else 
  digiWrite(ser,3,0) 
  end
end
close(ser)
