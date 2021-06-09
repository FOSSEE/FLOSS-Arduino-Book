model therm_buzzer "Sound buzzer depending on thermistor readings"
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
    val := sComm.cmd_analog_in(1, 4) "read analog pin 4";
    strm.print("Thermistor Readings: " + String(val));
    if val > 550 then
      digital_out := sComm.cmd_digital_out(1, 3, 1) "Turn ON Buzzer";
    else
      digital_out := sComm.cmd_digital_out(1, 3, 0) "Turn OFF Buzzer";
    end if;
    sComm.delay(500);
  end if;
  digital_out := sComm.cmd_digital_out(1, 3, 0) "Turn OFF Buzzer";
//for i in 1:500 loop
//end for;
//Run for 500 iterations
//Setting Threshold value of 500
  when terminal() then
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.1));
end therm_buzzer;
