using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)

for i = 1:20
  p = ArduinoTools.analogRead(ser,4)
  println(p)
  sleep(0.5)
end
close(ser)
