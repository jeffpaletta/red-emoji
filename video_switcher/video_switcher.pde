import processing.video.*;

int maxmyMovies = 6; // Total # of movies
int  = 1; // Initial movie to be displayed is the first
Movie[] myMovies = new Movie[maxmyMovies]; //array of movies

void setup() {

  size(640,480);



  // Loading the movies into the array
  // Don't forget to put the .mov files in the data folder!
  for (int i = 1; i < myMovies.length; i ++ ) {
    myMovies[i] = new Movie(this, i + ".mov");
    //myMovies.read();
    myMovies[i].loop();
  }
  
  // peliculas ();
}



void draw() {


image(myMovies[1],0,0, 320, 480); 

/*//println ((pan) );
  if (key == 'q') {
    image(myMovies[1],0,0, 400, 400);
  }

  else if (key == 'w') {
    image(myMovies[2],0,0, 400, 400);
  }
  if (key == 'e') {
    image(myMovies[3],0,0, 400, 400);
  }
  
  if (key == 'f'){
   // peliculas ();
  }*/
  
  
}



/*void peliculas (){
// image(myMovies[int(random (myMovies.length))],0,0, 400, 400);
 return myMovies [int(random (myMovies.length))];
}*/
