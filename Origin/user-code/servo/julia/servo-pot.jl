using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.ServoAttach(ser, 1)
for i = 1:50
  val = ArduinoTools.analogRead(ser, 2)
  val = val*(180/1023)
  val = round(Int, floor(val))
  ArduinoTools.ServoMove(ser, 1, val)
  sleep(0.5)
end
ArduinoTools.ServoDetach(ser, 1)
close(ser)
