\name
ARDUINO_SETUP

\palette
Arduino

\smalldescription
This block is used to configure the serial port setting for communication between the Arduino and Scilab.

\description
This block is \bold{compulsory} to be placed in the xcos model to use this toolbox. 
It defines the communication setting between the Arduino board and Xcos. 
The port setting can be determined by running the Arduino application from the menu item "Tools / Serial Port". The port number can also be changed by going to computer's "Device Manager / Ports (Advanced options)". 
Currently it is not  possible to use multiple Arduino boards. 

The toolbox can be used only on Windows for now.

\bold{Before using Arduino toolbox, it is necessary to upload the program "toolbox_arduino.ino" to the board, which is available at:} http://www.demosciences.fr


\dialogbox
\image{ARDUINO_SETUP_dialogbox.png}
The communication port must be specified (between 2 and 9 or an error message would appear). 
The card number Arduino must be equal to 1 now (or an error message would appear)

\example1
The example below shows the use of the block to blink the LED at port 13 of the UNO card set on the serial port 5. All blocks are using the default settings, except for the PULSE block from the source palette where the phase shift is changed to 0.
\image{ARDUINO_SETUP_example.png}

\seealso
TIME_SAMPLE
