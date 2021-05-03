ok = open_serial(1, 2, 115200); // Port 2 with baudrate 115200
if ok ~= 0 then error('Unable to open serial port.  Please check'); end
for i = 1:50                  // Run for 50 iterations
    val = cmd_analog_in(1, 5);   // read analog pin 5 (ldr)
    disp(val);
    sleep(500)              // Delay of 500 milliseconds
end
c = close_serial(1);          // close serial connection
