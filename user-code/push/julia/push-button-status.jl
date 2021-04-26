using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.pinMode(ser,12,"INPUT")
for i = 1:100
  p = ArduinoTools.digiRead(ser,12)
  println(p)
end
close(ser)
