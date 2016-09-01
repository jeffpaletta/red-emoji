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

void setup() { 


  size(1920, 1080, JAVA2D);
  frameRate(24);
  noSmooth();  

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
    moviesLeft[i].stop();
    moviesRight[i].stop();
    moviesBoth[i].stop();
  }

  moviesLeft[indexLeft].loop();  
  moviesRight[indexRight].loop();
  moviesBoth[indexLeft].loop();


  minim = new Minim(this);
  for (int i = 0; i < 2; i++) {
    player[i] = minim.loadFile("audio_" + i + ".mp3");
  }
}

void draw() { 
  background(0);


  //print(player);


  println((indexLeft) + " " + (indexRight));

  set(0, 0, moviesLeft[indexLeft] ); 
  set(960, 0, moviesRight[indexRight] ); 

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
  }
  if (keyCode == UP) {
    indexLeft = indexRight;
  }
  if (keyCode == DOWN) {
    indexRight = indexLeft;
  }
}
