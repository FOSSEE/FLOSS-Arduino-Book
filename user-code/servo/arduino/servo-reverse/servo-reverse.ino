#include <Servo.h> 
Servo myservo;  // create servo object to control a servo 
void setup() {
  Serial.begin(115200); 
  myservo.attach(5); // attach the servo object on to pin 5 
  myservo.write(90); // tell servo to rotate by 90 degrees
  delay(1000);
  myservo.write(45);
  delay(1000);
  myservo.detach();
}  
void loop() {
} 
