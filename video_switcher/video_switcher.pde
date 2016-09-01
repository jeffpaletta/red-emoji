import processing.video.Movie;
 

static final int QTYL = 5;  // quantity, total number of videos in the LEFT array
final Movie[] moviesLeft = new Movie[QTYL];  // setting up an array for LEFT-side videos with (QTYL) items
static int indexLeft;

static final int QTYR = 5;  // quantity, total number of videos in the RIGHT array
final Movie[] moviesRight = new Movie[QTYR];  // setting up an array for RIGHT-side videos with (QTYR) items
static int indexRight;
 
void setup() { 
  size(960, 540, JAVA2D);
  frameRate(24);
  noSmooth();  // helps cut down on framerate issues
  
  //  all these could be nice, clean for loops but somehow that 
  //  didnt work so this code is shitty (:
  
  moviesLeft[0] = new Movie(this, "left0.mov");  // loading the left videos
  moviesLeft[1] = new Movie(this, "left1.mov");
  moviesLeft[2] = new Movie(this, "left2.mov");
  moviesLeft[3] = new Movie(this, "left3.mov");
  moviesLeft[4] = new Movie(this, "left4.mov");
    
  moviesLeft[0].stop();  // stops the loaded left videos from autoplaying
  moviesLeft[1].stop();
  moviesLeft[2].stop();
  moviesLeft[3].stop();
  moviesLeft[4].stop();
  
  moviesLeft[indexLeft].loop();  // sets videos to play on auto-repeat
  
  moviesRight[0] = new Movie(this, "right0.mov");  // loading the right videos
  moviesRight[1] = new Movie(this, "right1.mov");
  moviesRight[2] = new Movie(this, "right2.mov");
  moviesRight[3] = new Movie(this, "right3.mov");
  moviesRight[4] = new Movie(this, "right4.mov");
    
  moviesRight[0].stop();  // stops the loaded right videos from autoplaying
  moviesRight[1].stop();
  moviesRight[2].stop();
  moviesRight[3].stop();
  moviesRight[4].stop();
  
  moviesRight[indexRight].loop();   // sets videos to play on auto-repeat
}
void draw() { 
  background(0);
  
  set(0,0,moviesLeft[indexLeft] ); // draw the left side video on left side of screen
  //image(films[0],0,0);
  //image(films[1],0,0);
  //image(films[2],0,0);
  
  set(480,0,moviesRight[indexRight] ); // draw the right side video on right side of screen
  //image(films[0],0,0);
  //image(films[1],0,0);
  //image(films[2],0,0);
} 
 
void movieEvent(Movie m) { 
  m.read(); 
} 

 int h = indexLeft; 
 int g = indexRight; 
 
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
  int k = keyCode, n = getMovieIndexLeft(k) ;
 
  if (n >= 0 ){ //& n!= indexLeft) { 
    moviesLeft[indexLeft].pause(); 
    moviesLeft[indexLeft = n].loop(); }
    
  int u = keyCode, b = getMovieIndexRight(u) ;
 
  if (n >= 0 ){ //& n!= indexLeft) { 
    moviesRight[indexRight].pause(); 
    moviesRight[indexRight = b].loop(); }
}
