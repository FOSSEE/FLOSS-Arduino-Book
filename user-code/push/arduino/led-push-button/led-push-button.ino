const int sensorPin = 12;    
const int ledPin = 9;      
int sensorValue;  
int i;
void setup() {
  Serial.begin(115200);  
  pinMode(9, OUTPUT);
  pinMode(12, INPUT);
  for (i = 0; i < 1000; i++) {
    sensorValue = digitalRead(12);
    if (sensorValue==0) {
      digitalWrite(9, LOW);
      delay(5);
    } 
    else { 
     digitalWrite(9, HIGH);
     delay(5);
    } 
  }
}
void loop() {
}
