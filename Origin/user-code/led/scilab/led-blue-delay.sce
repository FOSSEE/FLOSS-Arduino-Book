ok = open_serial(1, 2, 115200);
if ok ~= 0, error('Check the serial port and try again'); end
cmd_digital_out(1, 9, 1) // turn blue LED on
sleep(2000)            // let the blue LED be on for two seconds
cmd_digital_out(1, 9, 0) // turn off blue LED
close_serial(1);         // close the connection safely
