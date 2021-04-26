using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.pinMode(ser,10,"OUTPUT")
for i = 1:5
  ArduinoTools.digiWrite(ser,10,1)
  sleep(1)
  ArduinoTools.digiWrite(ser,10,0)
  sleep(1)
end
close(ser)
