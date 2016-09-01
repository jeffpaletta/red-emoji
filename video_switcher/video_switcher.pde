import processing.video.*;

int maxMovies= 6;
int rand = int(random(maxMovies)); 

Movie[] myMovies=new Movie[maxMovies] ;

ArrayList<PVector> moviePos      = new ArrayList<PVector>();
ArrayList<Movie>   moviesPlaying = new ArrayList<Movie>();

Movie firstClipMovie;


void setup() {
   size (960, 540);

  //for (int i = 0; i < myMovies.length; i ++ ) {
    myMovies[1] = new Movie(this, "1.mov");
    myMovies[2] = new Movie(this, "2.mov");
    myMovies[3] = new Movie(this, "3.mov");
    myMovies[4] = new Movie(this, "4.mov");
    myMovies[5] = new Movie(this, "5.mov");
    myMovies[6] = new Movie(this, "0.mov");
  //}

  firstClipMovie = new Movie(this, "alwaysSunny.mov");
  firstClipMovie.loop();

  moviesPlaying.add(firstClipMovie);
  moviePos. add(new PVector (480, 0));

  background(0);
}



void mouseReleased() {
  rand = int(random(maxMovies));

  //store position
  moviePos.add(new PVector(mouseX, mouseY));

  // loop movie and add to playing list 
  moviesPlaying.add(myMovies[rand]);
  moviesPlaying.get(moviesPlaying.size()-1).loop();
}

void draw() {
  background(0);
  tint(255, 155);

  for (int i = 0; i< moviesPlaying.size(); i++ ) {    
    // temp vars to keep things neat :)
    Movie m = moviesPlaying.get(i);
    float x = moviePos.get(i).x;
    float y = moviePos.get(i).y;

    
    if (m.available())
      m.read();

    image(m, 0, 0, (width/2), height);
  }
  
  //frameRate
 
  frame.setTitle("fps" + frameRate);
}
