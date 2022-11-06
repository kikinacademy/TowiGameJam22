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
Character [] characters = new Character[9];



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
  You = new Character(0,360,rivals[0],true,bueno); // TODO -- OJO:: HACER MÁS GRANDE Y ACOMODAR
  
  R1 = new Character(0,0,rivals[1],true,malo);
  R2 = new Character(650,360,rivals[2],true,malo);
  R3 = new Character(330,0,rivals[3],true,malo);
  R4 = new Character(650,0,rivals[4],true,malo);
  R5 = new Character(650,180,rivals[5],true,malo);
  R6 = new Character(330,360,rivals[6],true,malo);
  R7 = new Character(330,180,rivals[7],true,malo);
  R8 = new Character(0,180,rivals[8],true,malo);

  characters[0] = You;
  characters[1] = R1;
  characters[2] = R2;
  characters[3] = R3;
  characters[4] = R4;
  characters[5] = R5;
  characters[6] = R6;
  characters[7] = R7;
  characters[8] = R8;

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
  
  // delay(500);  // TODO -- OJO:: EL PERSONJE CENTRAL SE BORRA PQ SE QUEDA ATORADO EL MOUSE EN EL CENTRO

  for (int i = 0; i < 9; i++){
    if (characters[i].status==true){
      characters[i].display();
      characters[i].hide();
    }
  }
  
  fill(255);
  
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


int identify_mouse_on_grid(){  
  println("X: " + mouseX + " Y: " + mouseY);
  if(mouseX > 0 && mouseX < 320 && mouseY > 0 && mouseY < 180){
    println("Top Left");
    return 1;
  } else if(mouseX > 320 && mouseX < 640 && mouseY > 0 && mouseY < 180){
    println("Top Center");
    return 2;
  } else if(mouseX > 640 && mouseX < 960 && mouseY > 0 && mouseY < 180){
    println("Top Right");
    return 3;
  } else if(mouseX > 0 && mouseX < 320 && mouseY > 180 && mouseY < 360){
    println("Center Left");
    return 4;
  } else if(mouseX > 320 && mouseX < 640 && mouseY > 180 && mouseY < 360){
    println("Center");
    return 5;
  } else if(mouseX > 640 && mouseX < 960 && mouseY > 180 && mouseY < 360){
    println("Center Right");
    return 6;
  } else if(mouseX > 0 && mouseX < 320 && mouseY > 360 && mouseY < 540){
    println("Bottom Left");
    return 7;
  } else if(mouseX > 320 && mouseX < 640 && mouseY > 360 && mouseY < 540){
    println("Bottom Center");
    return 8;
  } else if(mouseX > 640 && mouseX < 960 && mouseY > 360 && mouseY < 540){
    println("Bottom Right");
    return 9;
  }
  return 0;
}


int identify_mouse_grid_on_click(){
  if (mousePressed && (mouseButton == LEFT)) {
    return identify_mouse_on_grid();
  }
  return 0;
}


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
    image(this.image, this.x, this.y, width/3, height/3);
  }


  void hide() {
    int c = identify_mouse_grid_on_click();
    switch (c) {
    case 1:
      if (this.x == 0 && this.y == 0) {
        this.status = false;
      }
      break;
    case 2:
      if (this.x == 330 && this.y == 0) {
        this.status = false;
      }
      break;
    case 3:
      if (this.x == 650 && this.y == 0) {
        this.status = false;
      }
      break;
    case 4:
      if (this.x == 0 && this.y == 180) {
        this.status = false;
      }
      break;
    case 5:
      if (this.x == 330 && this.y == 180) {
        this.status = false;
      }
      break;
    case 6:
      if (this.x == 650 && this.y == 180) {
        this.status = false;
      }
      break;
    case 7:
      if (this.x == 0 && this.y == 360) {
        this.status = false;
      }
      break;
    case 8:
      if (this.x == 330 && this.y == 360) {
        this.status = false;
      }
      break;
    case 9:
      if (this.x == 650 && this.y == 360) {
        this.status = false;
      }
      break;

    }
  }
}
