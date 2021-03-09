function read_current
  extends Modelica.Icons.Function;

  external read_voltage() annotation(Library = "Modbus");
  annotation(Documentation(info = "<html>
        <h4>Syntax</h4>
        <blockquote><pre>
        Arduino.SerialCommunication.Examples.modbus.<b>read_current</b>();
        </pre></blockquote>
        <h4>Description</h4>
        <p>
        </p>
        </html>"));
end read_current;