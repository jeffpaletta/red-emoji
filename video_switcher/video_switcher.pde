import codeanticode.gsvideo.*;

//import fullscreen.*; 
//import processing.opengl.*;

GSMovie[] movies = new GSMovie[5];

GSMovie alwaysSunny;

//GSMovie bg_movie = new GSMovie;

//SoftFullScreen fs; 

int w = 640;
int h = 480;
int threshold = 80;

boolean find = true;


void setup() {

  size(960, 540, P2D); ///checken zonder p2d


 // fs = new SoftFullScreen(this, 1); 

  // enter fullscreen mode
  //fs.enter();



  alwaysSunny = new GSMovie(this, "alwaysSunny.mov");
  
  movies[0] = new GSMovie(this, "dareDevil.mov");
  movies[1] = new GSMovie(this, "ferrisBueller.mov");
  movies[2] = new GSMovie(this, "naruto.mov");
  movies[3] = new GSMovie(this, "pumpingIron.mov");
  movies[4] = new GSMovie(this, "kitchenNightmares.mov");


println(movies[0].width+" "+movies[0].height);

  alwaysSunny.loop();

  movies[0].play();
  movies[1].play();
  movies[2].play();
  movies[3].play();
  movies[4].play();
  
   // movies[0].goToBeginning();
    //movies[0].pause();
    //movies[1].goToBeginning();
    //movies[2].goToBeginning();
    //movies[3].goToBeginning();
   // movies[4].goToBeginning();
 
  
  
}

void movieEvent(GSMovie movies) {
  movies.read();
}
