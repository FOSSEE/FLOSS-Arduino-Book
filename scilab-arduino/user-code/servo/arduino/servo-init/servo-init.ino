#include <Servo.h> 
Servo myservo;  // create servo object to control a servo 
void setup() {
  Serial.begin(115200); 
  myservo.attach(9); // attach the servo object on to pin 9 
  myservo.write(30); // tell servo to rotate by 30 degrees
  delay(1000);
  myservo.detach();
}  
void loop() {
} 

