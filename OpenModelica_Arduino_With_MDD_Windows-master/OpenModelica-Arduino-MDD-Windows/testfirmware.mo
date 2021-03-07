model testfirmware "test serial communication with Arduino"
import sComm=Arduino.SerialCommunication.Functions;
Integer h(fixed=false);
Integer w(fixed=false);
Integer r(fixed=false);
Integer c(fixed=false);
algorithm
  h := sComm.open_serial(1,2,9600);
  w := sComm.write_serial(1, "v", 1);
  r := sComm.read_serial(1,2);
  c := sComm.close_serial(1);
end testfirmware;
