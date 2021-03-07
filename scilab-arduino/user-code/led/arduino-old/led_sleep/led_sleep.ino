const int LED = 13;

void setup() {
  Serial.begin(115200);
  pinMode(LED,OUTPUT);          //Output mode
  
  digitalWrite(LED,LOW);         //LED OFF
  delay(1000);                    //Delay in milliseconds
  digitalWrite(LED,HIGH);        //LED ON
delay(1000);                    //Delay in milliseconds
  digitalWrite(LED,LOW);
}

void loop() {
  
}
