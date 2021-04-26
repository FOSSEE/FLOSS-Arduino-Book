using SerialPorts
include("ArduinoTools.jl")
i = 0
x = []
y = []
ser = ArduinoTools.connectBoard(115200)
for i = 1:20
  p = ArduinoTools.analogRead(ser,5)

  sleep(0.5)
  println(p)
end

close(ser)
