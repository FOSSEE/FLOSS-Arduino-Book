ok = open_serial(1, 2, 115200); // At port 2 with baudrate of 115200
if ok ~= 0, error('Check the serial port and try again'); end
cmd_digital_out(1, 9, 1)        // This will turn the blue LED
close_serial(1);               // To close the connection safely 
