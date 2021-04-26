using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.pinMode(ser,9,"OUTPUT")
for i = 1:500
  p = ArduinoTools.analogRead(ser,5)
  println(p)
  if p > 300  ArduinoTools.digiWrite(ser,9,0)
  else ArduinoTools.digiWrite(ser,9,1) end
end
close(ser)
