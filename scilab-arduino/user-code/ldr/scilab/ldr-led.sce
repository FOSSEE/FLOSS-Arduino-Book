ok=open_serial(1,2,115200);    // port 2, baudrate 115200
if ok~=0 then error('Unable to open serial port, please check'); end
for i=1:500 //Run for 500 iterations
    p=cmd_analog_in(1,5)       // read analog pin 5 (ldr)
    disp(p);
    if(p<300)                  // Setting Threshold value of 300 	
        cmd_digital_out(1,9,1) // Turn ON LED
    else
        cmd_digital_out(1,9,0) // Turn OFF LED
    end
end
close_serial(1)
