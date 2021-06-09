using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.pinMode(ser, 9, "OUTPUT")
ArduinoTools.pinMode(ser, 10, "OUTPUT")
ArduinoTools.pinMode(ser, 11, "OUTPUT")
for i = 1:20
  val = ArduinoTools.analogRead(ser, 2)
  println(val)
  if (val >= 0 && val < 320)
    ArduinoTools.digiWrite(ser, 11, 1)
    sleep(1)
    ArduinoTools.digiWrite(ser, 11, 0)
  elseif (val >= 320 && val < 900)
    ArduinoTools.digiWrite(ser, 10, 1)
    sleep(1)
    ArduinoTools.digiWrite(ser, 10, 0)
  elseif (val >= 900 && val <= 1023)
    ArduinoTools.digiWrite(ser, 9, 1)
    sleep(1)
    ArduinoTools.digiWrite(ser, 9, 0)
  end
end
close(ser)
