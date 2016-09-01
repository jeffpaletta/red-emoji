import processing.video.Movie;
import org.gstreamer.elements.PlayBin2;
 
 
// using playbin library to help reduce lag, dont worry bout it lol
static final PlayBin2.ABOUT_TO_FINISH FINISHING = new PlayBin2.ABOUT_TO_FINISH() {
  @ Override void aboutToFinish(PlayBin2 elt) {
    println("Finishing...", elt.get("uri"));
  }
};

 
// this is the array we call our video in, you can add as many as you want (DONT CRASH THO) 
static final String[] FILMS = {
  "alwaysSunny.mov", "ferrisBueller.mov", "dareDevil.mov"
};
 
static final float JUMP = 3.0, MULT = 3.34, FPS = 30.0 ;
 
final Movie[] movies = new Movie[FILMS.length];
Movie m;
 
int idx, x, y;
boolean isPaused;
 
void setup() {
  size(960, 540, JAVA2D);
 
  noSmooth();
  noLoop();
  frameRate(FPS);
  background(0);
 
  for (String s : FILMS)  (movies[idx++] = new Movie(this, s))
    .playbin.connect(FINISHING);
 
  (m = movies[idx = 0]).loop();
 
  while (m.width == 0)  delay(100);
  centralizeMovie();
}
 
void draw() {
  set(x, y, m);
 
  surface.setTitle(round(m.time()) + "\t " + round(m.duration())
    + "\t " + FILMS[idx]);
}
 
void movieEvent(Movie m) {
  m.read();
  redraw();
}
 
void keyPressed() {
  int k = keyCode, n = k - '1';
 
  if (n>=0 & n<movies.length & n!=idx) {
    m.pause();
    (m = movies[idx = n]).loop();
    isPaused = false;
 
    centralizeMovie();
    background(0);
    return;
  }
 
  if (k==LEFT | k==RIGHT | k==UP | k==DOWN)
    jumpMovie(m, k==RIGHT | k==UP, k==DOWN | k==UP);
  else mousePressed();
}


// click on the video to pause (not sure if we need this lol but i added it) 
void mousePressed() {
  if (isPaused ^= true)  m.pause();
  else                   m.play();
}
 
void centralizeMovie() {
  x = width  - m.width  >> 1;
  y = height - m.height >> 1;
}
 
static final void jumpMovie(Movie m, boolean forward, boolean faster) {
  float time = m.time(), len = m.duration();
 
  if (time>1.0 & time<len - JUMP) {
    float where = time + (forward? JUMP : -JUMP)*(faster? MULT : 1.0);
    m.jump(constrain(where, 0.0, len - 1.0));
  }
}
 
@ Override void exit() {
  for (Movie m : movies)  m.stop();
  super.exit();
}
