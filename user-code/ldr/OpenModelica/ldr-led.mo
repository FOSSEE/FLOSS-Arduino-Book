model ldr_led "LED indicating light sensor readings"
  extends Modelica.Icons.Example;
  import sComm = Arduino.SerialCommunication.Functions;
  import strm = Modelica.Utilities.Streams;
  Integer ok(fixed = false);
  Integer analog_in(fixed = false);
  Integer digital_out(fixed = false);
  Integer c_ok(fixed = false);
algorithm
  when initial() then
    ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
    sComm.delay(2000);
    if ok <> 0 then
      strm.print("Unable to open serial port, please check");
    else
      for i in 1:500 loop
        analog_in := sComm.cmd_analog_in(1, 5) "read analog pin 5 (ldr)";
        if analog_in < 300 then
          digital_out := sComm.cmd_digital_out(1, 9, 1) "Turn ON LED";
        else
          digital_out := sComm.cmd_digital_out(1, 9, 0) "Turn OFF LED";
        end if;
        sComm.delay(200);
      end for;
    end if;
  end when;
  //strm.print(String(time));
  when terminal() then
    c_ok := sComm.close_serial(1) "To close the connection safely";
  end when;
  //Run for 500 iterations
  //Setting Threshold value of 300
  annotation(experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02));
end ldr_led;