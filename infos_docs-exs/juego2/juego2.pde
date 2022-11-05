float xt = 0;
float yt = 0;
PImage img;
PImage img2;
boolean flag = true;
PImage good;
float x = 0;
float y = 0;
int you = rand_int_num(0,1000);
int rival;
int distance = rand_int_num(1,5);
String [] operations = new String [9];

void setup(){
  size(960,540);
  img = loadImage("inicio.png");
  img2 = loadImage("personaje1.png");
  good = loadImage("Cartoon-alien.png");
}

void draw(){
  background(0);
  start1();
  if(flag==false)
  {
    grid();
  }
  sumas();
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
  image(good,0,0,width/3, height/3); // top left
  image(good,650, 360,width/3, height/3); //buttom right
  image(good,330, 0,width/3, height/3); //center top
  image(good,650, 0,width/3, height/3); //top right
  image(good,650, 180,width/3, height/3); //center right
  image(good,330, 360,width/3, height/3); //down mid
  image(good,330,180,width/3, height/3); // center
  image(good,0,180,width/3, height/3); // center left

  // En donde comienza el jugador
  image(good,0,360,width/3, height/3); // down left
}



void sumas(){
    rival = you;
    operations[0] = str(you);
    println("YOU: "+ you);
    
    for(int i=1; i < 9; i++)
    {
        if(i%2==0)
        {
            operations[i] = cicle1();
        }
        else
        {
        operations[i] = cicle2();
        }
    }
    
    repeated();
    
    for(int i=1; i < 9; i++)
    {
        println(operations[i]);
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
                    operations[i] = cicle1();
                }
                else
                {
                    operations[i] = cicle2();
                }
            }
        }
    }
}


int rand_int_num(int h, int l) {
    int num = int(random(h,l));
    return num;
}

String divide(int value){
    int x=0;
    int y=0;
    while(x + y != value)
    {
        x = rand_int_num(0,1000);
        y = rand_int_num(0,1000);
    }
    return str(x) + " + " + str(y);
}

String cicle1(){
    rival = rand_int_num(you/distance, you-distance);
    return divide(rival);
}

String cicle2(){
    rival = rand_int_num(you+5*distance, you*distance);
    return divide(rival);
}
