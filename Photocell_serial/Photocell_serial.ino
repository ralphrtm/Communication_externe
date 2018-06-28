//www.elegoo.com
//2016.12.9


#define pc A7

int pcVal;

void setup() 
{
  pinMode(pc, INPUT);
  Serial.begin(9600);
  delay(1000);
}

void loop() 
{
  pcVal = analogRead(pc);
  Serial.write(pcVal);
  delay(100);
}


