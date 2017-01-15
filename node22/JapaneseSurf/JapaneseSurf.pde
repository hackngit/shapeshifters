//import processing.pdf.*;
//beginRecord(PDF,"abc.pdf");
float r=30;
float len=70;
float clr=215;
void setup(){
colorMode(HSB,360,100,100,100);
background(360,0,100);
//background(0);
size(640,640);
}

void draw(){

for(float a=0;a<360;a=a+1)
{ 
 
float theta=a*PI/180;
stroke(0);
strokeWeight(0.05);
//noStroke();
//noFill();
// float la=map(a,0,360,0,70);
 // fill(clr,92.3-1.44*la,13.9+1.2*la);
r=r+20*cos(random(20)*a);
float x=width/2+r*cos(theta);
float y=height/2+r*sin(theta);

for(int q = 0; q < len; q+=2){
  fill(clr,155.3-1.44*q,13.9+1.2*q);
  
float angle = 100*noise(cos(radians(len-q)) * q);
//float angle = cos(radians(len-q)) * q;
float x2 = sin(radians(a-angle))*(q*3);
float y2 = cos(radians(a-angle))*(q*3);
ellipse(x+x2, y+y2, len-q, len-q);
}
}
save("output.png");
    exit();
}

//endRecord();


/*ref:https://www.openprocessing.org/sketch/156687*/