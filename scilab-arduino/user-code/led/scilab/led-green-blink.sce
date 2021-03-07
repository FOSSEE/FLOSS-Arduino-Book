ok= open_serial(1,0,115200); // At port 2 with baudrate of 115200
if ok ~= 0 error('Check the serial port and try again'); end
for i=1:5                    // Running for loop, 5 times
   cmd_digital_out(1,10,1);  // This turns on the green Led
   sleep(1000);              // Delay for 1 second
   cmd_digital_out(1,10,0);  // This turns off the green Led
   sleep(1000);              // Delay for 1 second
end
close_serial(1);             // To close the connection safely
