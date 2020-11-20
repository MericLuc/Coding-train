Grid grid;

void setup()
{
  grid = new Grid(1500, 1500, 50, 50);
  grid.generate();
  size(1000, 1000, P3D);
}

void draw()
{
  translate(width/2-200, height/2);
  rotateX(PI/3);
  translate(-width/2, -height/2);
  grid.generate();
  grid.show();
}
