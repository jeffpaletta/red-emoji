/*import processing.video.*;

int maxMoviesLeft = 10;  // total # of left movies
int maxMoviesRight = 10;  // total # of right movies
int movieIndexLeft = 0;  // left video to be displayed first
int movieIndexRight = 0;  // right video to be displayed first

Movie[] moviesLeft = new Movie[maxMoviesLeft];  // array of left movies
Movie[] moviesRight = new Movie[maxMoviesLeft];  // array of right movies

void setup(){
  size(960, 540);
  //background(255,0,0); //red for debugging
  
    for (int i = 0; i < 2; i ++ ) {  //loading movies into the left array
    moviesLeft[i] = new Movie(this, "left" + i + ".mov");
    //myMovies.read();
    moviesLeft[i].loop();
    
  } for (int i = 0; i < 2; i ++ ) {  //loading movies into the right array
    moviesRight[i] = new Movie(this, "right" + i + ".mov");
    moviesRight[i].loop();
  }
  //println(moviesLeft);
}
void draw(){
  //image(moviesLeft[0], 0, 0, 480, 540);
  //image(moviesRight[0], 480, 0, 480, 540);
  
  println("LEFT MOVIE LOADED: " + moviesLeft);
  println("RIGHT MOVIE LOADED: " + moviesRight);
  
  image(moviesLeft[1], 0, 0, 480, 540);
}
*/
import processing.video.*;
mo
