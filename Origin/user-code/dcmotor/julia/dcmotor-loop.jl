using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.DCMotorSetup(ser, 3, 1, 9, 10)
for i = 1:4
  ArduinoTools.DCMotorRun(ser, 1, 100)
  sleep(3)
  ArduinoTools.DCMotorRun(ser, 1, 0)
  sleep(2)
  ArduinoTools.DCMotorRun(ser, 1, -100)
  sleep(2)
end
ArduinoTools.DCMotorRelease(ser, 1)
close(ser)
