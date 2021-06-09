using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.pinMode(ser, 11, "OUTPUT")
for i = 1:50
  val = ArduinoTools.analogRead(ser, 5)
  println(val)
  if val > 300
    ArduinoTools.digiWrite(ser, 11, 0)
  else
    ArduinoTools.digiWrite(ser, 11, 1)
  end
  sleep(0.5)
end
close(ser)
