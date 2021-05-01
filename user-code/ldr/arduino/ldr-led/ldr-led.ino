int val;
int i = 1;
void setup() {
pinMode(11, OUTPUT);          // LED Pin
Serial.begin(115200);
for(i = 1; i <= 2000; i++){
   val = analogRead(A5);      // Value of LDR
   // Serial.println(val);
   if(val < 300){             // Threshold
      digitalWrite(11, HIGH);
   }
   else
   {
      digitalWrite(11, LOW);
   }
}
}
void loop() {
}
