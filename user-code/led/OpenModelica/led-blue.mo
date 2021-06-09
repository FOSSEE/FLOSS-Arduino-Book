model led_blue "Turn on Blue LED"
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer digital_out(fixed = false);
  Integer c_ok(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
    sComm.delay(2000);
    if ok <> 0 then
      strm.print("Check the serial port and try again");
    else
      sComm.delay(1000);
      digital_out := sComm.cmd_digital_out(1, 9, 1) "This will turn ON the blue LED";
    end if;
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
//strm.print(String(time));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
end led_blue;
