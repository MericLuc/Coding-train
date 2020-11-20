/*!
 * Classe définissant une Box et
 * la méthode permettant de générer les Box
 * résultant de l'itération de Menger.
 */
 
 class Box
 {
   PVector pos;
   float r;
   
   Box(float x, float y, float z, float r)
   {
     pos = new PVector(x, y, z);
     this.r = r;
   }
   
   /*!
    * Retourne la liste des cubes
    * de l'itération de Menger suivante.
    */
   ArrayList<Box> generate()
   {
     // Génération des boxes résultantes
     ArrayList<Box> Boxes = new ArrayList<Box>();
     
     // Longeur du côté d'une nouvelle boite
     float newR = r/3;
     
     // Itération sur x
     for (int i = -1; i < 2; ++i)
     {
       // Itération sur y
       for (int j = -1; j < 2; ++j)
       {
         // Itération sur z
          for (int k = -1; k < 2; ++k)
          {
            int sum = abs(i) + abs(j) + abs(k);
            // Il faut retirer les cubes du milieu
            // i.e. Les faces dont 2 coordonnées sont nulles
            // sum > 1 => Fractale classique
            // sum <= 1 => Partie retirée de la fractale uniquement
            if(sum > 1)
            {
              Box b = new Box(pos.x + i*newR, pos.y + j*newR, pos.z + k*newR, newR);
              Boxes.add(b);
            }
          }
       }
     }
     
     return Boxes;
   }
   
   // Affiche le cube \a Box actuel
   void show()
   {
      pushMatrix();
      translate(pos.x, pos.y, pos.z);
      noStroke();
      fill(255);
      box(r);
      popMatrix();
   }
 }
