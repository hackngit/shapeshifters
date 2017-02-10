int numFrames;
 
int x1 = 412; //x-coordinate for ellipse 1
int x2 = 512; // x-coordinate for ellipse 2
int x3 = 612; // x-coordinate for ellipse 3
 
int y1 = 400; //x-coordinate for ellipse 1
int y2 = 400; //x-coordinate for ellipse 2
int y3 = 400; //x-coordinate for ellipse 3
 
int xSpeed1 = 1; //speed variable for ellipse 1
int xSpeed2 = 2; //speed variable for ellipse 2
int xSpeed3 = 3; //speed variable for ellipse 3
 
int ySpeed1 = 3; //speed variable for ellipse 1 
int ySpeed2 = 2; //speed variable for ellipse 2
int ySpeed3 = 1; //speed variable for ellipse 3
 
void setup(){
  size (1024,768);
  background(0);
  smooth();
  numFrames = (int)random(50, 800);
 
}
 
void draw(){
  //background (0);
  // strokeWeight(4);
  noStroke ();
 
  fill(66,93,100); 
  ellipse(x1,y1,50,50);
 
  fill(293,90,100);
  ellipse(x2,y2,50,50);
 
  fill(182,89,100);
  ellipse(x3,y3,50,50);
 
 
  x1 = x1 + xSpeed1;
  x2 = x2 + xSpeed2;
  x3 = x3 + xSpeed3;
 
  y1 = y1 + ySpeed1;
  y2 = y2 + ySpeed2;
  y3 = y3 + ySpeed3; 
 
  if ((x1>= width - 25) || (x1 <= 25)){
    xSpeed1 = xSpeed1 * -1;
  }
 
  if ((x2>= width - 25) || (x2 <= 25)){
    xSpeed2 = xSpeed2 * -1;
  }
    if ((x3>= width - 25) || (x3 <= 25)){
    xSpeed3 = xSpeed3 * -1;
    } 
      if ((y1>= width - 25) || (y1 <= 25)){
    ySpeed1 = ySpeed1 * -1;
  }
   if ((y2>= width - 25) || (y2 <= 25)){
    ySpeed2 = ySpeed2 * -1;
  }
  if ((y3>= width - 25) || (y3 <= 25)){
    ySpeed3 = ySpeed3 * -1;
  }
 
  if(frameCount == numFrames){
  saveFrame("output.png");
  exit();
  }
}