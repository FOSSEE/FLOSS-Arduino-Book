const int sensorPin = 12;    
const int ledPin = 9;      
int sensorValue = 0;  
int i;
void setup() {
  Serial.begin(115200);  
  pinMode(sensorPin, INPUT);
  pinMode(ledPin, OUTPUT);
  for (i = 0; i < 50; i++) {
    sensorValue = digitalRead(sensorPin);
    Serial.println(sensorValue); // print it at the Serial Monitor
    if (sensorValue == 0) {
      digitalWrite(ledPin, LOW);
      delay(200);
    } 
    else { 
     digitalWrite(ledPin, HIGH);
     delay(200);
    } 
  }
}
void loop() {
}
