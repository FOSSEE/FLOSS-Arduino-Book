void setup() {
Serial.begin(9600); // set the baudrate=9600
pinMode(9,OUTPUT);  // use pins 9 and 10 for motor output
pinMode(10,OUTPUT);
analogWrite(9,100); // PWM 100 on pin 9 makes the motor rotate
analogWrite(10,0); 
delay(3000);        // This is allowed to continue for 3 seconds 
analogWrite(9,0);   // 0 on pin 9 stops the motor
analogWrite(10,0);
}
void loop() {
// what is put here will run in an infinite loop
}
