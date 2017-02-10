int numFrames;


void setup() {
  size(1024,1024);
  smooth();
  noStroke();
  rectMode(CORNERS);
  colorMode(HSB,360,100,100,255);
  initme();
  numFrames = (int)random(20,200);

}

float ang;
float ang2;
float ss;

void initme() {
  ang=0;
  ang2=0;
  ss = random(2,5);
  makeColors();
}

void draw() {

  if(frameCount == numFrames){
    saveFrame("output.png");
    exit();
  }

  background(0,0,100);
 
  translate(width/2, height/2);
  for(int iter=0;iter<250;iter++) {
    pushMatrix();
    // rotate 360 degrees and
    rotate(ang+ang2/2.0);
    for(int i=0;i<5;i++) {
      fill(c[i],10+i*15);
      // draw vertical rectangle with start and end point based on noise
      rect(0,-(i+1)*10-30*noise(ang2+cos(-ang+i)*2),8,-100-(20+(12-i)*40)*noise(sin(ang+i)*ss+i/2,ang2));
    }
    popMatrix();    
    ang+=TWO_PI/250.0;
  }
 
  ang2+=TWO_PI/300;
  ang=0.0;
}

void mouseClicked() {
  noiseSeed((int)random(0,100000));
  initme();
}

// palette generation
color[] c = new color[5];
void makeColors() {
  int h = (int)random(360);
  int s = (int)random(50,70);
  int b = (int)random(70,90);
  c[0] = color(h,s,b);
  c[1] = color( (h+360-(25+random(-5,5)))%360,s,b);
  c[2] = color( (h+25+random(-5,5))%360,s,b);
  c[4] = color(h,s*0.6,b*0.6);
  c[3] = color( ((int)(h+180+random(-5,5)))%360,s,b*0.9);
}