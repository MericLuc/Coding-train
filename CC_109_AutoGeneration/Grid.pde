class Grid
{
  int w, h, nbPointW, nbPointH;
  int scaleW, scaleH;
  PVector[][] gridMesh;
  float[][] terrain;
  float noise_mover;
  
  Grid(int p_width, int p_height, int p_nb_point_width, int p_nb_point_height)
  { 
    w = abs(p_width);
    h = abs(p_height);
    nbPointW = p_nb_point_width;
    nbPointH = p_nb_point_height;
    gridMesh = new PVector[nbPointW+1][nbPointH+1];
    scaleW = w/nbPointW;
    scaleH = h/nbPointH;
    terrain = new float[nbPointW][nbPointH];
    noise_mover = 0;
  }
  
  void generate()
  {
    noise_mover -= 0.06;
    float i_offset = 0;
    for(int i = 0; i< nbPointW; ++i)
    {
      float j_offset = noise_mover;
      for (int j = 0; j < nbPointH; ++j)
      {
        gridMesh[i][j] = new PVector(i*scaleW, j*scaleH);
        terrain[i][j] = map(noise(i_offset, j_offset), 0, 1, -200, 200);
        j_offset += 0.1;
      }
      i_offset += 0.1;
    }
  }
  
  void show()
  {
    background(0);
    smooth();
    stroke(255);
    noFill();
    for(int j = 0; j< nbPointH-1; ++j)
    {
      for (int i = 0; i < nbPointW -1; ++i)
      {
        beginShape(TRIANGLE_STRIP);
        vertex(gridMesh[i][j].x, gridMesh[i][j].y, terrain[i][j]);
        vertex(gridMesh[i+1][j].x, gridMesh[i][j].y, terrain[i+1][j]);
        vertex(gridMesh[i+1][j].x, gridMesh[i][j+1].y, terrain[i+1][j+1]);
        endShape();
      }
    }
  }
}
