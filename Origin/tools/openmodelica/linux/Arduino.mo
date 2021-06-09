package Arduino
  extends Arduino.SerialCommunication.Icons.GenericICPackage;

  package SerialCommunication "Serial Communication Package for Arduino"
    extends Arduino.SerialCommunication.Icons.FunctionLayerIcon;
    import ModelicaReference.Operators;

    package Functions
      extends Modelica.Icons.Package;
      import Modelica;

      function open_serial "Command to initialize the serial port which is connected to Arduino"
        extends Modelica.Icons.Function;
        input Integer handle, port, baudrate;
        output Integer OK;
      
        external OK = open_serial(handle, port, baudrate) annotation(
          Library = "SerialComm");
        annotation(
          Documentation(info = "<html>
<h4>Syntax</h4>
<blockquote><pre>
Arduino.SerialCommunication.Functions.<b>open_serial</b>(handle,port,baudrate);
</pre></blockquote>
<h4>Description</h4>
<p>
Establishes a serial communication using port number \"port\".To connect to the Arduino board, check the port number from the device manager or check it from the Arduino software.
</p>
</html>"));
      end open_serial;

      function read_serial "read characters from serial port"
        extends Modelica.Icons.Function;
        input Integer handle;
        input Integer size;
        output Integer r_OK;
      protected
        Integer buf[size + 1];
        //String buf;
      
        external r_OK = read_serial(handle, buf, size) annotation(
          Library = "SerialComm");
        annotation(
          Documentation(info = "<html>
<h4>Syntax</h4>
<blockquote><pre>
Arduino.SerialCommunication.Functions.<b>read_serial</b>(handle,size);
</pre></blockquote>
<h4>Description</h4>
<p>The translation setting of openserial can come in the way, affecting the number of characters effectively read. If that is the case, omitting the parameter n might be a bad idea, as scilab can hang. This would happen if the input stream contains CR or LF characters which are filtered out: in such cases serialstatus counts them, but readserial does not see them and keeps wating (if the blocking mode of openserial was true) until the total number is received.
</p>
</html>"));
      end read_serial;

      //algorithm
      //Modelica.Utilities.Streams.print(String(buf));

      function write_serial "write to the serial port"
        extends Modelica.Icons.Function;
        input Integer handle;
        input String str;
        input Integer size;
        output Integer w_OK;
      
        external w_OK = write_serial(handle, str, size) annotation(
          Library = "SerialComm");
        annotation(
          Documentation(info = "<html>
<h4>Syntax</h4>
<blockquote><pre>
Arduino.SerialCommunication.Functions.<b>write_serial</b>(handle,str,size);
</pre></blockquote>
<h4>Description</h4>
<p>No end of line character is appended to the string; the user might have to add it if the device being talked to requires it. The Tcl command puts -nonewline is used. In addition, the translation mode of openserial can come into way.
</p>
</html>"));
      end write_serial;

      function close_serial "Command to close the serial port which is connected to Arduino"
        extends Modelica.Icons.Function;
        input Integer handle;
        output Integer c_OK;
      
        external c_OK = close_serial(handle) annotation(
          Library = "SerialComm");
        annotation(
          Documentation(info = "<html>
<h4>Syntax</h4>
<blockquote><pre>
Arduino.SerialCommunication.Functions.<b>close_serial</b>(handle);
</pre></blockquote>
<h4>Description</h4>
<p>Closes the port for serial communication specified by \"handle\".It is important to close the serial port after use, else the port would be busy and restart of Scilab might required to connect to it again.
</p>
</html>"));
      end close_serial;

      function status_serial "get status of the serial port"
        extends Modelica.Icons.Function;
        input Integer handle;
        output Integer stat_OK;
      protected
        Integer bytes[2];
      
        external stat_OK = status_serial(handle, bytes) annotation(
          Library = "SerialComm");
        annotation(
          Documentation(info = "<html>
<h4>Syntax</h4>
<blockquote><pre>
Arduino.SerialCommunication.Functions.<b>status_serial</b>(handle);
</pre></blockquote>
<h4>Description</h4>
<p>Provides status of serial communication channel specified by \"handle\".Get some information about the number of characters present in the input and output buffers of the serial port, and about the status lines (DTS, CTS, etc.).The translation setting of openserial can come in the way. If the input stream contains CR or LF characters which are filtered out, openserial counts them but readserial does not see them.
</p>
</html>"));
      end status_serial;

      function cmd_digital_out "Command to sent out digital signal to a connected Arduino board"
        extends Modelica.Icons.Function;
        input Integer h, pin_no, val;
        output Integer digital_w_OK;
      
        external digital_w_OK = cmd_digital_out(h, pin_no, val) annotation(
          Library = "Digital");
        annotation(
          Documentation(info = "<html>
<h4>Syntax</h4>
<blockquote><pre>
Arduino.SerialCommunication.Functions.<b>cmd_digital_out</b>(handle,pin_no,value);
</pre></blockquote>
<h4>Description</h4>
<p>The Arduino board has a set of logical ports (digital) that are used for writing or reading data from a component.
To map a UNO, ports 2-13 are available (0 and 1 are used for serial transmission). For MEGA board, ports 2-53 are available. The port takes the low logic level (0) or logic high (1) which corresponds to the reference voltage.
</p>
</html>"));
      end cmd_digital_out;

      function cmd_digital_in "Command to read in digital signal from a connected Arduino board"
        extends Modelica.Icons.Function;
        input Integer h, pin_no;
        output Integer digital_in;
      
        external digital_in = cmd_digital_in(h, pin_no) annotation(
          Library = "Digital");
        annotation(
          Documentation(info = "<html>
<h4>Syntax</h4>
<blockquote><pre>
Arduino.SerialCommunication.Functions.<b>cmd_digital_in</b>(handle,pin_no);
</pre></blockquote>
<h4>Description</h4>
<p>The Arduino board has a set of logical ports (digital) that are used for writing or reading data from a component.
To map a UNO, ports 2-13 are available (0 and 1 are used for serial transmission). For MEGA board, ports 2-53 are available. The port takes the low logic level (0) or logic high (1) which corresponds to the reference voltage.
</p>
</html>"));
      end cmd_digital_in;

      function delay "Provides delay.Suspends Openmodelica."
        extends Modelica.Icons.Function;
        input Integer t;
      
        external delay(t) annotation(
          Library = "delay");
        annotation(
          Documentation(info = "<html>
  <h4>Syntax</h4>
  <blockquote><pre>
  Arduino.SerialCommunication.Functions.<b>delay</b>(milliseconds);
  </pre></blockquote>
  <h4>Description</h4>
  <p>Delay process for specified number of miliseconds specified by the argument. The actual suspension time may be longer because of other activities in the system, or because of the time spent in processing the call.
  </p>
  </html>"));
      end delay;

      function cmd_analog_in "Command to read in analog signal from a connected Arduino board"
        extends Modelica.Icons.Function;
        input Integer h, pin_no;
        output Integer val;
      
        external val = cmd_analog_in(h, pin_no) annotation(
          Library = "Analog");
        annotation(
          Documentation(info = "<html>
<h4>Syntax</h4>
<blockquote><pre>
Arduino.SerialCommunication.Functions.<b>cmd_analog_in</b>(handle,pin_no);
</pre></blockquote>
<h4>Description</h4>
<p>Arduino UNO board has 6 analog input ports (A0 to A5), the Arduino Mega board has 16 analog input ports (A0 to A15). The 10 bits channels convert the analog input from 0 to 5 volts, to a digital value between 0 and 1023.
</p>
</html>"));
      end cmd_analog_in;

      function cmd_analog_out "Command to sent out analog signal to a connected Arduino board"
        extends Modelica.Icons.Function;
        input Integer h, pin_no;
        input Real val;
        output Integer analog_w_OK;
      
        external analog_w_OK = cmd_analog_out(h, pin_no, val) annotation(
          Library = "Analog");
        annotation(
          Documentation(info = "<html>
<h4>Syntax</h4>
<blockquote><pre>
Arduino.SerialCommunication.Functions.<b>cmd_analog_out</b>(handle,pin_no,val);
</pre></blockquote>
<h4>Description</h4>
<p>The analog outputs of the Arduino Uno is available at the pins 3,5,6,9,10 and 11, while on the Mega board, the outputs are on pins 1-13 and 44-46. It is a bit misleading to use the term 'analog output', because in order to generate this output while minimizing energy losses, the Arduino uses PWM (Pulse Width Modulation) available on these ports. By varying the duty cycle of the PWM is altered the average voltage across the component connected to this port, which has the effect of having a analog output voltage.
The input port accepts the value from 0 to 255 which is correspoding to the duty cycle of 0 to 100%. In other words, sending 0 to the block will generate 0 V output at the port, 127 generates 2.5V and 255 generates 5V. (the port is 8 bits, so the resolutions of output would be 2^8 =256).
</p>
</html>"));
      end cmd_analog_out;

      function cmd_analog_in_volt "Command to read in analog signal from a connected Arduino board"
        extends Modelica.Icons.Function;
        input Integer h, pin_no;
        output Integer val;
      
        external val = cmd_analog_in_volt(h, pin_no) annotation(
          Library = "Analogv");
        annotation(
          Documentation(info = "<html>
  <h4>Syntax</h4>
  <blockquote><pre>
  Arduino.SerialCommunication.Functions.<b>cmd_analog_in_volt</b>(handle,pin_no);
  </pre></blockquote>
  <h4>Description</h4>
  <p>Arduino UNO board has 6 analog input ports (A0 to A5), the Arduino Mega board has 16 analog input ports (A0 to A15). The 10 bits channels convert the analog input from 0 to 5 volts, to a digital value between 0 and 1023. This function scale the reading to 0-5 so the user could get the measured voltage directly.
  </p>
  </html>"));
      end cmd_analog_in_volt;

      function cmd_analog_out_volt "Command to sent out analog signal to a connected Arduino board"
        extends Modelica.Icons.Function;
        input Integer h, pin_no;
        input Real val;
        output Integer analog_v_wOK;
      
        external analog_v_wOK = cmd_analog_out_volt(h, pin_no, val) annotation(
          Library = "Analogv");
        annotation(
          Documentation(info = "<html>
  <h4>Syntax</h4>
  <blockquote><pre>
  Arduino.SerialCommunication.Functions.<b>cmd_analog_out_volt</b>(handle,pin_no,val);
  </pre></blockquote>
  <h4>Description</h4>
  <p>The analog outputs of the Arduino Uno is available at the pins 3,5,6,9,10 and 11, while on the Mega board, the outputs are on pins 1-13 and 44-46. It is a bit misleading to use the term 'analog output', because in order to generate this output while minimizing energy losses, the Arduino uses PWM (Pulse Width Modulation) available on these ports. By varying the duty cycle of the PWM is altered the average voltage across the component connected to this port, which has the effect of having a analog output voltage.
  </p>
  </html>"));
      end cmd_analog_out_volt;

      function cmd_dcmotor_setup "Command to setup pins to control DC motor"
        extends Modelica.Icons.Function;
        input Integer handle, driver_type, motor_no, pin1, pin2;
      
        external cmd_dcmotor_setup(handle, driver_type, motor_no, pin1, pin2) annotation(
          Library = "DCMotor");
        annotation(
          Documentation(info = "<html>
      <h4>Syntax</h4>
      <blockquote><pre>
      Arduino.SerialCommunication.Functions.<b>cmd_dcmotor_setup</b>(handle,driver_type,motor_no,pin_no1,pin_no2);
      </pre></blockquote>
      <h4>Description</h4>
      <p>Arduino board does not deliver enough power, so it is necessary to use a H-bridge circuit/IC to control the motor. There are several types of H-bridge IC that do not all operate on the same principle. For example, the L298 requires the use of a PWM signal with current sense. The L293 uses two PWM to set the speed and direction. Ready-to-use Shields are also available.
      Remember that the PWM is 8-bit (0 to 255). The input of the block could accept any value, but it would saturate at +- 255.
      </p>
      </html>"));
      end cmd_dcmotor_setup;

      function cmd_dcmotor_run "Command to run DC motor after setting up"
        extends Modelica.Icons.Function;
        input Integer handle, motor_no, val;
      
        external cmd_dcmotor_run(handle, motor_no, val) annotation(
          Library = "DCMotor");
        annotation(
          Documentation(info = "<html>
    <h4>Syntax</h4>
    <blockquote><pre>
    Arduino.SerialCommunication.Functions.<b>cmd_dcmotor_run</b>(handle,motor_no,value);
    </pre></blockquote>
    <h4>Description</h4>
    <p>Arduino board does not deliver enough power, so it is necessary to use a H-bridge circuit/IC to control the motor. There are several types of H-bridge IC that do not all operate on the same principle. For example, the L298 requires the use of a PWM signal with current sense. The L293 uses two PWM to set the speed and direction. Ready-to-use Shields are also available.
    Remember that the PWM is 8-bit (0 to 255). The input of the block could accept any value, but it would saturate at +- 255.
    </p>
    </html>"));
      end cmd_dcmotor_run;

      function cmd_dcmotor_release "Command to release pins which have setup for DC motor"
        extends Modelica.Icons.Function;
        input Integer handle, motor_no;
      
        external cmd_dcmotor_release(handle, motor_no) annotation(
          Library = "DCMotor");
        annotation(
          Documentation(info = "<html>
    <h4>Syntax</h4>
    <blockquote><pre>
    Arduino.SerialCommunication.Functions.<b>cmd_dcmotor_release</b>(handle,motor_no);
    </pre></blockquote>
    <h4>Description</h4>
    <p>Arduino board does not deliver enough power, so it is necessary to use a H-bridge circuit/IC to control the motor. There are several types of H-bridge IC that do not all operate on the same principle. For example, the L298 requires the use of a PWM signal with current sense. The L293 uses two PWM to set the speed and direction. Ready-to-use Shields are also available.
    Remember that the PWM is 8-bit (0 to 255). The input of the block could accept any value, but it would saturate at +- 255.
    </p>
    </html>"));
      end cmd_dcmotor_release;

      function cmd_servo_attach "Command to attach servo motor to Arduino"
        extends Modelica.Icons.Function;
        input Integer handle, servo_no;
      
        external cmd_servo_attach(handle, servo_no) annotation(
          Library = "ServoMotor");
        annotation(
          Documentation(info = "<html>
  <h4>Syntax</h4>
  <blockquote><pre>
  Arduino.SerialCommunication.Functions.<b>cmd_servo_attach</b>(handle,servo_no);
  </pre></blockquote>
  <h4>Description</h4>
  <p>A servomotor is an rotary actuator consist of an electric motor, gears, a potentiometer and an analogue or digital electronics for control. The servomotor usualy used for a position control application (or speed for continuous rotation servos).
  The user must give the command of the position setpoint or desired speed. This command is sent to the actuator in pulses spaced by 10 to 20 ms. The coding of these pulses is made such that a pulse of 1.5 ms corresponding to the centered position (rest), a pulse of 1 ms corresponds to an angle of 90° in the anticlockwise direction, and a pulse 2 ms corresponds to an angle of 90° clockwise. All other pulse widths give intermediate values​​.
  A servomotor for continuous rotation, the pulse width control the rotational speed and the direction. It is recommended to use a voltage regulator to power the servomotor instead of using the Arduino board power. For simplicity, the function takes an input commnad in degrees from 0 to 180. Two actuators can be controlled with this toolbox. (modified version of 3 motors available)
  </p>
  </html>"));
      end cmd_servo_attach;

      function cmd_servo_move "Command to run servo motor which has been setup"
        extends Modelica.Icons.Function;
        input Integer handle, servo_no, val;
      
        external cmd_servo_move(handle, servo_no, val) annotation(
          Library = "ServoMotor");
        annotation(
          Documentation(info = "<html>
  <h4>Syntax</h4>
  <blockquote><pre>
  Arduino.SerialCommunication.Functions.<b>cmd_servo_move</b>(handle,servo_no,value);
  </pre></blockquote>
  <h4>Description</h4>
  <p>A servomotor is an rotary actuator consist of an electric motor, gears, a potentiometer and an analogue or digital electronics for control. The servomotor usualy used for a position control application (or speed for continuous rotation servos).
  The user must give the command of the position setpoint or desired speed. This command is sent to the actuator in pulses spaced by 10 to 20 ms. The coding of these pulses is made such that a pulse of 1.5 ms corresponding to the centered position (rest), a pulse of 1 ms corresponds to an angle of 90° in the anticlockwise direction, and a pulse 2 ms corresponds to an angle of 90° clockwise. All other pulse widths give intermediate values​​.
  A servomotor for continuous rotation, the pulse width control the rotational speed and the direction. It is recommended to use a voltage regulator to power the servomotor instead of using the Arduino board power. For simplicity, the function takes an input commnad in degrees from 0 to 180. Two actuators can be controlled with this toolbox. (modified version of 3 motors available)
  </p>
  </html>"));
      end cmd_servo_move;

      function cmd_servo_detach "Command to release the pin which has been setup for servo motor"
        extends Modelica.Icons.Function;
        input Integer handle, servo_no;
      
        external cmd_servo_attach(handle, servo_no) annotation(
          Library = "ServoMotor");
        annotation(
          Documentation(info = "<html>
  <h4>Syntax</h4>
  <blockquote><pre>
  Arduino.SerialCommunication.Functions.<b>cmd_servo_detach</b>(handle,servo_no);
  </pre></blockquote>
  <h4>Description</h4>
  <p>A servomotor is an rotary actuator consist of an electric motor, gears, a potentiometer and an analogue or digital electronics for control. The servomotor usualy used for a position control application (or speed for continuous rotation servos).
  The user must give the command of the position setpoint or desired speed. This command is sent to the actuator in pulses spaced by 10 to 20 ms. The coding of these pulses is made such that a pulse of 1.5 ms corresponding to the centered position (rest), a pulse of 1 ms corresponds to an angle of 90° in the anticlockwise direction, and a pulse 2 ms corresponds to an angle of 90° clockwise. All other pulse widths give intermediate values​​.
  A servomotor for continuous rotation, the pulse width control the rotational speed and the direction. It is recommended to use a voltage regulator to power the servomotor instead of using the Arduino board power. For simplicity, the function takes an input commnad in degrees from 0 to 180. Two actuators can be controlled with this toolbox. (modified version of 3 motors available)
  </p>
  </html>"));
      end cmd_servo_detach;

      function ieeesingle2num "ieee-745 floating point converter"
        extends Modelica.Icons.Function;
        input String hexa;
        output Real y;
      
        external y = ieeesingle2num(hexa) annotation(
          Library = "ieeesingle2num");
        annotation(
          Documentation(info = "<html>
<h4>Syntax</h4>
<blockquote><pre>
Arduino.SerialCommunication.Functions.<b>ieeesingle2num</b>(hexa);
</pre></blockquote>
<h4>Description</h4>
<p>Converts an hexadecimal integer to ieee single precision format
    </p>
</html>"));
      end ieeesingle2num;

      function math_floor "Floor function"
        extends Modelica.Icons.Function;
        input Real x;
        output Integer y;
      
        external y = mfloor(x) annotation(
          Library = "floor");
        annotation(
          Documentation(info = "<html>
    <h4>Syntax</h4>
    <blockquote><pre>
    Arduino.SerialCommunication.Functions.<b>math_floor</b>(x);
    </pre></blockquote>
    <h4>Description</h4>
    <p>Returns the greatest integer less than or equal to x
    </p>
    </html>"));
      end math_floor;

      function getArduinoVersion "Returns the Arduino version used"
        extends Modelica.Icons.Function;
        output String arduinoVersion(fixed = true);
      algorithm
        arduinoVersion := "1.1";
        annotation(
          Documentation(info = "<html>
  <h4>Syntax</h4>
  <blockquote><pre>
  Arduino.SerialCommunication.<b>getArduinoVersion</b>();
  </pre></blockquote>
  <h4>Description</h4>
  <p>Gives the version of the arduino used.
  </p>
  </html>"));
      end getArduinoVersion;

      function cmd_encoder_init "Initiates the encoder"
        extends Modelica.Icons.Function;
        input Integer h, encoder_mode, pin_no1, pin_no2;
      
        external cmd_encoder_init(h, encoder_mode, pin_no1, pin_no2) annotation(
          Library = "Encoder");
        annotation(
          Documentation(info = "<html>
  <h4>Syntax</h4>
  <blockquote><pre>
  Arduino.SerialCommunication.<b>cmd_encoder_init</b>(handle,encoder_mode,pin_no1,pin_no2);
  </pre></blockquote>
  <h4>Description</h4>
  <p>Used to read encoder signal from one or more channels
  </p>
  </html>"));
      end cmd_encoder_init;

      //Incomplete

      package MDD_Servo
        extends Modelica.Icons.Package;

        class Init
          extends ExternalObject;

          function constructor "Return device handle"
            extends .Modelica.Icons.Function;
            import Modelica_DeviceDrivers.EmbeddedTargets.AVR.Functions;
            import Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types;
            import sComm = Arduino.SerialCommunication.Functions;
            import Arduino.SerialCommunication.Functions.MDD_Servo;
            input sComm.Types.Servo_no servo_no;
            output sComm.Functions.MDD_Servo.Init servo;
          
            external "C" servo = MDD_avr_servo_initialize(servo_no) annotation(
              Include = "#include \"/home/manas/OpenModelica/Resources/Include/MDDAVRServo.h\"");
          end constructor;

          function destructor "Destructor"
            extends .Modelica.Icons.Function;
            import Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types;
            import sComm = Arduino.SerialCommunication.Functions;
            import Arduino.SerialCommunication.Functions.MDD_Servo;
            input sComm.Types.Servo_no servo_no "Device handle";
          
            external "C" MDD_avr_servo_finalize(servo_no) annotation(
              Include = "#include \"/home/manas/OpenModelica/Resources/Include/MDDAVRServo.h\"");
          end destructor;
        end Init;

        function Move
          extends Modelica.Icons.Function;
          import sComm = Arduino.SerialCommunication.Functions;
          input sComm.Functions.MDD_Servo.Init servo;
          input Integer value;
        
          external "C" MDD_avr_servo_move(servo, value) annotation(
            Include = "#include \"/home/manas/OpenModelica/Resources/Include/MDDAVRServo.h\"");
        end Move;
      end MDD_Servo;
    end Functions;

    package Examples
      extends Modelica.Icons.ExamplesPackage;

      package led
        extends Modelica.Icons.ExamplesPackage;

        model led_blue "Turn on Blue LED"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer digital_out(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
            sComm.delay(2000);
            if ok <> 0 then
              strm.print("Check the serial port and try again");
            else
              sComm.delay(1000);
              digital_out := sComm.cmd_digital_out(1, 9, 1) "This will turn ON the blue LED";
            end if;
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
          annotation(
            experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
        end led_blue;

        model led_blue_delay "Turn on Blue LED for a period of 2 seconds"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer digital_out(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
            sComm.delay(2000);
            if ok <> 0 then
              strm.print("Check the serial port and try again");
            else
              digital_out := sComm.cmd_digital_out(1, 9, 1) "This will turn ON the blue LED";
              sComm.delay(2000) "let the blue LED be on for two seconds";
              digital_out := sComm.cmd_digital_out(1, 9, 0) "This will turn OFF the blue LED";
              sComm.delay(2000) "let the blue LED be off for two seconds";
            end if;
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
          annotation(
            experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
        end led_blue_delay;

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
            sComm.delay(2000);
            if ok <> 0 then
              strm.print("Check the serial port and try again");
            else
              sComm.delay(2000);
              digital_out := sComm.cmd_digital_out(1, 9, 1) "This will turn ON the blue LED";
              digital_out := sComm.cmd_digital_out(1, 11, 1) "This will turn ON the red LED";
              sComm.delay(5000) "Delay for 5 seconds";
              digital_out := sComm.cmd_digital_out(1, 9, 0) "This will turn OFF the blue LED";
              sComm.delay(3000) "Delay for 3 seconds";
              digital_out := sComm.cmd_digital_out(1, 11, 0) "This will turn OFF the red LED";
            end if;
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
          annotation(
            experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
        end led_blue_red;

        model led_green_blink "This will turn on and turn off the green LED for every second for 5 times"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer digital_out(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
            sComm.delay(2000);
            if ok <> 0 then
              strm.print("Check the serial port and try again");
            else
              for i in 1:5 loop
                digital_out := sComm.cmd_digital_out(1, 10, 1) "This will turn ON the green LED";
                sComm.delay(1000) "Delay for 1 second";
                digital_out := sComm.cmd_digital_out(1, 10, 0) "This will turn OFF the green Led";
                sComm.delay(1000) "Delay for 1 second";
              end for;
            end if;
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
          annotation(
            experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
        end led_green_blink;
      end led;

      package push
        extends Modelica.Icons.ExamplesPackage;

        model led_push_button "Conrolling LED with PushButton"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer val(fixed = false);
          Integer digital_out(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
            sComm.delay(2000);
          end when;
          if ok <> 0 then
            strm.print("Unable to open serial port, please check");
          else
            val := sComm.cmd_digital_in(1, 12) "Read from digital pin 12";
            if val == 0 then
              strm.print("0");
              digital_out := sComm.cmd_digital_out(1, 9, 0) "This will turn OFF the blue LED";
              sComm.delay(200);
            else
              strm.print("1");
              digital_out := sComm.cmd_digital_out(1, 9, 1) "This will turn ON the blue LED";
              sComm.delay(200);
            end if;
          end if;
//for i in 1:1000 loop
//end for;
//strm.print(String(time));
          when terminal() then
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
          annotation(
            experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.1));
        end led_push_button;

        model push_button_status "Checking Status of PushButton"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer val(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
            sComm.delay(2000);
          end when;
          if ok <> 0 then
            strm.print("Unable to open serial port, please check");
          else
            val := sComm.cmd_digital_in(1, 12);
            if val == 0 then
              strm.print("0");
              sComm.delay(200);
            else
              strm.print("1");
              sComm.delay(200);
            end if;
          end if;
//for i in 1:1000 loop
//end for;
          when terminal() then
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
//sComm.cmd_arduino_meter(digital_in);
          annotation(
            experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.1));
        end push_button_status;
      end push;

      package ldr
        extends Modelica.Icons.ExamplesPackage;

        model ldr_led "LED indicating light sensor readings"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer val(fixed = false);
          Integer digital_out(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
            sComm.delay(2000);
          end when;
          if ok <> 0 then
            strm.print("Unable to open serial port, please check");
          else
            val := sComm.cmd_analog_in(1, 5) "read analog pin 5 (ldr)";
            strm.print("LDR Readings: " + String(val));
            if val < 300 then
              digital_out := sComm.cmd_digital_out(1, 11, 1) "Turn ON LED";
            else
              digital_out := sComm.cmd_digital_out(1, 11, 0) "Turn OFF LED";
            end if;
            sComm.delay(500);
          end if;
//for i in 1:500 loop
//end for;
//strm.print(String(time));
          when terminal() then
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
//Run for 500 iterations
//Setting Threshold value of 300
          annotation(
            experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.2));
        end ldr_led;

        model ldr_read "Reading light intensity using ldr"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer val(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
            sComm.delay(2000);
          end when;
          if ok <> 0 then
            strm.print("Unable to open serial port, please check");
          else
            val := sComm.cmd_analog_in(1, 5) "read analog pin 5 (ldr)";
            strm.print("LDR Readings: " + String(val));
            sComm.delay(500);
          end if;
//for i in 1:10 loop
//end for;
          when terminal() then
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
//Run for 10 iterations
          annotation(
            experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 1));
        end ldr_read;
      end ldr;

      package pot
        extends Modelica.Icons.ExamplesPackage;

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
            ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
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
//for i in 1:10 loop
//end for;
          when terminal() then
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
//Run for 10 iterations
//Threshold 1
//Threshold 2
          annotation(
            experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 1));
        end pot_threshold;
      end pot;

      package thermistor
        extends Modelica.Icons.ExamplesPackage;

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
            ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
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

        model therm_read "Thermistor Readings"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer val(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "At port 0 with baudrate of 115200";
            sComm.delay(2000);
          end when;
          if ok <> 0 then
            strm.print("Unable to open serial port, please check");
          else
            val := sComm.cmd_analog_in(1, 4) "read analog pin 4 (thermistor)";
            strm.print("Thermistor Readings: " + String(val));
            sComm.delay(500);
          end if;
//for i in 1:20 loop
//end for;
          when terminal() then
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
//Run for 20 iterations
          annotation(
            experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 1));
        end therm_read;
      end thermistor;

      package dcmotor
        extends Modelica.Icons.ExamplesPackage;

        model dcmotor_clock "Rotate DC Motor clockwise"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "COM port is 0 and baud rate is 115200";
            sComm.delay(2000);
            if ok <> 0 then
              strm.print("Unable to open serial port, please check");
            else
              sComm.delay(1000);
              sComm.cmd_dcmotor_setup(1, 3, 1, 9, 10) "Setup DC motor of type 3 (L293D), motor 1, pin 9 and 10";
              sComm.cmd_dcmotor_run(1, 1, 100) "Motor 1 runs at PWM 100";
              sComm.delay(3000) "This is allowed to continue for 3 seconds";
              sComm.cmd_dcmotor_release(1, 1) "Motor 1 is released";
            end if;
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
          annotation(
            experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
        end dcmotor_clock;

        model dcmotor_both "Rotate DC Motor in both directions"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "COM port is 0 and baud rate is 115200";
            sComm.delay(2000);
            if ok <> 0 then
              strm.print("Unable to open serial port, please check");
            else
              sComm.cmd_dcmotor_setup(1, 3, 1, 9, 10) "Setup DC motor of type 3 (L293D), motor 1, pin 9 and 10";
              sComm.cmd_dcmotor_run(1, 1, 100) "Motor 1 runs at PWM 100";
              sComm.delay(3000) "for 3 seconds";
              sComm.cmd_dcmotor_run(1, 1, -100) "Motor 1 runs at PWM -100 in reverse direction";
              sComm.delay(2000) "for 2 seconds";
              sComm.cmd_dcmotor_release(1, 1) "Motor 1 is released";
            end if;
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
          annotation(
            experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
        end dcmotor_both;

        model dcmotor_loop "Rotate DC Motor in both directions in a loop"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "COM port is 0 and baud rate is 115200";
            sComm.delay(2000);
            if ok <> 0 then
              strm.print("Unable to open serial port, please check");
            else
              sComm.cmd_dcmotor_setup(1, 3, 1, 9, 10) "Setup DC motor of type 3 (L293D), motor 1, pins 9 and 10";
              for i in 0:4 loop
                sComm.cmd_dcmotor_run(1, 1, 100) "Motor 1 runs at PWM 100";
                sComm.delay(3000) "for 3 seconds";
                sComm.cmd_dcmotor_run(1, 1, 0) "Halt the motor";
                sComm.delay(2000) "for 2 seconds";
                sComm.cmd_dcmotor_run(1, 1, -100) "Run it at PWM 100 in reverse direction";
                sComm.delay(2000) "for 2 seconds";
              end for;
              sComm.cmd_dcmotor_release(1, 1) "Motor 1 is released";
            end if;
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
          annotation(
            experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 10));
        end dcmotor_loop;
      end dcmotor;

      package servo
        extends Modelica.Icons.ExamplesPackage;

        model servo_init "Rotate Servo Motor by 30 degrees and then reset"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "COM port is 0 and baud rate is 115200";
            sComm.delay(2000);
            if ok <> 0 then
              strm.print("Check the serial port and try again");
            else
              sComm.delay(2000);
              sComm.cmd_servo_attach(1, 1) "To attach the motor to pin 9 of servo1";
              sComm.cmd_servo_move(1, 1, 30) "tell servo to rotate by 30 degrees";
              sComm.delay(1000);
            end if;
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
          sComm.cmd_servo_detach(1, 1);
          annotation(
            experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
        end servo_init;

        model servo_loop "Rotate servo motor by 20 degrees 10 times"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer c_ok(fixed = false);
          Integer angle(fixed = true);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "COM port is 0 and baud rate is 115200";
            sComm.delay(2000);
            if ok <> 0 then
              strm.print("Check the serial port and try again");
            else
              sComm.delay(2000);
              sComm.cmd_servo_attach(1, 1) "Attach motor to pin 9. 1 means pin 9.";
              sComm.delay(2000);
              angle := 20 "Angle by which it has to move";
              for i in 1:10 loop
                sComm.cmd_servo_move(1, 1, angle * i) "tell servo to rotate by 20 degrees";
                sComm.delay(1000) "waits for a sec";
              end for;
              sComm.cmd_servo_detach(1, 1) "Detach the motor";
            end if;
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
          annotation(
            experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
        end servo_loop;

        model servo_reverse
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "COM port is 0 and baud rate is 115200";
            sComm.delay(2000);
            if ok <> 0 then
              strm.print("Check the serial port and try again");
            else
              sComm.cmd_servo_attach(1, 1) "Attach the motor to pin 9. 1 means 9";
              sComm.cmd_servo_move(1, 1, 90) "Move the servo to 90 degree";
              sComm.delay(1000) "be there for one second";
              sComm.cmd_servo_move(1, 1, 45) "Move the servo to 45 degree";
              sComm.delay(1000) "be there for one second";
              sComm.cmd_servo_detach(1, 1) "Detach the motor";
            end if;
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
//      sComm.delay(1000);
//      sComm.delay(2000);
//sComm.cmd_servo_detach(1, 1) "Detach the motor";
          annotation(
            experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
        end servo_reverse;

        model servo_pot "Control Servo Motor using Potentiometer"
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import strm = Modelica.Utilities.Streams;
          Integer ok(fixed = false);
          Integer c_ok(fixed = false);
          Integer val(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 115200) "COM port is 0 and baud rate is 115200";
            sComm.delay(2000);
            if ok <> 0 then
              strm.print("Check the serial port and try again");
            else
              sComm.cmd_servo_attach(1, 1) "Attach the motor to pin 9";
              sComm.delay(2000);
              for i in 1:50 loop
                val := sComm.cmd_analog_in(1, 2) "Read potentiometer value";
                val := integer(val * 180 / 1023) "Scale Potentiometer value to 0-180";
                sComm.cmd_servo_move(1, 1, val) "Command the servo motor";
                sComm.delay(500) "sleep for 500 milliseconds";
              end for;
              sComm.cmd_servo_detach(1, 1) "Detach the motor";
            end if;
            c_ok := sComm.close_serial(1) "To close the connection safely";
          end when;
//        strm.print("Potentiometer Reading at time" + String(time) + " : " + String(analog_in));
//5,000 itterations
          annotation(
            experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 5));
        end servo_pot;
      end servo;

      package modbus
        extends Modelica.Icons.ExamplesPackage;

        function read_voltage
          extends Modelica.Icons.Function;
        
          external read_voltage() annotation(
            Library = "Modbus");
          annotation(
            Documentation(info = "<html>
        <h4>Syntax</h4>
        <blockquote><pre>
        Arduino.SerialCommunication.Examples.modbus.<b>read_voltage</b>();
        </pre></blockquote>
        <h4>Description</h4>
        <p>
        </p>
        </html>"));
        end read_voltage;

        function read_current
          extends Modelica.Icons.Function;
        
          external read_voltage() annotation(
            Library = "Modbus");
          annotation(
            Documentation(info = "<html>
        <h4>Syntax</h4>
        <blockquote><pre>
        Arduino.SerialCommunication.Examples.modbus.<b>read_current</b>();
        </pre></blockquote>
        <h4>Description</h4>
        <p>
        </p>
        </html>"));
        end read_current;

        function read_val
          extends Modelica.Icons.Function;
          input Integer addr_byte;
          output Real p;
        
          external p = read_val(addr_byte) annotation(
            Library = "Modbus");
          annotation(
            Documentation(info = "<html>
        <h4>Syntax</h4>
        <blockquote><pre>
        Arduino.SerialCommunication.Examples.modbus.<b>read_val</b>(address_byte);
        </pre></blockquote>
        <h4>Description</h4>
        <p>
        </p>
        </html>"));
        end read_val;

        function read_active_power
          extends Modelica.Icons.Function;
        
          external read_active_power() annotation(
            Library = "Modbus");
          annotation(
            Documentation(info = "<html>
        <h4>Syntax</h4>
        <blockquote><pre>
        Arduino.SerialCommunication.Examples.modbus.<b>read_active_power</b>();
        </pre></blockquote>
        <h4>Description</h4>
        <p>
        </p>
        </html>"));
        end read_active_power;

        model modbus_test
          extends Modelica.Icons.Example;
          import sComm = Arduino.SerialCommunication.Functions;
          import modbus = Arduino.SerialCommunication.Examples.modbus;
          Integer ok(fixed = false);
          Integer c_ok(fixed = false);
        algorithm
          when initial() then
            ok := sComm.open_serial(1, 0, 9600);
            modbus.read_voltage();
            modbus.read_current();
            modbus.read_active_power();
            c_ok := sComm.close_serial(1);
          end when;
        end modbus_test;
      end modbus;
    end Examples;

    package MDD_Examples "Interfacing arduino with OpenModelica using Modelica Device Drivers"
      extends Modelica.Icons.ExamplesPackage;

      package MDD_led
        extends Modelica.Icons.ExamplesPackage;

        model MDD_led_blue ""
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-44, 66}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {39, 41}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'1', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {39, -21}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = true) annotation(
            Placement(visible = true, transformation(origin = {-41, -21}, extent = {{-15, -17}, {15, 17}}, rotation = 0)));
        equation
          connect(booleanExpression1.y, digitalWriteBoolean1.u) annotation(
            Line(points = {{-24, -20}, {14, -20}, {14, -20}, {16, -20}}, color = {255, 0, 255}));
          annotation(
            Documentation(info = "<html>
        <h4>Syntax</h4>
        <blockquote><pre>
        Arduino.SerialCommunication.MDD_Examples.MDD_led.<b>MDD-led_blue</b>();
        </pre></blockquote>
        <h4>Description</h4>
        <p>
        </p>
        </html>"));
        end MDD_led_blue;

        model MDD_led_blue_delay
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {31, 41}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'1', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {41, -17}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = if time < 5 then true else false) annotation(
            Placement(visible = true, transformation(origin = {-27, -16}, extent = {{-21, -16}, {21, 16}}, rotation = 0)));
        equation
          connect(booleanExpression1.y, digitalWriteBoolean1.u) annotation(
            Line(points = {{-4, -16}, {20, -16}}, color = {255, 0, 255}));
        end MDD_led_blue_delay;

        model MDD_led_blink
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-45, 71}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'5', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {42, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {23, 71}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = mod(time, 2) >= 1) annotation(
            Placement(visible = true, transformation(origin = {-24, -21}, extent = {{-16, -15}, {16, 15}}, rotation = 0)));
        equation
          connect(booleanExpression1.y, digitalWriteBoolean1.u) annotation(
            Line(points = {{-6, -21}, {16, -21}, {16, -22}, {18, -22}}, color = {255, 0, 255}));
        end MDD_led_blink;

        model MDD_led_blue_red
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-47, 47}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'1', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {38, -16}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {40, 44}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean2(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'3', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {38, -62}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = if time < 5 then true else false) annotation(
            Placement(visible = true, transformation(origin = {-32, -16}, extent = {{-18, -14}, {18, 14}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y = if time < 8 then true else false) annotation(
            Placement(visible = true, transformation(origin = {-32, -62}, extent = {{-18, -16}, {18, 16}}, rotation = 0)));
        equation
          connect(digitalWriteBoolean2.u, booleanExpression2.y) annotation(
            Line(points = {{18, -62}, {-12, -62}, {-12, -62}, {-12, -62}}, color = {255, 0, 255}));
          connect(booleanExpression2.y, digitalWriteBoolean2.u) annotation(
            Line(points = {{-12, -62}, {18, -62}, {18, -62}, {18, -62}}, color = {255, 0, 255}));
          connect(booleanExpression1.y, digitalWriteBoolean1.u) annotation(
            Line(points = {{-12, -16}, {18, -16}, {18, -16}, {18, -16}}, color = {255, 0, 255}));
        end MDD_led_blue_red;

        model MDD_led_green_blink
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'2', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {46, -30}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {39, 39}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = mod(time, 2) >= 1) annotation(
            Placement(visible = true, transformation(origin = {-17, -30}, extent = {{-15, -14}, {15, 14}}, rotation = 0)));
        equation
          connect(booleanExpression1.y, digitalWriteBoolean1.u) annotation(
            Line(points = {{0, -30}, {24, -30}, {24, -30}, {24, -30}}, color = {255, 0, 255}));
        end MDD_led_green_blink;

        model MDD_traffic_light ""
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega16) annotation(
            Placement(visible = true, transformation(origin = {-44, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer1) annotation(
            Placement(visible = true, transformation(origin = {39, 41}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'4', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.A) annotation(
            Placement(visible = true, transformation(origin = {39, -21}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = true) annotation(
            Placement(visible = true, transformation(origin = {-41, -21}, extent = {{-15, -17}, {15, 17}}, rotation = 0)));
        equation
          connect(booleanExpression1.y, digitalWriteBoolean1.u) annotation(
            Line(points = {{-24, -20}, {14, -20}, {14, -20}, {16, -20}}, color = {255, 0, 255}));
          annotation(
            Documentation(info = "<html>
        <h4>Syntax</h4>
        <blockquote><pre>
        Arduino.SerialCommunication.MDD_Examples.MDD_led.<b>MDD-led_blue</b>();
        </pre></blockquote>
        <h4>Description</h4>
        <p>
        </p>
        </html>"));
        end MDD_traffic_light;
      end MDD_led;

      package MDD_push
        extends Modelica.Icons.ExamplesPackage;

        model MDD_led_push_button
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-46, 62}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {39, 41}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalReadBoolean digitalReadBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'4', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {-44, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'1', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {62, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Logical.LogicalSwitch logicalSwitch1 annotation(
            Placement(visible = true, transformation(origin = {8, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = true) annotation(
            Placement(visible = true, transformation(origin = {-32, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y = false) annotation(
            Placement(visible = true, transformation(origin = {-32, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        equation
          connect(booleanExpression2.y, logicalSwitch1.u3) annotation(
            Line(points = {{-20, -70}, {-16, -70}, {-16, -36}, {-4, -36}, {-4, -36}}, color = {255, 0, 255}));
          connect(booleanExpression1.y, logicalSwitch1.u1) annotation(
            Line(points = {{-20, 18}, {-14, 18}, {-14, -20}, {-4, -20}, {-4, -20}}, color = {255, 0, 255}));
          connect(logicalSwitch1.y, digitalWriteBoolean1.u) annotation(
            Line(points = {{20, -28}, {50, -28}, {50, -28}, {50, -28}}, color = {255, 0, 255}));
          connect(digitalReadBoolean1.y, logicalSwitch1.u2) annotation(
            Line(points = {{-32, -28}, {-4, -28}}, color = {255, 0, 255}));
        end MDD_led_push_button;

        model MDD_push_button_status
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-43, 43}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {20, 42}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalReadBoolean digitalReadBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'4', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {-39, -19}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica.Blocks.Interaction.Show.BooleanValue booleanValue1(use_activePort = true) annotation(
            Placement(visible = true, transformation(origin = {31, -19}, extent = {{-15, -17}, {15, 17}}, rotation = 0)));
        equation
          connect(digitalReadBoolean1.y, booleanValue1.activePort) annotation(
            Line(points = {{-18, -18}, {14, -18}, {14, -18}, {14, -18}}, color = {255, 0, 255}));
        end MDD_push_button_status;

        model pushTest1
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalReadBoolean digitalReadBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'4', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {-60, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'1', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {60, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Logical.LogicalSwitch logicalSwitch1 annotation(
            Placement(visible = true, transformation(origin = {-2, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression1 annotation(
            Placement(visible = true, transformation(origin = {-44, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y = true) annotation(
            Placement(visible = true, transformation(origin = {-46, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        equation
          connect(logicalSwitch1.y, digitalWriteBoolean1.u) annotation(
            Line(points = {{10, -2}, {48, -2}, {48, -2}, {48, -2}}, color = {255, 0, 255}));
          connect(digitalReadBoolean1.y, logicalSwitch1.u2) annotation(
            Line(points = {{-48, -2}, {-14, -2}, {-14, -2}, {-14, -2}}, color = {255, 0, 255}));
          connect(booleanExpression2.y, logicalSwitch1.u3) annotation(
            Line(points = {{-34, -58}, {-24, -58}, {-24, -10}, {-14, -10}, {-14, -10}}, color = {255, 0, 255}));
          connect(booleanExpression1.y, logicalSwitch1.u1) annotation(
            Line(points = {{-32, 62}, {-28, 62}, {-28, 6}, {-14, 6}, {-14, 6}}, color = {255, 0, 255}));
          annotation(
            uses(Modelica_DeviceDrivers(version = "1.5.0"), Modelica(version = "3.2.2")));
        end pushTest1;
      end MDD_push;

      package MDD_ldr
        extends Modelica.Icons.ExamplesPackage;

        model MDD_ldr_led
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-45, 65}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {38, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'1', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {79, -23}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = true) annotation(
            Placement(visible = true, transformation(origin = {-60, 12}, extent = {{-14, -16}, {14, 16}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression2 annotation(
            Placement(visible = true, transformation(origin = {-59, -79}, extent = {{-13, -17}, {13, 17}}, rotation = 0)));
          Modelica.Blocks.Logical.LogicalSwitch logicalSwitch1 annotation(
            Placement(visible = true, transformation(origin = {28, -22}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
          Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold = 600) annotation(
            Placement(visible = true, transformation(origin = {-21, -23}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.ADC adc(analogPort = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.AnalogPort.A5, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.AnalogPrescaler.'1/128', voltageReference = 1024, voltageReferenceSelect = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.VRefSelect.Internal) annotation(
            Placement(visible = true, transformation(origin = {-72, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        equation
          connect(adc.y, greaterThreshold1.u) annotation(
            Line(points = {{-50, -22}, {-34, -22}}, color = {0, 0, 127}));
          connect(greaterThreshold1.y, logicalSwitch1.u2) annotation(
            Line(points = {{-8, -22}, {8, -22}, {8, -22}, {8, -22}}, color = {255, 0, 255}));
          connect(logicalSwitch1.y, digitalWriteBoolean1.u) annotation(
            Line(points = {{46, -22}, {58, -22}, {58, -22}, {58, -22}}, color = {255, 0, 255}));
          connect(booleanExpression1.y, logicalSwitch1.u1) annotation(
            Line(points = {{-44, 12}, {8, 12}, {8, -10}, {8, -10}}, color = {255, 0, 255}));
          connect(booleanExpression2.y, logicalSwitch1.u3) annotation(
            Line(points = {{-44, -78}, {6, -78}, {6, -34}, {8, -34}}, color = {255, 0, 255}));
        end MDD_ldr_led;

        model MDD_ldr_read
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-37, 39}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {50, 38}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.ADC adc(analogPort = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.AnalogPort.A5, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.AnalogPrescaler.'1/128', voltageReference = 1024, voltageReferenceSelect = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.VRefSelect.Internal) annotation(
            Placement(visible = true, transformation(origin = {-39, -17}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
          Modelica.Blocks.Interaction.Show.RealValue realValue1(use_numberPort = true) annotation(
            Placement(visible = true, transformation(origin = {30, -17}, extent = {{-18, -17}, {18, 17}}, rotation = 0)));
        equation
          connect(adc.y, realValue1.numberPort) annotation(
            Line(points = {{-20, -17}, {7, -17}}, color = {0, 0, 127}));
        end MDD_ldr_read;
      end MDD_ldr;

      package MDD_pot
        extends Modelica.Icons.ExamplesPackage;

        model MDD_pot_threshold ""
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-79, 79}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {80, 80}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
          Modelica.Blocks.Logical.Switch switch11 annotation(
            Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Logical.Switch switch12 annotation(
            Placement(visible = true, transformation(origin = {10, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Logical.Greater greater1 annotation(
            Placement(visible = true, transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Logical.Greater greater2 annotation(
            Placement(visible = true, transformation(origin = {36, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'1', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {82, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean2(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'2', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean3(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'3', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B) annotation(
            Placement(visible = true, transformation(origin = {82, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold1(threshold = 0) annotation(
            Placement(visible = true, transformation(origin = {-42, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold2(threshold = 320) annotation(
            Placement(visible = true, transformation(origin = {-42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold3(threshold = 900) annotation(
            Placement(visible = true, transformation(origin = {-40, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Sources.RealExpression realExpression1(y = 0) annotation(
            Placement(visible = true, transformation(origin = {-40, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Sources.RealExpression realExpression2(y = 1) annotation(
            Placement(visible = true, transformation(origin = {-44, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Logical.Switch switch1 annotation(
            Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Math.RealToBoolean realToBoolean1(threshold = 0.5) annotation(
            Placement(visible = true, transformation(origin = {44, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.ADC adc(analogPort = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.AnalogPort.A2, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.AnalogPrescaler.'1/128', voltageReference = 1024, voltageReferenceSelect = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.VRefSelect.Internal) annotation(
            Placement(visible = true, transformation(origin = {-88, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 5, use_numberPort = true) annotation(
            Placement(visible = true, transformation(origin = {-74, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        equation
          connect(adc.y, realValue1.numberPort) annotation(
            Line(points = {{-76, 0}, {-74, 0}, {-74, -70}, {-94, -70}, {-94, -84}, {-86, -84}, {-86, -84}}, color = {0, 0, 127}));
          connect(adc.y, greaterEqualThreshold1.u) annotation(
            Line(points = {{-76, 0}, {-70, 0}, {-70, 46}, {-54, 46}}, color = {0, 0, 127}));
          connect(greaterEqualThreshold1.y, switch1.u2) annotation(
            Line(points = {{-31, 46}, {-24, 46}, {-24, 70}, {-12, 70}}, color = {255, 0, 255}));
          connect(adc.y, greaterEqualThreshold3.u) annotation(
            Line(points = {{-76, 0}, {-70, 0}, {-70, -64}, {-52, -64}, {-52, -64}}, color = {0, 0, 127}));
          connect(adc.y, greaterEqualThreshold2.u) annotation(
            Line(points = {{-76, 0}, {-54, 0}, {-54, 0}, {-54, 0}}, color = {0, 0, 127}));
          connect(realToBoolean1.y, digitalWriteBoolean3.u) annotation(
            Line(points = {{56, -64}, {70, -64}, {70, -64}, {70, -64}}, color = {255, 0, 255}));
          connect(switch12.y, realToBoolean1.u) annotation(
            Line(points = {{22, -64}, {32, -64}, {32, -64}, {32, -64}}, color = {0, 0, 127}));
          connect(realExpression1.y, switch1.u3) annotation(
            Line(points = {{-28, -92}, {-16, -92}, {-16, 62}, {-12, 62}, {-12, 62}}, color = {0, 0, 127}));
          connect(realExpression2.y, switch1.u1) annotation(
            Line(points = {{-32, 84}, {-20, 84}, {-20, 78}, {-12, 78}, {-12, 78}}, color = {0, 0, 127}));
          connect(switch1.y, greater2.u1) annotation(
            Line(points = {{12, 70}, {22, 70}, {22, 70}, {24, 70}}, color = {0, 0, 127}));
          connect(greater1.y, digitalWriteBoolean2.u) annotation(
            Line(points = {{54, 0}, {70, 0}}, color = {255, 0, 255}));
          connect(switch11.y, greater2.u2) annotation(
            Line(points = {{14, 0}, {18, 0}, {18, 62}, {24, 62}, {24, 62}}, color = {0, 0, 127}));
          connect(switch11.y, greater1.u1) annotation(
            Line(points = {{14, 0}, {30, 0}}, color = {0, 0, 127}));
          connect(switch12.y, greater1.u2) annotation(
            Line(points = {{22, -64}, {22, -64}, {22, -8}, {30, -8}, {30, -8}}, color = {0, 0, 127}));
          connect(greaterEqualThreshold2.y, switch11.u2) annotation(
            Line(points = {{-30, 0}, {-10, 0}, {-10, 0}, {-10, 0}}, color = {255, 0, 255}));
          connect(greater2.y, digitalWriteBoolean1.u) annotation(
            Line(points = {{48, 70}, {56, 70}, {56, 40}, {70, 40}, {70, 40}}, color = {255, 0, 255}));
          connect(realExpression2.y, switch12.u1) annotation(
            Line(points = {{-32, 84}, {-20, 84}, {-20, -56}, {-2, -56}, {-2, -56}}, color = {0, 0, 127}));
          connect(realExpression2.y, switch11.u1) annotation(
            Line(points = {{-32, 84}, {-20, 84}, {-20, 8}, {-10, 8}, {-10, 8}}, color = {0, 0, 127}));
          connect(realExpression1.y, switch11.u3) annotation(
            Line(points = {{-28, -92}, {-16, -92}, {-16, -8}, {-10, -8}, {-10, -8}}, color = {0, 0, 127}));
          connect(realExpression1.y, switch12.u3) annotation(
            Line(points = {{-28, -92}, {-16, -92}, {-16, -72}, {-2, -72}, {-2, -72}}, color = {0, 0, 127}));
          connect(greaterEqualThreshold3.y, switch12.u2) annotation(
            Line(points = {{-28, -64}, {-2, -64}, {-2, -64}, {-2, -64}}, color = {255, 0, 255}));
          annotation(
            Documentation(info = "<html>
        <h4>Syntax</h4>
        <blockquote><pre>
        Arduino.SerialCommunication.MDD_Examples.MDD_pot.<b>MDD_pot_threshold</b>();
        </pre></blockquote>
        <h4>Description</h4>
        <p>Voltage reference used to represent 10 bit precision(1024) of ADC along with prescaling by by 128.Internal voltage reference is applied to adc.
        </p>
        </html>"));
        end MDD_pot_threshold;
      end MDD_pot;

      package MDD_thermistor
        extends Modelica.Icons.ExamplesPackage;

        model MDD_therm_read
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {40, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.ADC adc(analogPort = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.AnalogPort.A4, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.AnalogPrescaler.'1/128', voltageReference = 1024, voltageReferenceSelect = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.VRefSelect.Internal) annotation(
            Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica.Blocks.Interaction.Show.RealValue realValue1(use_numberPort = true) annotation(
            Placement(visible = true, transformation(origin = {39, -21}, extent = {{-15, -19}, {15, 19}}, rotation = 0)));
        equation
          connect(adc.y, realValue1.numberPort) annotation(
            Line(points = {{-18, -20}, {20, -20}, {20, -20}, {22, -20}}, color = {0, 0, 127}));
        end MDD_therm_read;

        model MDD_therm_buzzer
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-61, 61}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.ADC adc(analogPort = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.AnalogPort.A4, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.AnalogPrescaler.'1/128', voltageReference = 1024, voltageReferenceSelect = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.VRefSelect.Internal) annotation(
            Placement(visible = true, transformation(origin = {-68, 1.77636e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {41, 61}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica.Blocks.Interaction.Show.RealValue realValue1(use_numberPort = true) annotation(
            Placement(visible = true, transformation(origin = {12, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'3', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.D) annotation(
            Placement(visible = true, transformation(origin = {78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Logical.LogicalSwitch logicalSwitch1 annotation(
            Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = false) annotation(
            Placement(visible = true, transformation(origin = {10, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y = true) annotation(
            Placement(visible = true, transformation(origin = {10, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold1(threshold = 550) annotation(
            Placement(visible = true, transformation(origin = {-4, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        equation
          connect(greaterEqualThreshold1.y, logicalSwitch1.u2) annotation(
            Line(points = {{8, 0}, {28, 0}, {28, 0}, {28, 0}}, color = {255, 0, 255}));
          connect(adc.y, greaterEqualThreshold1.u) annotation(
            Line(points = {{-46, 0}, {-16, 0}, {-16, 0}, {-16, 0}}, color = {0, 0, 127}));
          connect(adc.y, realValue1.numberPort) annotation(
            Line(points = {{-46, 0}, {-32, 0}, {-32, -56}, {0, -56}}, color = {0, 0, 127}));
          connect(logicalSwitch1.y, digitalWriteBoolean1.u) annotation(
            Line(points = {{52, 0}, {66, 0}, {66, 0}, {66, 0}}, color = {255, 0, 255}));
          connect(booleanExpression2.y, logicalSwitch1.u1) annotation(
            Line(points = {{22, 32}, {24, 32}, {24, 8}, {28, 8}, {28, 8}}, color = {255, 0, 255}));
          connect(booleanExpression1.y, logicalSwitch1.u3) annotation(
            Line(points = {{22, -32}, {24, -32}, {24, -8}, {28, -8}, {28, -8}}, color = {255, 0, 255}));
        end MDD_therm_buzzer;
      end MDD_thermistor;

      package MDD_dcmotor
        extends Modelica.Icons.ExamplesPackage;

        model MDD_dcmotor_clock
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {39, 41}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.PWM pwm(fastPWM = true, initialValues = {0}, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerPrescaler.'1/1024', timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer1, timerNumbers = {Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerNumber.B}) annotation(
            Placement(visible = true, transformation(origin = {51, -3}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica.Blocks.Sources.IntegerExpression integerExpression1(y = if time < 5 then 255 else 0) annotation(
            Placement(visible = true, transformation(origin = {-40, -3}, extent = {{-16, -13}, {16, 13}}, rotation = 0)));
        equation
          connect(pwm.u[1], integerExpression1.y) annotation(
            Line(points = {{28, -3}, {-22, -3}}, color = {255, 127, 0}, thickness = 0.5));
        end MDD_dcmotor_clock;

        model MDD_dcmotor_both
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {56, 60}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.PWM pwm(fastPWM = true, initialValues = {0}, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerPrescaler.'1/1024', timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer1, timerNumbers = {Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerNumber.A}) annotation(
            Placement(visible = true, transformation(origin = {54, 1.77636e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica.Blocks.Sources.IntegerExpression integerExpression1(y = if mod(time, 5) >= 2.5 then 100 else 0) annotation(
            Placement(visible = true, transformation(origin = {-41, 3.55271e-15}, extent = {{-23, -20}, {23, 20}}, rotation = 0)));
          Modelica.Blocks.Sources.IntegerExpression integerExpression2(y = if mod(time, 5) < 2.5 then 100 else 0) annotation(
            Placement(visible = true, transformation(origin = {-39, -48}, extent = {{-23, -20}, {23, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.PWM pwm1(fastPWM = true, initialValues = {0}, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerPrescaler.'1/1024', timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer1, timerNumbers = {Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerNumber.B}) annotation(
            Placement(visible = true, transformation(origin = {54, -48}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
        equation
          connect(integerExpression2.y, pwm1.u[1]) annotation(
            Line(points = {{-14, -48}, {28, -48}, {28, -48}, {30, -48}}, color = {255, 127, 0}));
          connect(integerExpression1.y, pwm.u[1]) annotation(
            Line(points = {{-16, 0}, {28, 0}, {28, 0}, {30, 0}}, color = {255, 127, 0}));
        end MDD_dcmotor_both;

        model MDD_dcmotor_loop
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-40, 62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {40, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.PWM pwm(fastPWM = true, initialValues = {0}, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerPrescaler.'1/1024', timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer1, timerNumbers = {Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerNumber.A}) annotation(
            Placement(visible = true, transformation(origin = {44, 16}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.PWM pwm1(fastPWM = true, initialValues = {0}, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerPrescaler.'1/1024', timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer1, timerNumbers = {Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerNumber.B}) annotation(
            Placement(visible = true, transformation(origin = {44, -30}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
          Modelica.Blocks.Sources.IntegerExpression integerExpression1(y = if mod(time, 6) < 3 then 255 else 0) annotation(
            Placement(visible = true, transformation(origin = {-53, 16}, extent = {{-17, -16}, {17, 16}}, rotation = 0)));
          Modelica.Blocks.Sources.IntegerExpression integerExpression2(y = if mod(time, 6) > 3 then 255 else 0) annotation(
            Placement(visible = true, transformation(origin = {-52, -30}, extent = {{-16, -14}, {16, 14}}, rotation = 0)));
        equation
          connect(integerExpression2.y, pwm1.u[1]) annotation(
            Line(points = {{-34, -30}, {24, -30}}, color = {255, 127, 0}));
          connect(integerExpression1.y, pwm.u[1]) annotation(
            Line(points = {{-34, 16}, {24, 16}}, color = {255, 127, 0}));
        end MDD_dcmotor_loop;
      end MDD_dcmotor;

      package MDD_servo
        extends Modelica.Icons.ExamplesPackage;

        model MDD_servo_init
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-40, 58}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {59, 59}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.PWM pwm(fastPWM = true, initialValues = {0}, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerPrescaler.'1/1024', timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer1, timerNumbers = {Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerNumber.A}) annotation(
            Placement(visible = true, transformation(origin = {44, -6}, extent = {{-28, -28}, {28, 28}}, rotation = 0)));
          Modelica.Blocks.Sources.IntegerExpression integerExpression1(y = 30) annotation(
            Placement(visible = true, transformation(origin = {-57, -6}, extent = {{-23, -18}, {23, 18}}, rotation = 0)));
        equation
          connect(integerExpression1.y, pwm.u[1]) annotation(
            Line(points = {{-32, -6}, {10, -6}}, color = {255, 127, 0}));
        end MDD_servo_init;

        model MDD_servo_loop
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-41, 41}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {39, 41}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.PWM pwm(fastPWM = true, initialValues = {0}, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerPrescaler.'1/1024', timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer1, timerNumbers = {Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerNumber.A}) annotation(
            Placement(visible = true, transformation(origin = {80, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.MathInteger.TriggeredAdd triggeredAdd1(use_reset = false, use_set = false) annotation(
            Placement(visible = true, transformation(origin = {10, -8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
          Modelica.Blocks.Sources.IntegerExpression integerExpression1(y = 10) annotation(
            Placement(visible = true, transformation(origin = {-34, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = if mod(time, 0.2) > 0.1 then true else false) annotation(
            Placement(visible = true, transformation(origin = {-22, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        equation
          connect(booleanExpression1.y, triggeredAdd1.trigger) annotation(
            Line(points = {{-10, -32}, {6, -32}, {6, -16}, {6, -16}}, color = {255, 0, 255}));
          connect(integerExpression1.y, triggeredAdd1.u) annotation(
            Line(points = {{-22, -8}, {2, -8}, {2, -8}, {2, -8}}, color = {255, 127, 0}));
          connect(triggeredAdd1.y, pwm.u[1]) annotation(
            Line(points = {{17, -8}, {68, -8}}, color = {255, 127, 0}));
        end MDD_servo_loop;

        model MDD_servo_pot
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {39, 61}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.ADC adc(analogPort = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.AnalogPort.A2, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.AnalogPrescaler.'1/128', voltageReference = 180, voltageReferenceSelect = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.VRefSelect.Internal) annotation(
            Placement(visible = true, transformation(origin = {-52, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.PWM pwm(fastPWM = true, initialValues = {0}, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerPrescaler.'1/1024', timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer1, timerNumbers = {Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerNumber.A}) annotation(
            Placement(visible = true, transformation(origin = {48, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Modelica.Blocks.Math.RealToInteger realToInteger1 annotation(
            Placement(visible = true, transformation(origin = {-6, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        equation
          connect(adc.y, realToInteger1.u) annotation(
            Line(points = {{-40, -10}, {-18, -10}, {-18, -10}, {-18, -10}, {-18, -10}}, color = {0, 0, 127}));
          connect(realToInteger1.y, pwm.u[1]) annotation(
            Line(points = {{6, -10}, {36, -10}, {36, -10}, {36, -10}}, color = {255, 127, 0}));
        end MDD_servo_pot;

        model MDD_servo_reverse
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.01, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-59, 61}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {55, 61}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
          Modelica.Blocks.Sources.IntegerExpression integerExpression1(y = if time < 0.2 then 22 else 15) annotation(
            Placement(visible = true, transformation(origin = {-44, 0}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.PWM pwm(fastPWM = true, initialValues = {0}, prescaler = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerPrescaler.'1/1024', timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer1, timerNumbers = {Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerNumber.A}) annotation(
            Placement(visible = true, transformation(origin = {44, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        equation
          connect(integerExpression1.y, pwm.u[1]) annotation(
            Line(points = {{-20, 0}, {32, 0}}, color = {255, 127, 0}));
        end MDD_servo_reverse;
      end MDD_servo;

      package MDD_modbus
        extends Modelica.Icons.ExamplesPackage;

        model MDD_read_val
          extends Modelica.Icons.Example;
          inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(desiredPeriod = 0.002, platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P) annotation(
            Placement(visible = true, transformation(origin = {-45, 67}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
          Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.SynchronizeRealtime synchronizeRealtime1(timer = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.TimerSelect.Timer0) annotation(
            Placement(visible = true, transformation(origin = {28, 68}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
          Modelica.Blocks.MathInteger.MultiSwitch multiSwitch1(expr = {86, 88, 78}, nu = 3, use_pre_as_default = true, y_default = 0) annotation(
            Placement(visible = true, transformation(origin = {-32.6577, -10}, extent = {{-10.0019, -22}, {30.0056, 22}}, rotation = 0)));
          Modelica.Blocks.Interaction.Show.RealValue realValue1 annotation(
            Placement(visible = true, transformation(origin = {60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
          Blocks.Read_Val read_Val1 annotation(
            Placement(visible = true, transformation(origin = {26, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        equation
          connect(read_Val1.y, realValue1.numberPort) annotation(
            Line(points = {{38, -10}, {48, -10}, {48, -10}, {48, -10}}, color = {0, 0, 127}));
          connect(multiSwitch1.y, read_Val1.u) annotation(
            Line(points = {{-2, -10}, {14, -10}, {14, -10}, {14, -10}}, color = {255, 127, 0}));
        end MDD_read_val;
      end MDD_modbus;
    end MDD_Examples;

    package Blocks
      extends Modelica.Icons.Package;

      model Read_Val
        extends Modelica.Blocks.Interfaces.SISO;
        import Modelica_DeviceDrivers.EmbeddedTargets.AVR;
        import sComm = Arduino.SerialCommunication.Functions;
        outer Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu;
        annotation(
          defaultComponentName = "Read_Val",
          Icon(graphics = {Text(extent = {{-95, -95}, {95, 95}}, textString = "Read_Val", fontName = "Arial")}));
      end Read_Val;
    end Blocks;

    package Icons "Collection of icons used for library components"
      extends Modelica.Icons.IconsPackage;

      partial package GenericICPackage "Icon with a generic IC"
        annotation(
          Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent = {{-95, -95}, {95, 95}}, fileName = "Resources/Images/Icons/tqfp32.png", rotation = 0)}),
          Documentation(info = "<html>
    <p>
    This partial class is intended to design a <em>default icon for microcontrollers</em>.
    </p>
    </html>"));
      end GenericICPackage;

      partial block GenericIC "Icon with a generic IC"
        annotation(
          Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent = {{-95, -95}, {95, 95}}, fileName = "Resources/Images/Icons/tqfp32.png", rotation = 0)}),
          Documentation(info = "<html>
    <p>
    This partial class is intended to design a <em>default icon for microcontrollers</em>.
    </p>
    </html>"));
      end GenericIC;

      partial package FunctionLayerIcon "Icon for packages that represent the function layer"
        extends Modelica.Icons.Package;
        annotation(
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(lineColor = {128, 128, 128}, extent = {{-90, -90}, {90, 90}}, textString = "f"), Ellipse(lineColor = {128, 128, 128}, extent = {{-80, -80}, {80, 80}})}),
          Documentation(info = "<html>
    <p>This icon indicates Modelica functions.</p>
    </html>"));
      end FunctionLayerIcon;
      annotation(
        preferredView = "info",
        Documentation(info = "<html>
    <p>
    A collection of basic icons to be used for different elements of the library.
    </p>
    </html>"));
    end Icons;
    annotation(
      Documentation(info = "<html>
<h4>Description</h4>
<p>
A serial communication package for hardware interfacing.
</p>
</html>"));
  end SerialCommunication;
  annotation(
    uses(Modelica_DeviceDrivers(version = "1.5.0"), Modelica(version = "3.2.2")));
end Arduino;