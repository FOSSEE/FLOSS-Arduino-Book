using SerialPorts
include("ArduinoTools.jl")

ser = ArduinoTools.connectBoard(115200)
ArduinoTools.pinMode(ser, 9, "OUTPUT")
ArduinoTools.digiWrite(ser, 9, 1)
sleep(2)
ArduinoTools.digiWrite(ser, 9, 0)
close(ser)
