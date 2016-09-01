
#include <Servo.h> 
 
Servo myservo;  // create servo object to control a servo 
         
int switchState = 0;      // twelve servo objects can be created on most boards
 
int pos = 0;    // variable to store the servo position 
 
void setup() {
  Serial.begin(9600); //Begin Serial Communication with a baud rate of 9600
  myservo.attach(9); 
  pinMode(2,INPUT); // attaches the servo on pin 9 to the servo object 
} 
 
void loop() 
{ 
  
  switchState = digitalRead(2);
  
  if(switchState == LOW) {
    for(pos = 0; pos <= 0; pos += 1) // goes from 0 degrees to 180 degrees 
  {                                  // in steps of 1 degree 
    myservo.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(5);                       // waits 15ms for the servo to reach the position 
  } 
  
  }
  
  if(switchState == HIGH) {
  for(pos = 60; pos>=0; pos-=1)     // goes from 180 degrees to 0 degrees 
  {                                
    myservo.write(pos);              // tell servo to go to position in variable 'pos' 
    delay(5);                       // waits 15ms for the servo to reach the position 
  } 
  }
  /*Serial.print(Value1, DEC); 
  Serial.print(",");
  Serial.print(Value2, DEC);
  Serial.println();
  delay(500); */
} 

