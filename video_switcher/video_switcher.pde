<<<<<<< HEAD
// THE WORLDS SHITTIES CODE

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.video.Movie;
import processing.serial.*;
import processing.sound.*;

import processing.serial.*; 

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
String convertedDataFromRFID;
String load;
//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

AudioPlayer[] player = new AudioPlayer[6];
Minim minim;
//FFT fft; 
float valTwo; 
int valTwo2; 
int bufferSize = 8; 
int fftSize = floor(bufferSize*.9)+1; 
int count=0; 


static final int QTYL = 2; 
final Movie[] moviesLeft = new Movie[QTYL];  
static int indexLeft = 0;

static final int QTYR = 2; 
final Movie[] moviesRight = new Movie[QTYR]; 
static int indexRight = 0;

static final int QTYB = 2; 
final Movie[] moviesBoth = new Movie[QTYB]; 
=======
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

static final int QTYL = 6;  // quantity, total number of videos in the LEFT array
final Movie[] moviesLeft = new Movie[QTYL];  // setting up an array for LEFT-side videos with (QTYL) items
static int indexLeft;

static final int QTYR = 6;  // quantity, total number of videos in the RIGHT array
final Movie[] moviesRight = new Movie[QTYR];  // setting up an array for RIGHT-side videos with (QTYR) items
static int indexRight;

static final int QTYB = 6;  
final Movie[] moviesBoth = new Movie[QTYB]; 
static int indexBoth;
>>>>>>> parent of f20d989... Version 13

void setup() { 


  size(960, 540, JAVA2D);
  frameRate(24);
  noSmooth();  // helps cut down on framerate issues

<<<<<<< HEAD
  //&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&  
  printArray(Serial.list());
  String portName = Serial.list()[11]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 1200);
  //&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

  for (int i = 0; i < 2; i++) {
    moviesLeft[i] = new Movie(this, ("video_left_" + i + ".mov"));
    moviesRight[i] = new Movie(this, ("video_right_" + i + ".mov"));
    moviesBoth[i] = new Movie(this, ("video_both_" + i + ".mov"));
  }

  for (int i = 0; i < 2; i++) {
=======
  // Loads videos into respective arrays
  for (int i = 0; i < 6; i++) {
    moviesLeft[i] = new Movie(this, ("left" + i + ".mov"));
    moviesRight[i] = new Movie(this, ("right" + i + ".mov"));
    moviesBoth[i] = new Movie(this, ("both" + i + ".mov"));
  }
  // Stops all videos from autoplaying at once
  for (int i = 0; i < 6; i++) {
>>>>>>> parent of f20d989... Version 13
    moviesLeft[i].stop();
    moviesRight[i].stop();
    moviesBoth[i].stop();
  }
<<<<<<< HEAD

  moviesLeft[indexLeft].loop();  
  moviesRight[indexRight].loop();
  moviesBoth[indexLeft].loop();


  minim = new Minim(this);
  for (int i = 0; i < 2; i++) {
    player[i] = minim.loadFile("audio_" + i + ".mp3");
  }
=======
  // Makes videos auto-replay when theyre finished 
  moviesLeft[indexLeft].loop();  
  moviesRight[indexRight].loop();
  moviesBoth[indexBoth].loop();
>>>>>>> parent of f20d989... Version 13
}
void draw() { 
  background(0);
<<<<<<< HEAD


  //print(player);


=======
  /*  
   while (port.available() > 0) { //as long as there is data coming from serial port, read it and store it 
   serial = port.readStringUntil(end);
   }
   if (serial != null) {
   String[] a = split(serial, ',');  //a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
   println(a[0]); //print Value1 (in cell 1 of Array - remember that arrays are zero-indexed)    
   }
   */
  //prints currently active/playing videos in the console
>>>>>>> parent of f20d989... Version 13
  println((indexLeft) + " " + (indexRight));

  // draw the left side video on left side of screen
  set(0, 0, moviesLeft[indexLeft] ); 

<<<<<<< HEAD
  player[indexLeft].play();
  player[indexRight].play();    
    
 

  if ((indexLeft == 0) && (indexRight == 0)) {
    player[0].play();
    player[1].pause();
    player[1].rewind();
    moviesLeft[0].stop();
    moviesLeft[1].stop();
    moviesRight[0].stop();
    moviesRight[1].stop();
    moviesBoth[1].stop();
    image(moviesBoth[0], 0, 0, 1920, 1080);
    moviesBoth[0].loop();
    moviesBoth[0].play();
  }

  if ((indexLeft == 1) && (indexRight == 1)) {
    player[1].play();
    player[0].pause();
    player[0].rewind();
    moviesLeft[1].stop();
    moviesLeft[0].stop();
    moviesRight[1].stop();
    moviesRight[0].stop();
    moviesBoth[0].stop();
    image(moviesBoth[1], 0, 0, 1920, 1080);
    //moviesBoth[1].loop();
    moviesBoth[1].play();
  }

  if ((indexLeft == 1) && (indexRight == 0)) {
    player[1].play();
    player[0].play();
    moviesLeft[1].loop();
    moviesLeft[1].play();
    moviesLeft[0].stop();
    moviesRight[1].stop();
    moviesRight[0].loop();
    moviesRight[0].play();
    moviesBoth[0].stop();
    moviesBoth[1].stop();
  }

  if ((indexLeft == 0) && (indexRight == 1)) {
    moviesBoth[1].stop();
    moviesBoth[0].stop();
    player[1].play();
    player[0].play();
    moviesLeft[0].loop();
    moviesLeft[0].play();
    moviesLeft[1].stop();
    moviesRight[0].stop();
    moviesRight[1].loop();
    moviesRight[1].play();
  }

  //&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

  if ( myPort.available() > 0) 
  {  // If data is available,
    val = myPort.readStringUntil('\n');         // read it and store it in val
  }
  if (val != null ) {
    val = trim(val);
    println(val); 


    if (val.equals ("7_HIGH")) {
      myPort.write('1');
      println("1");
      if (indexLeft < 1) {
        indexLeft++;
      } else {
        indexLeft = 0;
      }
      for (int i = 0; i <1; i++) {
        player[i].pause();
        player[i].rewind();
      }
      player[indexRight].play();
    }




    if (val.equals("2_HIGH")) {
     myPort.write('1');
     println("1");
      if (indexRight < 1) {
        indexRight++;
      } else {
        indexRight = 0;
      }
    }
  }


/*if (keyCode == LEFT) {
  if (indexLeft < 1) {
    indexLeft++;
  } else {
    indexLeft = 0;
  }
  for (int i = 0; i <1; i++) {
    player[i].pause();
    player[i].rewind();
  }
  player[indexRight].play();
}
if (keyCode == RIGHT) {
  if (indexRight < 1) {
    indexRight++;
  } else {
    indexRight = 0;
  }
}*/
//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


}
=======
  // draw the right side video on right side of screen
  set(480, 0, moviesRight[indexRight] ); 
  //image(films[0],0,0);
  //image(films[1],0,0);
  //image(films[2],0,0);

  // checks if the videos match up
  if (indexLeft != indexRight) {

    // IF THEY DONT MATCH, DO THIS (CONTROLS RED LIGHT?)
    fill(255, 0, 0);
    ;
    rect(20, 20, 10, 10);
  }
