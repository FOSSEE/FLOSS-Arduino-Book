#include <Servo.h> 
Servo myservo;  // create servo object to control a servo 
int angle=20;
int i=0;
void setup() {
  for(i=1;i<10;i++) {
    myservo.attach(9);      // attach the servo object on to pin 9 
    myservo.write(angle*i); // tell servo to rotate by 20 degrees
    delay(1000);            // waits for a sec 
  }
  myservo.detach();
}  
void loop() {
} 

