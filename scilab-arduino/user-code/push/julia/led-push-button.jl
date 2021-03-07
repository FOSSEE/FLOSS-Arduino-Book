using SerialPorts
include("ArduinoTools.jl")

ser = connectBoard(115200)
pinMode(ser,9,"OUTPUT")
pinMode(ser,12,"INPUT")
for i = 1:200
  p = digiRead(ser,12)
  if p == 0
    digiWrite(ser,9,0)
  else
    digiWrite(ser,9,1)
  end
end
close(ser)
