/* Splitscreen Video Switcher v10
 * Jeff Paletta 2016
 *
 *
 * CONTROLS:
 * left arrow   =   cycle through videos on the left side
 * right arrow  =   cycle through videos on the right side
 *
 *
 * NOTES:
 * red square appears in top left corner if videos dont match up
 * (this is just a placeholder for now)
 *
 *
 * theres a bug where videos dont load the first time theyre called out.
 * press each arrow key a few times until the videos finally appear. 
 * it should work normally after that.
 *
 * 20 videos (10 + 10) are set up, but i only have 12 (6 + 6) set to run
 * because any more caused too much lag. 
 */

import processing.video.Movie;
import processing.serial.*; //import the Serial library

int end = 10;    // the number 10 is ASCII for linefeed (end of serial.println), later we will look for this to break up individual messages
String serial;   // declare a new string called 'serial' . A string is a sequence of characters (data type know as "char")
Serial port;  // The serial port, this is a new instance of the Serial class (an Object)
 
static final int QTYL = 10;  // quantity, total number of videos in the LEFT array
final Movie[] moviesLeft = new Movie[QTYL];  // setting up an array for LEFT-side videos with (QTYL) items
static int indexLeft;

static final int QTYR = 10;  // quantity, total number of videos in the RIGHT array
final Movie[] moviesRight = new Movie[QTYR];  // setting up an array for RIGHT-side videos with (QTYR) items
static int indexRight;
 
void setup() { 
  //port = new Serial(this, Serial.list()[9], 9600); // initializing the object by assigning a port and baud rate (must match that of Arduino)
  //port.clear();  // function from serial library that throws out the first reading, in case we started reading in the middle of a string from Arduino
  //serial = port.readStringUntil(end); // function that reads the string from serial port until a println and then assigns string to our string variable (called 'serial')
 // serial = null; // initially, the string will be null (empty)

  size(960, 540, JAVA2D);
  frameRate(24);
  noSmooth();  // helps cut down on framerate issues

  // Loads videos into respective arrays
  for (int i = 0; i < 6; i++){
    moviesLeft[i] = new Movie(this, ("left" + i + ".mov"));
    moviesRight[i] = new Movie(this, ("right" + i + ".mov"));
  }
  // Stops all videos from autoplaying at once
  for (int i = 0; i < 6; i++){
    moviesLeft[i].stop();
    moviesRight[i].stop();
  }
  // Makes videos auto-replay when theyre finished 
  moviesLeft[indexLeft].loop();  
  moviesRight[indexRight].loop();
}
void draw() { 
  background(0);
  
 /*  while (port.available() > 0) { //as long as there is data coming from serial port, read it and store it 
    serial = port.readStringUntil(end);
  }
    if (serial != null) {
      String[] a = split(serial, ',');  //a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
      println(a[0]); //print Value1 (in cell 1 of Array - remember that arrays are zero-indexed)
      
    }
  */
  //prints currently active/playing videos in the console
  println((indexLeft) + " " + (indexRight));
  
  // draw the left side video on left side of screen
  set(0,0,moviesLeft[indexLeft] ); 

  // draw the right side video on right side of screen
  set(480,0,moviesRight[indexRight] ); 
  //image(films[0],0,0);
  //image(films[1],0,0);
  //image(films[2],0,0);
  
  // checks if the videos match up
  if (indexLeft != indexRight) {
    
    // IF THEY DONT MATCH, DO THIS (CONTROLS RED LIGHT?)
    fill(255,0,0);;
    rect(20,20,10,10);
  }
} 
void movieEvent(Movie m) { 
  m.read(); 
} 
// individual left video controls for debugging --> keys 1,2,3,4,5
static final int getMovieIndexLeft(int k) {
  switch (k) {
  case '1': 
    return 0;
  case '2': 
    return 1;
  case '3': 
    return 2;
 case '4': 
    return 3;
 case '5': 
    return 4;
  default: 
    return indexLeft;
  }
}
  // individual right video controls for debugging --> keys 6,7,8,9,0
  static final int getMovieIndexRight(int u) {
  switch (u) {
  case '6': 
    return 0;
  case '7': 
    return 1;
  case '8': 
    return 2;
  case '9': 
    return 3;
  case '0': 
    return 4;
  default: 
    return indexRight;
  } 
}
void keyPressed() {
  
  // left video switcher
  int k = keyCode, n = getMovieIndexLeft(k) ;
  
  if (n >= 0 ){ //& n!= indexLeft) { 
    moviesLeft[indexLeft].pause(); 
    moviesLeft[indexLeft = n].loop(); }
    
  // right video switcher  
  int u = keyCode, b = getMovieIndexRight(u) ;
 
  if (n >= 0 ){ //& n!= indexLeft) { 
    moviesRight[indexRight].pause(); 
    moviesRight[indexRight = b].loop(); }

  // single button cycling for left videos (reassign imput to big red button)
    if (keyCode == LEFT) {
      // dont touch this part; needed to reset when end of array is reached
      if (indexLeft < 5) {
        indexLeft++;
      } else {
          indexLeft = 0;
        }
      }
    // single button cycling for right videos (reassign imput to big red button)
    if (keyCode == RIGHT) {
      // dont touch this part; needed to reset when end of array is reached
      if (indexRight < 5) {
        indexRight++;
      } else {
          indexRight = 0;
        }
      }      
 }
      
     
