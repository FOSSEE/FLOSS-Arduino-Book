using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.DCMotorSetup(ser,3,1,9,10)
ArduinoTools.DCMotorRun(ser,1,100)
sleep(3)
ArduinoTools.DCMotorRun(ser,1,-100)
sleep(3)
ArduinoTools.DCMotorRelease(ser,1)
close(ser)
