int value;
int i;

void setup() 
{
  pinMode(3,OUTPUT);
  Serial.begin(115200);
  
  for(i=1;i<100;i++)
  {
    value=analogRead(A4); //read value from thermistor
    Serial.println(value); //display
    
    if(value>550)
    {
      digitalWrite(3,HIGH); // Turn ON buzzer
    }
    else
    {
      digitalWrite(3,LOW); // Turn OFF buzzer
    }
    delay(500);
  }
}

void loop() 
{
}
