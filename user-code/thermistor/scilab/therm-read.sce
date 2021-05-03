ok = open_serial(1, 2, 115200); // Port 2 with baudrate 115200
if ok ~= 0 then error('Unable to open serial port.  Please check') end
for i = 1:20                  // Run for 20 iterations
    val = cmd_analog_in(1, 4);   // read analog pin 4 (thermistor)
    disp(val);
    sleep(500);               // Delay of 500 milliseconds
end
c = close_serial(1);          // close serial connection
