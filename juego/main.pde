import gifAnimation.*;


float xt = 0, yt = 0, x = 0, y = 0;
PImage fondo, fondo2, good, stars;
boolean flag = true;
int you = rand_int_num(0,1000), rival, distance = rand_int_num(1,5);
String [] operations = new String [9];
int [] rivals = new int[9];
PFont font;
Gif malo, start, bueno;
Character You, R1, R2, R3, R4, R5, R6, R7, R8;


void setup(){
  size(960,540);
  font = createFont("Arial",16,true);
  fondo = loadImage("inicio.png");
  good = loadImage("Cartoon-alien.png");
  stars = loadImage("stars.jpg");
  start = new Gif(this, "pinicio.gif");
  malo = new Gif(this, "malo.gif");
  bueno = new Gif(this, "pbueno.gif");
  sumas();
}


void draw(){
  background(0);
  start.play(); // TODO -- OJO:: QUITAR FONDO
  malo.play();
  bueno.play();
  
  start1();
  if(flag==false)
  {
    grid(); 
  }
  identify_mouse_grid_on_click();


  // CREATE MAIN CHARACTER WITH CLASS
  You = new Character(-50,330,rivals[0],true,bueno);
  // CREATE 8 SECOND CHARACTERS
  R1 = new Character(0,0,rivals[1],true,malo);
  R2 = new Character(650,360,rivals[2],true,malo);
  R3 = new Character(330,0,rivals[3],true,malo);
  R4 = new Character(650,0,rivals[4],true,malo);
  R5 = new Character(650,180,rivals[5],true,malo);
  R6 = new Character(330,360,rivals[6],true,malo);
  R7 = new Character(330,180,rivals[7],true,malo);
  R8 = new Character(0,180,rivals[8],true,malo);
  // DISPLAY NEW CHARACTERS
  You.display();
  R1.display();
  R2.display();
  R3.display();
  R4.display();
  R5.display();
  R6.display();
  R7.display();
  R8.display();
}


void start1(){
  if(flag == true)
  {
    image(fondo,0,0);
    image(start,250,200,width/2, height/2);
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
  // image(malo,0,0,width/3, height/3); // top left
  // image(malo,650, 360,width/3, height/3); //buttom right
  // image(malo,330, 0,width/3, height/3); //center top
  // image(malo,650, 0,width/3, height/3); //top right
  // image(malo,650, 180,width/3, height/3); //center right
  // image(malo,330, 360,width/3, height/3); //down mid
  // image(malo,330,180,width/3, height/3); // center
  // image(malo,0,180,width/3, height/3); // center left
  
  fill(255);
  // En donde comienza el jugador
  // image(bueno,-50,330,width/2, height/2); // down left
  
  textFont(font,28);
  textAlign(CENTER);
  text(operations[1], 80, 170);
  text(operations[2], 80, 350);
  
  text(operations[0], 80, 470);
  
  text(operations[3], 400, 170);
  text(operations[4], 400, 350);
  text(operations[5], 400, 530);
  
  text(operations[6], 720, 170);
  text(operations[7], 720, 350);
  text(operations[8], 720, 530);
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


void identify_mouse_on_grid(){  
  println("X: " + mouseX + " Y: " + mouseY);
  if(mouseX > 0 && mouseX < 320 && mouseY > 0 && mouseY < 180){
    println("Top Left");
  } else if(mouseX > 320 && mouseX < 640 && mouseY > 0 && mouseY < 180){
    println("Top Center");
  } else if(mouseX > 640 && mouseX < 960 && mouseY > 0 && mouseY < 180){
    println("Top Right");
  } else if(mouseX > 0 && mouseX < 320 && mouseY > 180 && mouseY < 360){
    println("Center Left");
  } else if(mouseX > 320 && mouseX < 640 && mouseY > 180 && mouseY < 360){
    println("Center");
  } else if(mouseX > 640 && mouseX < 960 && mouseY > 180 && mouseY < 360){
    println("Center Right");
  } else if(mouseX > 0 && mouseX < 320 && mouseY > 360 && mouseY < 540){
    println("Bottom Left");
  } else if(mouseX > 320 && mouseX < 640 && mouseY > 360 && mouseY < 540){
    println("Bottom Center");
  } else if(mouseX > 640 && mouseX < 960 && mouseY > 360 && mouseY < 540){
    println("Bottom Right");
  }
}


void identify_mouse_grid_on_click(){
  if (mousePressed && (mouseButton == LEFT)) {
    identify_mouse_on_grid();
  }
}


// CREATE A CLASS, CHARACTER THAT CONTAINS CHARACTER POSITION, CHARACTER VALUE, AND STATUS
class Character {
  int x;
  int y;
  int value;
  boolean status;
  Gif image;
  
  Character(int x, int y, int value, boolean status, Gif image) {
    this.x = x;
    this.y = y;
    this.value = value;
    this.status = status;
    this.image = image;
  }
  
  void display() {
    fill(255);
    ellipse(x, y, 20, 20);
  }
  
  void move() {
    if (keyPressed) {
      if (keyCode == UP) {
        y -= 5;
      } else if (keyCode == DOWN) {
        y += 5;
      } else if (keyCode == LEFT) {
        x -= 5;
      } else if (keyCode == RIGHT) {
        x += 5;
      }
    }
  }
}
