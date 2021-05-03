ok = open_serial(1, 2, 115200);    // port 2, baudrate 115200
if ok ~= 0 then error('Unable to open serial port, please check'); end
for i = 1:50 //Run for 50 iterations
    val = cmd_analog_in(1, 5)       // read analog pin 5 (ldr)
    disp(val);
    if(val < 300)                  // Setting Threshold value of 300 	
        cmd_digital_out(1, 11, 1) // Turn ON LED
    else
        cmd_digital_out(1, 11, 0) // Turn OFF LED
    end
    sleep(500)
end
close_serial(1); 
