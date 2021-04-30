int sensorPin = 12; // Declare the push-button       
int sensorValue = 0;  
void setup() {
  Serial.begin(115200);
  pinMode(sensorPin, INPUT);   // declare the sensorPin as an INPUT
  for (int i = 0; i < 1000; i++){
     sensorValue = digitalRead(sensorPin); // read push-button value
     Serial.println(sensorValue); // print it at the Serial Monitor
  }
}
void loop() {
}
