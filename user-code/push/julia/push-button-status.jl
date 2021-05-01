using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.pinMode(ser, 12, "INPUT")
for i = 1:200
  val = ArduinoTools.digiRead(ser, 12)
  println(val)
end
close(ser)
