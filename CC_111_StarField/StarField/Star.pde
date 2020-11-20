class Star
{
  // Coordonnées de l'étoile
  float x;
  float y;
  float z;
  
  // Coordonnées mise à jour pour effet mouvement
  float size_x;
  float size_y;
  
  // Taille de l'étoile (f(z))
  float size;
  
  // Coordonnées pour tracer les trainées des étoiles
  // Coordonnées précédentes de l'étoile.
  float p_x;
  float p_y;
  float p_z;

  Star()
  {
    this.x = random(-width/2, width/2);
    this.y = random(-height/2, height/2);
    this.z = random(0, width);
    
    this.size_x = map(x/z, 0, 1, 0, width/2);
    this.size_y = map(y/z, 0, 1, 0, height/2);
    
    this.size = map(z, 0, width/2, 8, 0);
    
    this.p_x = this.x;
    this.p_y = this.y;
    this.p_z = this.z;
  }
  
  void update()
  {
    // Mise à jour de la profondeur (distance)
    z = z - speed;
    
    if(z > 1)
    {
      // Mise à jour de la taille de l'étoile
      size = map(z, 0, width/2, 8, 0);
      
      // Mise à jour anciennces coordonnées de l'étoile
      p_x = size_x;
      p_y = size_y;
      
      // Mise à jour des coordonnées de l'étoile
      size_x = map(x/z, 0, 1, 0, width/2);
      size_y = map(y/z, 0, 1, 0, height/2);
     
      // Récupération nouvelle coordonnée
      p_z = z;
    }
    else
    {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      
      size_x = map(x/z, 0, 1, 0, width/2);
      size_y = map(y/z, 0, 1, 0, height/2);
      
      p_z = z;
      
      p_x = size_x;
      p_y = size_y;

      size = map(z, 0, width/2, 8, 0);
    }
  }
  
  void show()
  {
    fill(255);
    
    stroke(255);
    line(p_x, p_y, size_x, size_y);
    
    noStroke(); 
    ellipse(size_x, 
            size_y, 
            size, 
            size);
  }
}
