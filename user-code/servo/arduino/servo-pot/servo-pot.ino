#include <Servo.h>
Servo myservo;  // create servo object to control a servo
int potpin = 2; // analog pin used to connect the potentiometer
int val;        // variable to read the value from the analog pin
int i;
void setup(){
  Serial.begin(115200);
  myservo.attach(5);        // attach the servo object on to pin 5
  for(i = 0; i < 50; ++i){
  val = analogRead(potpin); // reads a value in (0,1023) through pot
  val = map(val, 0, 1023, 0, 180); // maps it in the range (0,180) degrees 
  myservo.write(val);       // moves the motor to the mapped degree
  delay(500);               // waits for a second for servo to reach
  }
  myservo.detach();
}
void loop(){ 
} 
