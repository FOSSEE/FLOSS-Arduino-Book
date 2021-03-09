const int POT = 2;
const int RGB_RED = 11;
const int RGB_GREEN = 10;
const int RGB_BLUE = 9;
int p=0;
int i=0;
void setup() {
  Serial.begin(115200);
  pinMode(POT,INPUT);
  pinMode(RGB_RED,OUTPUT);
  pinMode(RGB_GREEN,OUTPUT);
  pinMode(RGB_BLUE,OUTPUT);
  for(i=0;i<10;i++){
     p = analogRead(POT);
  if(p>=0 & p<320) {               //threshold 1 
    digitalWrite(RGB_RED,HIGH);
    delay(1000);
    digitalWrite(RGB_RED,LOW);
  }else if(p>=320 &p<=900) {       //threshold 2 
    digitalWrite(RGB_GREEN,HIGH);
    delay(1000);
    digitalWrite(RGB_GREEN,LOW); 
  }else if(p>900 & p<=1023) {      //threshold 3
    digitalWrite(RGB_BLUE,HIGH);
    delay(1000); 
    digitalWrite(RGB_BLUE,LOW); 
  } 
  }
}
void loop() { 
}
