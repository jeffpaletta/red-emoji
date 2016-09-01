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
 
static final int QTYL = 10;  // quantity, total number of videos in the LEFT array
final Movie[] moviesLeft = new Movie[QTYL];  // setting up an array for LEFT-side videos with (QTYL) items
static int indexLeft;

static final int QTYR = 10;  // quantity, total number of videos in the RIGHT array
final Movie[] moviesRight = new Movie[QTYR];  // setting up an array for RIGHT-side videos with (QTYR) items
static int indexRight;
 
void setup() { 
  size(960, 540, JAVA2D);
  //frameRate(24);
  //noSmooth();  // helps cut down on framerate issues

  // Loads videos into respective arrays
  for (int i = 0; i < 2; i++){
    moviesLeft[i] = new Movie(this, ("left" + i + ".mov"));
    moviesRight[i] = new Movie(this, ("right" + i + ".mov"));
  }
  // Stops all videos from autoplaying at once
  for (int i = 0; i < 2; i++){
    moviesLeft[i].stop();
    moviesRight[i].stop();
  }
  // Makes videos auto-replay when theyre finished 
  moviesLeft[indexLeft].loop();  
  moviesRight[indexRight].loop();
}
void draw() { 
  background(0);
  
  //prints currently active/playing videos in the console
  println((indexLeft) + " " + (indexRight));
  
  // draw the left side video on left side of screen
  image(moviesRight[indexRight], 480,0); 
  image(moviesLeft[indexLeft],0,0 ); 

  // draw the right side video on right side of screen

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
      if (indexLeft < 2) {
        indexLeft++;
      } else {
          indexLeft = 0;
        }
      }
    // single button cycling for right videos (reassign imput to big red button)
    if (keyCode == RIGHT) {
      // dont touch this part; needed to reset when end of array is reached
      if (indexRight < 2) {
        indexRight++;
      } else {
          indexRight = 0;
        }
      }      
 }
      
     
