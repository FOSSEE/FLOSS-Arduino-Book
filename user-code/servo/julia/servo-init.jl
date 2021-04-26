using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.ServoAttach(ser,1)
ArduinoTools.ServoMove(ser,1,30)
sleep(1)
close(ser)
