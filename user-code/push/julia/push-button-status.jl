using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.pinMode(ser, 12, "INPUT")
for i = 1:20
  val = ArduinoTools.digiRead(ser, 12)
  println(val)
  sleep(0.5)
end
close(ser)
