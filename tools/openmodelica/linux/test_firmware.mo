model test_firmware "Testing SerialCommunication with Arduino"
  
import sComm=Arduino.SerialCommunication.Functions;
Integer h(fixed = false);
Integer byte_read(fixed = false);
//String str(fixed =false);
Integer wr(fixed =false);
Integer c_OK(fixed =false);
algorithm
  when initial() then
  h:=sComm.open_serial(1,0,115200);
  sComm.delay(2000);
  wr:=sComm.write_serial(1,"v",1);
  byte_read:= sComm.read_serial(1,2);  
  c_OK := sComm.close_serial(1) "To close the connection safely";
  end when;
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 10));

end test_firmware;