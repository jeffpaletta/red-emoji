#include <Servo.h>
Servo myservo;  // create servo object to control a servo

char val;

int switchState = 0;      // twelve servo objects can be created on most boards
int switchState7 = 0;
int switchStateServo = 0;      // twelve servo objects can be created on most boards

int pos = 0;    // variable to store the servo position


void setup() {
  Serial.begin(1200); //Begin Serial Communication with a baud rate of 9600
  myservo.attach(9);
  pinMode(2, INPUT); // attaches the servo on pin 9 to the servo object

}

void loop() {
  //New variables are declared to store the readings of the respective pins
  //  int Value1 = digitalRead(digitalPin2);
  //int Value2 = analogRead(AnalogPin1);

  switchState = digitalRead(2);
  switchState7 = digitalRead(7);

  if (switchState == LOW) {
    Serial.println("2_LOW");
  } else if (switchState == HIGH) {
    Serial.println("2_HIGH");
    // delay(5000);
  }

  if (switchState7 == LOW) {
    Serial.println("7_LOW");
  } else if (switchState7 == HIGH) {
    Serial.println("7_HIGH");
    //delay(5000);
  }

  if (Serial.available())
  { // If data is available to read,
    val = Serial.read(); // read it and store it in val

  }
}
 /* if (val == '1')
  { // If 1 was received
    for (pos = 60; pos >= 0; pos -= 1) // goes from 180 degrees to 0 degrees
    {
      myservo.write(pos);              // tell servo to go to position in variable 'pos'
      delay(5);                       // waits 15ms for the servo to reach the position
    } 
  }
  else {
  }
  if (val == '2')
  { // If 1 was received
    for (pos = 60; pos >= 0; pos -= 1) // goes from 180 degrees to 0 degrees
    {
      myservo.write(pos);              // tell servo to go to position in variable 'pos'
      delay(5);                       // waits 15ms for the servo to reach the position
    } 
  }
  else {
  }
  }*/
  /*else {
      for (pos = 0; pos <= 0; pos += 1) // goes from 0 degrees to 180 degrees
      { // in steps of 1 degree
        myservo.write(pos);              // tell servo to go to position in variable 'pos'
        delay(5);                       // waits 15ms for the servo to reach the position
      }
    }
*/

    /*digitalWrite(ledPin, HIGH); // turn the LED on
      } else {
      digitalWrite(ledPin, LOW); // otherwise turn it off
      }
      delay(10); // Wait 10 milliseconds for next reading*/
  

