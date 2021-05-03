ok = open_serial(1, 2, 115200);    // port 2, baudrate 115200
if ok ~= 0 then error('Unable to open serial port, please check'); end
for i = 1:500 //Run for 500 iterations
    val = cmd_analog_in(1, 4)       // read analog pin 4 (thermistor)
    disp(val);
    if(val > 550)                  // Setting Threshold value of 550 	
        cmd_digital_out(1, 3, 1) // Turn ON BUZZER
    else
        cmd_digital_out(1, 3, 0) // Turn OFF BUZZER
    end
    sleep(500);
end
close_serial(1); 
