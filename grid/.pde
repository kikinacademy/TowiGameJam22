int cols = 3, rows = 3, x = 1000,y = 1000;

void setup(){
  size(1000,1000);
  smooth();
  background(0);
}

void draw(){
  stroke(125);
  line(x/cols, 0, x/cols, x);
  line(2*x/cols, 0, 2*x/cols, x);

  line(0, x/cols, x, x/cols);
  line(0,2*x/cols, x, 2*x/cols);
  
  
  
}
