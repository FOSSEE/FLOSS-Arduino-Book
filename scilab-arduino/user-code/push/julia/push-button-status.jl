using SerialPorts
include("ArduinoTools.jl")

ser = connectBoard(115200)
pinMode(ser,12,"INPUT")
for i = 1:100
  p = digiRead(ser,12)
  println(p)
end
close(ser)
