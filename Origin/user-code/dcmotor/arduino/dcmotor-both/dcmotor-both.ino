void setup() {
Serial.begin(115200); // set the baudrate
pinMode(9, OUTPUT);    // use pins 9 and 10 for motor output
pinMode(10, OUTPUT);
analogWrite(9, 100);   // Motor runs at a low speed
analogWrite(10, 0);
delay(3000);          // 3 second delay
analogWrite(9, 0);     //
analogWrite(10, 100);  // Motor runs in the reverse direction for
delay(2000);          // 2 seconds
analogWrite(9, 0);     // Motor is stopped
analogWrite(10, 0);    //
}
void loop(){
  // Code here runs in an infinite loop
}
