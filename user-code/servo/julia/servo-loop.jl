using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.ServoAttach(ser, 1)
angle = 20
for i = 1:10
  ArduinoTools.ServoMove(ser, 1, angle*i)
  sleep(1)
end
ArduinoTools.ServoDetach(ser, 1)
close(ser)
