

#include <Servo.h>

Servo myservo;  // create servo object to control a servo

int switchState_2 = 0;      // twelve servo objects can be created on most boards
int switchState_4 = 0;

int pos = 0;    // variable to store the servo position

void setup() {
  Serial.begin(9600); //Begin Serial Communication with a baud rate of 9600
  myservo.attach(9);
  pinMode(2, INPUT); // attaches the servo on pin 9 to the servo object
  pinMode(4, INPUT);
}

void loop()
{

  switchState_2 = digitalRead(2);
  switchState_4 = digitalRead(4);


  if (switchState_2 == HIGH) {
    //for(pos = 0; pos <= 0; pos += 1) // goes from 0 degrees to 180 degrees
    // {                                  // in steps of 1 degree
    //myservo.write(pos);              // tell servo to go to position in variable 'pos'
    // delay(5);                       // waits 15ms for the servo to reach the position
    Serial.println("2_HIGH");
    delay(5);
  } else {
   
    /*for(pos = 60; pos>=0; pos-=1)     // goes from 180 degrees to 0 degrees
      {
      myservo.write(pos);              // tell servo to go to position in variable 'pos'
      delay(5);                       // waits 15ms for the servo to reach the position
      } */
   
    delay(5);
  }

  if (switchState_4 == HIGH) {
    Serial.println("4_HIGH");
    delay(5);
  }
  else {
    
    delay(5);
  }







  //  Serial.print(Value1, DEC);
  //Serial.print(",");
  // Serial.print(Value2, DEC);
  // Serial.println();
  // delay(500);
}

