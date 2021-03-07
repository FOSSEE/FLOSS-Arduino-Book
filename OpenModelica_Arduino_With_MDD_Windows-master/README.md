# OpenModelica_Arduino_With_MDD on Windows Platform

Embedded Experiments with OpenModelica and Arduino with facility for Embedded C code generation.

Free & Open Source library based on OpenModelica to perform Embedded Experiments with Arduino. Also, there is a facility to generate Embedded C code by using Modelica_DeviceDriver models.

Library description

The library is an open source Modelica package for real-time simulation of circuit designs involving Arduino platforms based on AVR Atmega328P MCUs.

# Main features:

Support for Windows.
(Soft) real-time synchronization of a simulation.

Please note that the library is known to work with

OpenModelica (partial support starting with OpenModelica v1.11.0, e.g.serial port).

Prerequisites

OpenModelica (>= v1.11.0) (https://www.openmodelica.org/download/download-windows)
Modelica_DeviceDrivers (v1.5.1) (https://github.com/modelica/Modelica_DeviceDrivers/releases/tag/v1.5.1)

Compile and Install

Compile: Navigate to Library directory under Resources and to compile a source file named filename.c execute the following command

$ gcc –c –Wall –fPIC ../src/filename.c

To make a shared object file named libSerialComm.so execute the following

$ gcc –shared –fPIC *.o -o libSerialComm.so

Install and Run: Launch OMEdit and load the package Modelica_DeviceDrivers. Also, load the OpenModelica-Arduino package present in Arduino.mo file. Load the Arduino platform with the arduino_firmware.ino code.Create any model using the package and simulate.

Running Test Firmware

Test the package using test firmware provided.

Load the Arduino platform with the arduino_firmware.ino code.
Load the test model present in testfirmware.mo file along with Arduino.mo file in OpenModelica.
Simulate the model.If no error occurs,the package is good to go.

Running MDD Models

See the AVR package documentation under Modelica_DeviceDrivers -> EmbeddedTargets -> AVR in OMEdit before running the MDD examples.

To run a Modelica_DeviceDrivers Blink example, navigate to MDD_build/Blink directory and execute the following command

Running Manually: Executing Blink example within Modelica_DeviceDrivers EmbeddedTargets Package:- Put the runMDDAvr.mos file in a (build) directory and execute following commands on the command line:

$ omc --simCodeTarget=ExperimentalEmbeddedC runMDDAvr.mos $ avr-gcc -Os -std=c11 -ffunction-sections -fdata-sections -mmcu=atmega328p -DF_CPU=16000000UL -Wl,--gc-sections Blink_main.c -o Blink -I /path_to_MDD/Modelica_DeviceDrivers/Resources/Include -I /usr/include/omc/c $ avr-objcopy -O ihex -R .eeprom Blink Blink.hex $ avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:Blink.hex

For further information: Visit https://build.openmodelica.org/Documentation/Modelica_DeviceDrivers.html. Development and contribution

# Main developers:

Manas Ranjan Das, FOSSSEE, IIT-Bombay

Contributions in shape of [Pull Requests] are always welcome.
