//SevenSegment display;
Clock display;

void setup()
{
  color display_color = color(200, 0, 0);
  display = new Clock(200, 200, display_color, 100, 20, 3);
  size(1600, 600, P3D);
}

void draw()
{
  display.updateTime();
  display.show();
}
