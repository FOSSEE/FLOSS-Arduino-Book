model led_blue_red "Turn on Red & Blue LED"
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer digital_out(fixed = false);
  Integer c_ok(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
    if ok <> 0 then
      strm.print("Check the serial port and try again");
    else
      sComm.delay(2000);
      digital_out := sComm.cmd_digital_out(1, 9, 1) "This will turn the blue LED";
      digital_out := sComm.cmd_digital_out(1, 11, 1) "This will turn the red LED";
      sComm.delay(5000) "Delay for 5 seconds";
      digital_out := sComm.cmd_digital_out(1, 9, 0) "This turns off the blue Led";
      sComm.delay(3000) "Delay for 3 seconds";
      digital_out := sComm.cmd_digital_out(1, 11, 0) "This turns off the red Led";
    end if;
    strm.print(String(time));
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  annotation(experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
end led_blue_red;