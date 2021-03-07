\name
DCMOTOR_SB

\palette
Arduino

\smalldescription
This block is used to control a DC motor 

\description
The DCMOTOR block is used to control one or more DC motors. Arduino board does not deliver enough power, so it is necessary to use a H-bridge circuit/IC to control the motor. There are several types of  H-bridge IC that do not all operate on the same principle. For example, the L298 requires the use of a PWM signal with current sense. The L293 uses two PWM to set the speed and direction. Ready-to-use Shields are also available. 
This is why the block is used to select the type of card or H-bridge used and depending on the choice, a different menu would pop up to for the device dependent setting (port numbers or motor number ...) 
Remember that the PWM is 8-bit (0 to 255). 
The input of the block could accept any value, but it would saturate at +- 255. 
Do note that the sampling rate is 8 ms minimum for this block.
    
\dialogbox
The block has two menus. 
The first lets you choose the type of card used: 
1 for official Motorshield Rev3 available on the website arduino.cc card 
2 H-bridge L298 using PWM and a current sense 
3 H-bridge L293 using two PWM 
The card number can not be changed at this time.
\image{DCMOTOR_SB_dialogbox1.png}

The second menu is for the setting of the selected card used 
For Motorshield channel number 1 or 2 correspond to the motor A or B on the Shield.

\image{DCMOTOR_SB_dialogbox2.png}
For L298, one informs the port number specification of meaning (any digital port), the number of the port for PWM speed (3,5,6,9,10,11) and the number of motor-driven (limited 1 to 4)
\image{DCMOTOR_SB_dialogbox3.png}
For L293, the setting are 2 PWM port and the motor number (1 to 3)
\image{DCMOTOR_SB_dialogbox4.png}

\example1
The following example shows the  of the motor unit associated with a potentiometer. When the knob is in the middle position, the motor is not moving while when the knob is turned in one direction or the other, the motor is moving faster or slower in one direction or the other. 
A gain block is used to convert the 10 bits analog input to the 8 bits motor output. (or the input of this block)
\image{DCMOTOR_exemple.png}

\seealso
ENCODER_SB
SERVO_WRITE_SB
