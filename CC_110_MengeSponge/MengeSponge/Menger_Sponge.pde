/*!
 * \a File
 * Ce fichier implémente la construction
 * de la fractale "Eponge de Menger".
 *
 * Lien Wikipédia: https://fr.wikipedia.org/wiki/%C3%89ponge_de_Menger
 * Author: LHM
 */

// Permet le mouvement de la figure
float angle = 0;
float translateX = 0;
float translateY = 0;

float scaleFactor = 1;

// La fractale de Menger est en fait un tableau
// de cubes.
ArrayList<Box> Sponge;

// Méthode d'initialisation des variables
void setup()
{
  fullScreen(P3D);
  Sponge = new ArrayList<Box>();
  
  // On commence avec une seule Box
  Box b = new Box(0, 0, 0, width/3);
  
  Sponge.add(b);
}

// Méthode appelée au clic de la souris
void mousePressed()
{
  // Limitation pour ne pas défoncer le processeur
  if(Sponge.size() < 1000)
  {
    // On génère les nouvelles boites
    ArrayList<Box> next = new ArrayList<Box>();
    
    // On applique le processur d'itération à
    // chacune des boites actuelles pour avoir
    // l'itération globale suivante.
    for(Box b: Sponge)
    {
      ArrayList<Box> newBoxes = b.generate();
      next.addAll(newBoxes);
    }
    
    Sponge = next;
  }
}

void mouseWheel(MouseEvent e)
{
  scaleFactor += e.getAmount() / 100;
 
  translateX -= e.getAmount() * mouseX / 100;
 
  translateY -= e.getAmount() * mouseY / 100;
}

// Méthode de rendu d'image
// Appelée à chaque nouvelle image.
void draw()
{
  background(51);
  stroke(255);
  noFill();
  lights();
  translate(width/2, height/2);
  
  translate(translateX, translateY);
 
  scale(scaleFactor);
  
  // Application d'une rotation quelconque
  // Pour meilleure visualisation
  rotateX(angle);
  rotateY(angle * 0.4);
  rotateZ(angle * 0.1);
  
  // Dessin de chaque nouvelle box
  for(Box b: Sponge)
  {
    b.show();
  }
  
  angle += 0.01;
}
