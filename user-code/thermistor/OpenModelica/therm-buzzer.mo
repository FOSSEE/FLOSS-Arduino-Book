model therm_buzzer "Sound buzzer depending on thermistor readings"
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer analog_in(fixed = false);
  Integer digital_out(fixed = false);
  Integer c_ok(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 2, 115200) "At port 2 with baudrate of 115200";
    sComm.delay(2000);
    if ok <> 0 then
      strm.print("Unable to open serial port, please check");
    else
      for i in 1:500 loop
        analog_in := sComm.cmd_analog_in(1, 4) "read analog pin 4";
        if analog_in > 500 then
          digital_out := sComm.cmd_digital_out(1, 3, 1) "Turn ON Buzzer";
        else
          digital_out := sComm.cmd_digital_out(1, 3, 0) "Turn OFF Buzzer";
        end if;
        sComm.delay(200);
      end for;
    end if;
  end when;
  //Run for 500 iterations
  //Setting Threshold value of 500
  when terminal() then
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  annotation(experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02));
end therm_buzzer;
