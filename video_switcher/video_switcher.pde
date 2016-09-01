import codeanticode.gsvideo.*;
import oscP5.*; // import oscP5 Library
import netP5.*; // import netP5 Library (part of oscP5 Library)

OscP5 osculator;
GSMovie playerLeft;
GSMovie playerRight;

//global variables
int direction;

//boolean pressUp;
//boolean pressRight;
//boolean pressLeft;

public void setup() {
  size(1280, 720);
  background(0);
  
 /* // osculator setup
  osculator = new OscP5(this, 9000);
  osculator.plug(this, "buttonLeft", "/wii/1/button/Left");
  osculator.plug(this, "buttonRight", "/wii/1/button/Right");
  osculator.plug(this, "buttonUp", "/wii/1/button/Up");
  */

  // GSvideo setup
  playerLeft = new GSMovie(this, "alwaysSunny.mov");
  playerRight = new GSMovie(this, "naruto.mov");
  playerLeft.loop();
  playerRight.loop();
}

void draw() {
  image(playerLeft, 0, 0, 640, 720);
  image(playerRight, 640, 0, 640, 720);
  
/*    if (pressLeft){
  buttonLeft();
  }
 
  if (pressRight){
  buttonRight();
  }

  if (pressUp){
  buttonUp();
  }

*/
}
// THIS KEY PRESS WORKS FINE
void keyPressed() {
  if (key == '1') {  playerLeft = new GSMovie (this, "alwaysSunny.mov");
  playerLeft.play();
} 
  if (key == '2') {  playerLeft = new GSMovie (this, "dareDevil.mov");}
  if (key == '3') {  playerLeft = new GSMovie (this, "naruto.mov");}
  if (key == '7') {  playerRight = new GSMovie (this, "alwyasSunny.mov");} 
  if (key == '8') {  playerRight = new GSMovie (this, "dareDevil.mov");}
  if (key == '9') {  playerRight = new GSMovie (this, "naruto.mov");}
  //movie.loop();
}




/*
//I TRIES TO REPLICATE THE WORKING KEYPRESS WITH MY OWN STATEMENTS
void buttonLeft() {
    player = new GSMovie (this, "tdogg.mov");
  }

void buttonRight() { 
    player = new GSMovie (this, "bunny.mov");
  }
  
void buttonUp () { 
    player = new GSMovie (this, "transit.mov");
  }
  */
