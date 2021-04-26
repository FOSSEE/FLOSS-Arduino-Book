using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.ServoAttach(ser,1)
for i = 1:500
  p = ArduinoTools.analogRead(ser,2)
  p = p*(180/1023)
  q = round(Int,floor(p))
  ArduinoTools.ServoMove(ser,1,q)
  sleep(0.5)
end
ArduinoTools.ServoDetach(ser,1)
close(ser)
