import ddf.minim.*;

PVector pOne, pTwo;
Button one, two;

Minim minim;
AudioPlayer player_1;
AudioPlayer player_2;

void setup() {
  size(300,300);
  pOne = new PVector(50, 150);
  pTwo = new PVector(150, 150);
  one = new Button (pOne, "one");
  two = new Button (pTwo, "two");
  minim = new Minim(this);
  //sound1
  player_2 = minim.loadFile("light_it_up.mp3");
  //sound2
  player_1 = minim.loadFile("family_business.mp3");
}

void draw() {
  background(220);
  one.display();
  one.update();
  two.display();
  two.update();

  if(one.pressed){
  player_2.pause();
  player_1.rewind();
  player_1.play();
  ellipse(30,30,10,20);
 // two.pressed = false;
  }


  if(two.pressed){
  player_1.pause();
  player_2.rewind();
  player_2.play();
  ellipse(130,30,10,20);
  //one.pressed = false;
  }


}

void mouseReleased(){
  one.pressed = false;
  two.pressed = false;
}

class Button{

  String name;
  PVector pos;
  boolean pressed = false;
  int xsz = 40;
  int ysz = 20;

  Button(PVector _pos, String _name ){
    pos = _pos;
    name = _name;
  }

  void display(){
    color c = isOver()? 255:120;
    fill(c);
    rect(pos.x, pos.y, xsz, ysz);
    fill(0);
    text(name, pos.x+5, pos.y +ysz/2);
  }

  void update(){
    if(isOver() && mousePressed)
    pressed = true;
  }

  boolean isOver(){
    return mouseX > pos.x && mouseX < pos.x + xsz &&
           mouseY > pos.y && mouseY < pos.y + ysz; 
  }

}
