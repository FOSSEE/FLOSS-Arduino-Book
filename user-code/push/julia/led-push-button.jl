using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.pinMode(ser, 9, "OUTPUT")
ArduinoTools.pinMode(ser, 12, "INPUT")
for i = 1:20
  val = ArduinoTools.digiRead(ser, 12)
  println(val)
  if val == 0
    ArduinoTools.digiWrite(ser, 9, 0)
  else
    ArduinoTools.digiWrite(ser, 9, 1)
  end
  sleep(0.5)
end
close(ser)
