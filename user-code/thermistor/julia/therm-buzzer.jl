using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.pinMode(ser, 3, "OUTPUT")
for i = 1:50
  val = ArduinoTools.analogRead(ser, 4)
  println(val)
  if (val > 550)  
    ArduinoTools.digiWrite(ser, 3, 1)
  else 
    ArduinoTools.digiWrite(ser, 3, 0) 
  end
  sleep(0.5)
end
close(ser)
