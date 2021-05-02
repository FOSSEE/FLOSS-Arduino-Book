using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.pinMode(ser, 9, "OUTPUT")
ArduinoTools.pinMode(ser, 11, "OUTPUT")
ArduinoTools.digiWrite(ser, 9, 1)
ArduinoTools.digiWrite(ser, 11, 1)
sleep(5)
ArduinoTools.digiWrite(ser, 9, 0)
sleep(3)
ArduinoTools.digiWrite(ser, 11, 0)
close(ser)
