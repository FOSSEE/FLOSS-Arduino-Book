using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
for i = 1:50
  val = ArduinoTools.analogRead(ser, 5)
  println(val)
  sleep(0.5)
end
close(ser)
