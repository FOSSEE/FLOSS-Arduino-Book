void setup() {
pinMode(9,OUTPUT); 
pinMode(11,OUTPUT);
Serial.begin(115200);
digitalWrite(9,HIGH);
digitalWrite(11,HIGH);
delay(5000);
digitalWrite(9,LOW);
delay(3000);
digitalWrite(11,LOW);
}
void loop() {
}
