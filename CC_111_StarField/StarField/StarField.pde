int starsNumber = 500;
float speed = 0;
Star[] StarsField = new Star[starsNumber];

void setup()
{
  fullScreen(P3D);
  for(int i=0; i<starsNumber; ++i)
  {
    StarsField[i] = new Star();
  }
}

void draw()
{
  speed = map(mouseX, 0, width, 0, 30);
  
  translate(width/2, height/2);
  background(1);
  
  for(int i=0; i<starsNumber; ++i)
  {
    StarsField[i].update();
    StarsField[i].show();
  }
}
