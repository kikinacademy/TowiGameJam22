float x = 0;
float y = 0;
PImage good;


void setup(){
  size(1080,600);
  good = loadImage("Cartoon-alien.png");
}

void draw(){
  background(0);
  image(good,0,0,width/3, height/3); // top left
  image(good,720, 400,width/3, height/3); //buttom right
  image(good,360, 0,width/3, height/3); //center top
  image(good,720, 0,width/3, height/3); //top right
  image(good,720, 200,width/3, height/3); //center right
  image(good,360, 400,width/3, height/3); //down mid
  image(good,360,200,width/3, height/3); // center
  image(good,0,200,width/3, height/3); // center left
  
  
  ///// En donde comienza el jugador
  image(good,0,400,width/3, height/3); // down left
  
  
  stroke(255);
  strokeWeight(2);
  
  x = 360;
  while (x < width) {
    line(x,0,x,height);
    x = x + 360;
  }
  
  y = 200;
  while (y < height) {
    line(0,y,width,y);
    y = y + 200;
  }
}
