import gifAnimation.*;

float xt = 0, yt = 0, x = 0, y = 0;
PImage img, img2, good, stars;
boolean flag = true;
int you = rand_int_num(0,1000), rival, distance = rand_int_num(1,5);
String [] operations = new String [9];
int [] rivals = new int[9];
PFont font;
Gif myAnimation;
Gif myAnimation2;
void setup(){
  size(960,540);
  font = createFont("Arial",16,true);
  img = loadImage("inicio.png");
  img2 = loadImage("personaje1.png");
  good = loadImage("Cartoon-alien.png");
  stars = loadImage("stars.jpg");
  myAnimation = new Gif(this, "malo.gif");
  myAnimation2 = new Gif(this, "pbueno.gif");
  sumas();
}


void draw(){
  background(0);
  myAnimation.play();
  myAnimation2.play();
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
  image(stars,0,0);
  
  xt = 320;
  while (xt < width) {
    line(xt,0,xt,height);
    xt = xt + 320;
  }
  
  yt = 180;
  while (yt < height) {
    line(0,yt,width,yt);
    yt = yt + 180;
  }
  image(myAnimation,0,0,width/3, height/3); // top left
  image(myAnimation,650, 360,width/3, height/3); //buttom right
  image(myAnimation,330, 0,width/3, height/3); //center top
  image(myAnimation,650, 0,width/3, height/3); //top right
  image(myAnimation,650, 180,width/3, height/3); //center right
  image(myAnimation,330, 360,width/3, height/3); //down mid
  image(myAnimation,330,180,width/3, height/3); // center
  image(myAnimation,0,180,width/3, height/3); // center left
  
  fill(255);
  // En donde comienza el jugador
  image( myAnimation2,-50,330,width/2, height/2); // down left
  
  textFont(font,28);
  textAlign(CENTER);
  text(operations[0], 80, 470);
  text(operations[1], 80, 100);
  text(operations[2], 80, 300);
  
  text(operations[3], 400, 100);
  text(operations[4], 400, 300);
  text(operations[5], 400, 470);
  
  text(operations[6], 720, 100);
  text(operations[7], 720, 300);
  text(operations[8], 720, 470);
}

void sumas(){
    rival = you;
    operations[0] = str(you);
    rivals[0] = you;
    println("YOU: "+ you);
    
    for(int i=1; i < 9; i++)
    {
        if(i%2==0)
        {
            operations[i] = cicle1(i);
        }
        else
        {
            operations[i] = cicle2(i);
        }
    }
    
    repeated();
    
    for(int i=1; i < 9; i++)
    {
        println(operations[i]);
        println(rivals[i]);
    }
}


void repeated(){
    for(int i=1; i < 9; i++)
    {
        for(int j=1; j < 9; j++)
        {
            if(operations[i] == operations[j] && i != j)
            {
                if(i%2==0)
                {
                    operations[i] = cicle1(i);
                }
                else
                {
                    operations[i] = cicle2(i);
                }
            }
        }
    }
}


int rand_int_num(int h, int l) {
    int num = int(random(h,l));
    return num;
}

String divide(int value, int i){
    int x=0;
    int y=0;
    while(x + y != value)
    {
        x = rand_int_num(0,1000);
        y = rand_int_num(0,1000);
    }
    rivals[i] = x+y;
    return str(x) + " + " + str(y);
}

String cicle1(int i){
    rival = rand_int_num(you/distance, you-distance);
    return divide(rival, i);
}

String cicle2(int i){
    rival = rand_int_num(you+5*distance, you*distance);
    return divide(rival, i);
}
