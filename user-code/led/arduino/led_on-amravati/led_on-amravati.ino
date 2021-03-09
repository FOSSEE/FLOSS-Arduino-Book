
void setup() {
pinMode(9,OUTPUT); 
Serial.begin(115200);
}

void loop() {
digitalWrite(9,HIGH);
delay(1000);
digitalWrite(9,LOW);
delay(30000);
}
