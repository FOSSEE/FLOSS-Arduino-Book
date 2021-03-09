ok=open_serial(1,2,115200); // port 2, baud rate 115200
if ok~=0 then error('Unable to open serial port, please check'), end
for x=1:10//Run for 10 iterations
    p=cmd_analog_in(1,2)
    if(p>=0 & p<320) then        //threshold 1 
        cmd_digital_out(1,11,1)
        sleep(1000)
        cmd_digital_out(1,11,0)
    elseif p>=320 &p<=900        //threshold 2 
        cmd_digital_out(1,10,1)
        sleep(1000)
        cmd_digital_out(1,10,0)
    elseif p>900 & p<=1023       //threshold 3
        cmd_digital_out(1,9,1)
        sleep(1000)
        cmd_digital_out(1,9,0)
    end
end
close_serial(1)
