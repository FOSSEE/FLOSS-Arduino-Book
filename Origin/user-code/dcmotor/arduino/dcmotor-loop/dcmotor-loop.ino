int i;
void setup() {
Serial.begin(115200);   // set the baudrate
pinMode(9,OUTPUT);      // use pins 9 and 10 for motor output
pinMode(10,OUTPUT);
for(i = 0; i < 4; i++){
  analogWrite(9, 100);   // Motor runs at a low speed
  analogWrite(10, 0);
  delay(3000);          // 3 second delay
  analogWrite(9, 0);
  analogWrite(10, 0);    // Motor stops for
  delay(2000);          // 1 seconds
  analogWrite(9, 0);     //
  analogWrite(10, 100);  // Motor runs in the reverse direction for
  delay(2000);          // 2 seconds
  analogWrite(9, 0);     // Stop the 
  analogWrite(10, 0);    // motor rotating
  delay(1000);          // for 1 second
}
}
void loop(){
}
