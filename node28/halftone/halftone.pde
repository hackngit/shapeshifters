int sTile = 19;
int[][] m;
color c0, c1;
boolean pause = false;


/*---------------------*/


void setup()
{
  size(855, 570);
  noStroke();
  newColor();
  newPattern();
}


/*---------------------*/


void draw()
{
  if (pause) noLoop();
  
  drawPattern();  
}





void newColor()  //choose a random color
{
  c0 = color(random(255), random(255), random(255));
  c1 = color(random(255), random(255), random(255));
}


/*---------------------*/


void newPattern()  //create a matrix for the truchet tiling
{
  m = new int[width/sTile][height/sTile];
  
  for (int x = 0; x < width; x += sTile)
  {
    for (int y = 0; y < height; y += sTile)
    {
      m[x/sTile][y/sTile] = int(random(2));
    }
  }
}


/*---------------------*/


void drawPattern()
{
  //squares
  for (int x = 0; x < width; x += sTile)
  {
    for (int y = 0; y < height; y += sTile)
    {
      if (m[x/sTile][y/sTile] == 0) fill(c0);
      else fill(c1);
      rect(x, y, sTile, sTile);
    }
  }
  
  
  //circles
  for (int x = 0; x < width + 1; x += sTile)
  {
    for (int y = 0; y < height + 1; y += sTile)
    {    
      int s = 0;
      if ((x+y)%2 ==0)
      {
        fill(c0);
        s = -1;
      }
      else
      {
        fill(c1);
        s = 1;
      }
      float d = map(noise(x/320., y/320., frameCount/100.), 0.33, 0.66, -sTile/2, sTile/2);
      ellipse(x, y, sTile + s*d, sTile + s*d);
    }
    save("output.png");
    exit();
  }
}
