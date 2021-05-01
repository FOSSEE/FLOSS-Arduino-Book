ok = open_serial(1, 2, 115200);         // port 2, baudrate 115200
if ok ~= 0 then error('Unable to open serial port, please check'); end
for i = 1:1000                        //Run for 1000 iterations
    val = cmd_digital_in(1, 12)
    if val == 0
       cmd_digital_out(1, 9, 0)
    else
       cmd_digital_out(1, 9, 1)
    end
end
close_serial(1); 

