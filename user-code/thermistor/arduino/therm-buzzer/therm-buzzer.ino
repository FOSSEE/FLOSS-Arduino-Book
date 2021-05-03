int val;
int i;

void setup() 
{
  pinMode(3, OUTPUT);
  Serial.begin(115200);
  
  for(i = 1; i <= 20; i++)
  {
    val = analogRead(A4); //read value from thermistor
    Serial.println(val); //display
    
    if(val > 550)
    {
      digitalWrite(3, HIGH); // Turn ON buzzer
    }
    else
    {
      digitalWrite(3, LOW); // Turn OFF buzzer
    }
    delay(500);
  }
  digitalWrite(3, LOW); // Turn OFF buzzer
}

void loop() 
{
}
