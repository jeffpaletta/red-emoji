/* Splitscreen Video Switcher v10
 * Jeff Paletta 2016
*/


import processing.video.Movie;
import processing.serial.*;


int end = 10; 
String serial;  
Serial port;  

static final int QTYL = 6; 
final Movie[] moviesLeft = new Movie[QTYL];  
static int indexLeft = 0;

static final int QTYR = 6; 
final Movie[] moviesRight = new Movie[QTYR]; 
static int indexRight = 3;

void setup() { 
  /*
  port = new Serial(this, Serial.list()[9], 9600); // initializing the object by assigning a port and baud rate (must match that of Arduino)
   port.clear();  // function from serial library that throws out the first reading, in case we started reading in the middle of a string from Arduino
   serial = port.readStringUntil(end); // function that reads the string from serial port until a println and then assigns string to our string variable (called 'serial')
   serial = null; // initially, the string will be null (empty)
   */

  size(1920, 1080, JAVA2D);
  frameRate(24);
  noSmooth();  

  for (int i = 0; i < 6; i++) {
    moviesLeft[i] = new Movie(this, ("video_left_" + i + ".mov"));
    moviesRight[i] = new Movie(this, ("video_right_" + i + ".mov"));
  }
  
  for (int i = 0; i < 6; i++) {
    moviesLeft[i].stop();
    moviesRight[i].stop();
  }
   
  moviesLeft[indexLeft].loop();  
  moviesRight[indexRight].loop();
}

void draw() { 
  background(0);
  /*  
   while (port.available() > 0) { //as long as there is data coming from serial port, read it and store it 
   serial = port.readStringUntil(end);
   }
   if (serial != null) {
   String[] a = split(serial, ',');  //a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
   println(a[0]); //print Value1 (in cell 1 of Array - remember that arrays are zero-indexed)    
   }
   */
  println((indexLeft) + " " + (indexRight));

  set(0, 0, moviesLeft[indexLeft] ); 
  set(960, 0, moviesRight[indexRight] ); 

  if (indexLeft != indexRight) {
    fill(255, 0, 0);
    rect(20, 20, 10, 10);
  }
  
  /*if (indexLeft == indexRight) {
    moviesLeft[indexLeft].stop();
    moviesRight[indexRight].stop();
    
    set(0,0,moviesBoth[indexLeft]);
    moviesBoth[indexLeft].loop();
  }
    else {
      moviesBoth[indexLeft].stop();
      
      set(960, 0, moviesRight[indexRight] );
      set(0, 0, moviesLeft[indexLeft] );
    } 
*/
}

void movieEvent(Movie m) { 
  m.read();
} 

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
  case '6':
    return 5;
  default: 
    return indexLeft;
  }
}
static final int getMovieIndexRight(int u) {
  switch (u) {
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
  case '6': 
    return 5;
  default: 
    return indexRight;
  }
}
void keyPressed() {

  // left video switcher
  int k = keyCode, n = getMovieIndexLeft(k) ;

  if (n >= 0 ) {  
    moviesLeft[indexLeft].stop(); 
    moviesLeft[indexLeft = n].loop();
  }
  
  // right video switcher  
  int u = keyCode, b = getMovieIndexRight(u) ;

  if (n >= 0 ) { 
    moviesRight[indexRight].stop(); 
    moviesRight[indexRight = b].loop();
  }

  if (keyCode == LEFT) {
    // dont touch this part; needed to reset when end of array is reached
    if (indexLeft < 2) {
      indexLeft++;
    } else {
      indexLeft = 0;
    }
  }

  if (keyCode == RIGHT) {
    // dont touch this part; needed to reset when end of array is reached
    if (indexRight < 5) {
      indexRight++;
    } else {
      indexRight = 3;
    }
  }
  if (keyCode == UP) {
    indexLeft = indexRight;
  }
  if (keyCode == DOWN) {
    indexRight = indexLeft;
  }
}
