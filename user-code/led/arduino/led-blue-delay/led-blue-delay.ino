void setup() {
pinMode(9,OUTPUT);
Serial.begin(115200); 
digitalWrite(9,HIGH);
delay(2000);
digitalWrite(9,LOW);
}
void loop() {
}
