ok=open_serial(1,2,115200);      // port 2, baud rate 115200
if ok~=0 then error('Unable to open serial port, please check'), end
for i=1:1000                     // Run for 1000 iterations
    val = cmd_digital_in(1,12);  // Read the status of pin 12
    cmd_arduino_meter(val);
end
close_serial(1)                  // To close the connection safely 


