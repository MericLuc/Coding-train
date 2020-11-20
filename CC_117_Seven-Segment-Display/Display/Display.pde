SevenSegment display;

void setup()
{
  color display_color = color(200, 0, 0);
  display = new SevenSegment(display_color, 100, 20, 3);
  size(600, 600, P3D);
}

void draw()
{
  translate(width/2.5, height/3);
  display.digit(display.nextDigit());
  display.show();
  delay(500);
}
