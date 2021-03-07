int value;
int i;

void setup() 
{
  Serial.begin(115200);
  for(i=1;i<=40;i++)
  {
    value=analogRead(A4); //read value from thermistor
    Serial.println(value); //display 
    delay(500);
  }

}

void loop() 
{  
}
