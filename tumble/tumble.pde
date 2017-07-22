//for the interface, tumble&pan
float mouseXdelta;
float mouseYdelta;
float scale;
float oldScale;
float rotationX;
float rotationY;
float translateX;
float translateY;
float oldRotationX;
float oldRotationY;
float oldTranslateX;
float oldTranslateY;
boolean ready = false;

void tumbleAndPan() {
  //re-adjusts visualization

    translate(width/2-translateX, height/2-translateY);
  scale(1 + (scale/100));
  rotateX(degrees((rotationX/100)+00.0));
  rotateY(degrees((rotationY/100)+0.0));
  //if mouse is clicked, updates the values
  //(this could be cleaned up)
  if (mousePressed) {
    if (ready == true);
    {
      if (mouseButton == LEFT) {
        rotationY = oldRotationY + (mouseXdelta-mouseX)/100;
        rotationX = oldRotationX + (mouseYdelta-mouseY)/100;
      } else if (mouseButton == RIGHT) {
        translateX = oldTranslateX + mouseXdelta-mouseX; 
        translateY = oldTranslateY + mouseYdelta-mouseY;
      } else if (mouseButton == CENTER ) {
        scale = oldScale + mouseYdelta-mouseY;
      }
    }
  } else {
    ready = false;
  }
}



// functions for dynamic visualization:
void mousePressed() {
  mouseXdelta=mouseX;
  mouseYdelta=mouseY;
  oldRotationX = rotationX;
  oldRotationY = rotationY;
  oldTranslateX = translateX;
  oldTranslateY = translateY;
  oldScale = scale;
  //println( oldRotationX);
  //println(oldTranslateX);
  ready = true;
}