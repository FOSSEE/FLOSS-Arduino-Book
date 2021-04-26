\name
TIME_SAMPLE

\palette
Arduino

\smalldescription
Set the control duration and the sampling time

\description
This block is \bold{compulsory} to be placed in the xcos model to use this toolbox. 
It defines the simulation time of the model as well as the sampling time used for the model (each block is sampled by this step). 
Due to the limitation of serial communication the sampling time is about 8 ms (it is possible to go down to 4 ms) per block. 
For the complex model, do make sure that the sampling is sufficient for the execution. This could be done by measuring the simulation time is the actual time (10 s simulation should last 10 s). Otherwise, increase the sampling period to suit the need of the model. 

\dialogbox
\image{TIME_SAMPLE_dialogbox.png}
The simulation time (positive) must be specified. 
The sampling time must be set completed according to the complexity of the model

\example1
The example below shows the use of the block to blink the LED on port 13 of the UNO card set on the communication port 5. All blocks are using the default settings, except for the PULSE block the standard palette of which the phase shift is set to 0.
\image{ARDUINO_SETUP_example.png}

\seealso
ARDUINO_SETUP
