int val;                 // for LDR
int i = 1;
void setup() {
Serial.begin(115200);
for(i = 1; i <= 20; i++){
   val = analogRead(A5);   // value of LDR
   Serial.println(val);  // for display
   delay(500);
  }
}
void loop() {
}
