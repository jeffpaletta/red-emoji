import processing.video.Movie;
 
static final int QTY = 3;
final Movie[] movies = new Movie[QTY];
int idx;

Movie finalRight;
 
void setup() { 
  size(960, 540, JAVA2D);
  frameRate(24);
  noSmooth();
  
  finalRight = new Movie(this, "right1.mov");
  finalRight.loop();
  
  movies[0] = new Movie(this, "left1.mov");
  movies[1] = new Movie(this, "left2.mov");
  movies[2] = new Movie(this, "left3.mov");
 
  movies[0].stop();  
  movies[1].stop();
  movies[2].stop();
  
  movies[idx].loop();
}
 
void draw() { 
  background(0);
  set(480,0,finalRight);
  
  set(0,0,movies[idx] ); 
  //image(films[0],0,0);
  //image(films[1],0,0);
  //image(films[2],0,0);
} 
 
void movieEvent(Movie m) { 
  m.read(); 
} 
 
static final int getMovieIndex(int k) {
  switch (k) {
  case 'A': 
    return 0;
  case 'S': 
    return 1;
  case 'D': 
    return 2;
  default: 
    return -1;
  }
}
 
void keyPressed() {
  int k = keyCode, n = getMovieIndex(k) ;
 
  if (n >= 0 ){ //& n!= idx) { 
    movies[idx].pause(); 
    movies[idx = n].loop(); }
}
