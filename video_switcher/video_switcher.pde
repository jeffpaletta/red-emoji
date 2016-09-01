import processing.video.*;

int numMovies = 4;//total number of movies
Movie[] playlist = new Movie[numMovies];//a list of all the movie objects, currently not initialized
int currentMovieIndex = 0;//index of the movie currently playing

float movieEndDuration = 0.029719;//a 'magic number' helpful to find out when a movie finishes playing

void setup(){
  size(800,500);
  for(int i = 0 ; i < numMovies; i++){
    //initialize each movie object in the list
    playlist[i] = new Movie(this,"transit.mov"); new Movie(this, "ch"+(i+1)+".mp4");
  }
  //start playback
  playlist[currentMovieIndex].play();
}

void draw(){
  background(0);
  image(playlist[currentMovieIndex],0,0);
}

void movieEvent(Movie m){
  m.read();
  //handy for debugging and figuring out the 'magic number'
  println(m.time() + " / " + m.duration() + " / " + (m.time() + movieEndDuration));
  //hacky check movie end 
  if((m.time() + movieEndDuration) >= m.duration()){
      println("movie at index " + currentMovieIndex + " finished playback");
      //go to the next movie index
      currentMovieIndex = (currentMovieIndex+1) % numMovies;//increment by one buy use % to loop back to index 0 when the end of the movie array is reached
      //use this to tell the next movie in the list to play
      playlist[currentMovieIndex].play();
      println("movie at index " + currentMovieIndex + " started");
  }
}
