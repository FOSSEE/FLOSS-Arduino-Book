// Connect to Arduino at port 0 with baudrate of 115200
ok = open_serial(1,0,115200)
// This will turn on and turn off the user LED for every second for 10 times
tic();
for cnt = 1:10
    cmd_digital_out(1,13,0)
    sleep(500)
    cmd_digital_out(1,13,1)
    sleep(500)    
end
t = toc();
disp(t);

// To close the connection safely 
p=close_serial(1)
