model pushTest1
  extends Modelica.Icons.Example;
  Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalReadBoolean digitalReadBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'4', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B)  annotation(
    Placement(visible = true, transformation(origin = {-60, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.DigitalWriteBoolean digitalWriteBoolean1(pin = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Pin.'2', port = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Port.B)  annotation(
    Placement(visible = true, transformation(origin = {60, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.LogicalSwitch logicalSwitch1 annotation(
    Placement(visible = true, transformation(origin = {-2, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = true)  annotation(
    Placement(visible = true, transformation(origin = {-44, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y = false)  annotation(
    Placement(visible = true, transformation(origin = {-46, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica_DeviceDrivers.EmbeddedTargets.AVR.Blocks.Microcontroller mcu(platform = Modelica_DeviceDrivers.EmbeddedTargets.AVR.Types.Platform.ATmega328P)  annotation(
    Placement(visible = true, transformation(origin = {-70, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(booleanExpression1.y, logicalSwitch1.u1) annotation(
    Line(points = {{-33, 48}, {-28, 48}, {-28, 6}, {-14, 6}}, color = {255, 0, 255}));
  connect(logicalSwitch1.y, digitalWriteBoolean1.u) annotation(
    Line(points = {{10, -2}, {48, -2}, {48, -2}, {48, -2}}, color = {255, 0, 255}));
  connect(digitalReadBoolean1.y, logicalSwitch1.u2) annotation(
    Line(points = {{-48, -2}, {-14, -2}, {-14, -2}, {-14, -2}}, color = {255, 0, 255}));
  connect(booleanExpression2.y, logicalSwitch1.u3) annotation(
    Line(points = {{-34, -58}, {-24, -58}, {-24, -10}, {-14, -10}, {-14, -10}}, color = {255, 0, 255}));
  annotation(
    uses(Modelica_DeviceDrivers(version = "1.5.0"), Modelica(version = "3.2.2")));
end pushTest1;