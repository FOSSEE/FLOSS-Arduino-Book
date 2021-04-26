using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.pinMode(ser,3,"OUTPUT")
for i = 1:50
  p = ArduinoTools.analogRead(ser,4)
  println(p)
  if p > 550  
    ArduinoTools.digiWrite(ser,3,1)
  else 
    ArduinoTools.digiWrite(ser,3,0) 
  end
end
close(ser)
