import processing.video.Movie;
 
static final int QTY = 3;
final Movie[] movies = new Movie[QTY];
int idx;
 
 
void setup() { 
  size(1440, 900, JAVA2D);
  frameRate(24);
  noSmooth();
  
  movies[0] = new Movie(this, "alwaysSunny.mov");
  movies[1] = new Movie(this, "ferrisBueller.mov");
  movies[2] = new Movie(this, "dareDevil.mov");
 
  movies[0].stop();  
  movies[1].stop();
  movies[2].stop();
  
  movies[idx].loop();
}
 
void draw() { 
  background(0);
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
