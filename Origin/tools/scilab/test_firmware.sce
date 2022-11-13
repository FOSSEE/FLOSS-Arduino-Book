mode(0)
h = open_serial(1,0,115200);
for i = 1:3
  write_serial(1,"v",1);
  read_serial(1,2)
end
close_serial(1);
