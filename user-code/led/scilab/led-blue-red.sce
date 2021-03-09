ok=open_serial(1,2,115200); // At port 2 with baudrate of 115200
if ok ~= 0 error('Check the serial port and try again'); end
cmd_digital_out(1,9,1);     // This turns on the blue Led
cmd_digital_out(1,11,1);    // This turns on the red Led
sleep(5000);                // Delay for 5 seconds
cmd_digital_out(1,9,0);     // This turns off the blue Led
sleep(3000);                // Delay for 3 seconds
cmd_digital_out(1,11,0);    // This turns off the red Led
close_serial(1);            // To close the connection safely