>>>>>>> parent of f20d989... Version 13

  //fixes video seam lag but heavy on GPU
  for (int i = 0; i < 6; i++) {
    if (indexLeft == i && indexRight == i) {
      moviesLeft[indexLeft].pause();
      moviesRight[indexRight].pause();
      set(0, 0, moviesBoth[1] );
      moviesBoth[1].loop();
      rect(50, 50, 50, 50);
    }
  }
  /*if (indexLeft == 1 && indexRight == 1) {
    moviesLeft[indexLeft].pause();
    moviesRight[indexRight].pause();
    set(0, 0, moviesBoth[1] );
    moviesBoth[1].loop();
    rect(50, 50, 50, 50);
  }*/
 /* if (indexLeft == 2 && indexRight == 2) {
    moviesLeft[indexLeft].pause();
    moviesRight[indexRight].pause();
    set(0, 0, moviesBoth[2] );
    moviesBoth[2].loop();
    rect(50, 50, 50, 50);
  }*/
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

  if (n >= 0 ) { //& n!= indexLeft) { 
    moviesLeft[indexLeft].pause(); 
    moviesLeft[indexLeft = n].loop();
  }

  // right video switcher  
  int u = keyCode, b = getMovieIndexRight(u) ;

  if (n >= 0 ) { //& n!= indexLeft) { 
    moviesRight[indexRight].pause(); 
    moviesRight[indexRight = b].loop();
  }

  // single button cycling for left videos (reassign imput to big red button)
  if (keyCode == LEFT) {
<<<<<<< HEAD
    if (indexLeft < 1) {
=======
    // dont touch this part; needed to reset when end of array is reached
    if (indexLeft < 6) {
>>>>>>> parent of f20d989... Version 13
      indexLeft++;
    } else {
      indexLeft = 0;
    }
    for (int i = 0; i <1; i++) {
      player[i].pause();
      player[i].rewind();
    }
    player[indexRight].play();
  }
<<<<<<< HEAD
  if (keyCode == RIGHT) {
    if (indexRight < 1) {
=======
  // single button cycling for right videos (reassign imput to big red button)
  if (keyCode == RIGHT) {
    // dont touch this part; needed to reset when end of array is reached
    if (indexRight < 6) {
>>>>>>> parent of f20d989... Version 13
      indexRight++;
    } else {
      indexRight = 0;
    }
  }
}
