ArrayList Kreise;

int radius;
int numFrames;


void setup() {
  // random number between 10 and 100
  numFrames = (int)random(10, 100);
  size(1680, 1050);
  background(20);
  fill(95);
  noStroke();
  randomSeed(100);
  generateKreise();
  frameRate(15);
  smooth();
}

void draw() {
  Animation();
  if(frameCount == numFrames){
    saveFrame("output.png");
    exit();
  }
} 

void Animation() {
  background(20);
  for (int i = Kreise.size()-1; i > 0; i--) { 
    SplitKreis k = (SplitKreis) Kreise.get(i);
    k.display();

    float prob = 0.01;
    float r = random(1);
    if (r < prob) {
      k.splitCircle(k);
      Kreise.remove(i);
    }   

    if (tooSmall(k)) {
      Kreise.remove(i);
    }

    if (Kreise.size() < 2) {
      generateKreise();
    }
  }
}


boolean tooSmall(SplitKreis k) {
  if (k.radius <= 5) {
    return true;
  } 
  else {
    return false;
  }
}

void generateKreise() {
  Kreise = new ArrayList();
  Kreise.add( new SplitKreis(radius, radius, radius) );

  radius = width/8;

  for (float i = 1; i <= width/radius - 1; i++) {
    for (float j = 1; j <= height/radius - 1; j++) {
      Kreise.add( new SplitKreis(i*radius, j*radius, radius) );
    }
  }
}

class Kreis {
  
  float xpos, _xpos;
  float ypos, _ypos;
  float radius, _radius;
  int mx,my;
  int kx,ky;

  Kreis(float _xpos, float _ypos, float _radius) {
    xpos = _xpos;
    ypos = _ypos;
    radius = _radius;
    ellipseMode(CENTER);
  }

  void display() {
    fill(95);
    ellipse(xpos,ypos,radius,radius);
  }
  
}

class SplitKreis extends Kreis {

  boolean rollOver;

  SplitKreis(float xpos, float ypos, float radius) {
    super(xpos, ypos, radius);
  }

  boolean rollOver(int mx, int my) {
    if (dist(mx, my, xpos, ypos) < radius/2) {
      cursor(HAND);
      return true;
    } 
    else {
      return false;
    }
  }

  void splitCircle(Kreis k) {
    Kreise.add( new SplitKreis(xpos-k.radius/4, ypos-k.radius/4, k.radius/2) );
    Kreise.add( new SplitKreis(xpos+k.radius/4, ypos+k.radius/4, k.radius/2) );
    Kreise.add( new SplitKreis(xpos+k.radius/4, ypos-k.radius/4, k.radius/2) );
    Kreise.add( new SplitKreis(xpos-k.radius/4, ypos+k.radius/4, k.radius/2) );
  }
}