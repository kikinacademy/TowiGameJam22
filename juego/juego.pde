float x = 0;
float y = 0;
PImage img;
PImage img2;
boolean flag = true;
void setup(){
  size(960,540);
  img = loadImage("inicio.png");
  img2 = loadImage("personaje1.png");
}

void draw(){
  background(0);
  start1();
  if(flag==false)
  {
    grid();
  }
}
void start1(){
  if(flag == true)
  {
    image(img,0,0);
    image(img2,250,200,width/2, height/2);
    if (mousePressed && (mouseButton == LEFT)) {
      fill(180);
      flag = false;
    } else {
      fill(126);
    }
    circle(420,230,100);
    fill(0);
    textSize(20);
    stroke(10);
    text("START", 395, 235); 
  }
  
  
}


void grid(){
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
