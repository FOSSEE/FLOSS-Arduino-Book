model pot_threshold
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer val(fixed = false);
  Integer digital_out(fixed = false);
  Integer c_ok(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
    sComm.delay(2000);
  end when;
  if ok <> 0 then
    strm.print("Unable to open serial port, please check");
  else
    val := sComm.cmd_analog_in(1, 2) "read analog pin 2";
    strm.print("Potentiometer Readings: " + String(val));
    if val >= 0 and val < 320 then
      digital_out := sComm.cmd_digital_out(1, 11, 1) "Turn ON LED";
      sComm.delay(1000);
      digital_out := sComm.cmd_digital_out(1, 11, 0) "Turn OFF LED";
    elseif val >= 320 and val < 900 then
      digital_out := sComm.cmd_digital_out(1, 10, 1) "Turn ON LED";
      sComm.delay(1000);
      digital_out := sComm.cmd_digital_out(1, 10, 0) "Turn OFF LED";
    elseif val >= 900 and val <= 1023 then
      digital_out := sComm.cmd_digital_out(1, 9, 1) "Turn ON LED";
      sComm.delay(1000);
      digital_out := sComm.cmd_digital_out(1, 9, 0) "Turn OFF LED";
    end if;
  end if;
//Threshold 1
//Threshold 2
  when time >= 10 then
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 1));
end pot_threshold;
