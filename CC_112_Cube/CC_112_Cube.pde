float angle = 0;

P3Vector[] points = new P3Vector[8];

void setup() {
  fullScreen(P3D);
  points[0] = new P3Vector(-100, -100, -100);
  points[1] = new P3Vector(100, -100, -100);
  points[2] = new P3Vector(100, 100, -100);
  points[3] = new P3Vector(-100, 100, -100);
  points[4] = new P3Vector(-100, -100, 100);
  points[5] = new P3Vector(100, -100, 100);
  points[6] = new P3Vector(100, 100, 100);
  points[7] = new P3Vector(-100, 100, 100);
}

void draw() 
{
  background(0);
  translate(width/2, height/2);
  rotateX(-PI/2);
  P3Vector[] projected3d = new P3Vector[8];

    float[][] rotationXY = 
    {
      {cos(angle), -sin(angle), 0},
      {sin(angle), cos(angle), 0},
      {0, 0, 1}
    };

  for (int i = 0; i < points.length; i++) 
  {
    P3Vector v = points[i];
    P3Vector rotated = matmul(rotationXY, v, true);

    stroke(255, 200);
    strokeWeight(32);
    noFill();
    
    point(rotated.x, rotated.y, rotated.z);
    
    projected3d[i] = rotated;
  }

  // Connecting
  for (int i = 0; i < 4; i++) 
  {
    connect(i, (i+1) % 4, projected3d );
    connect(i+4, ((i+1) % 4)+4, projected3d);
    connect(i, i+4, projected3d);
  }

  //angle = map(mouseX, 0, width, 0, TWO_PI);
  angle += 0.02;
} 

void connect(int i, int j, P3Vector[] points) {
  P3Vector a = points[i];
  P3Vector b = points[j];
  
  strokeWeight(4);
  stroke(255);
  
  line(a.x, a.y, a.z, b.x, b.y, b.z);
}
