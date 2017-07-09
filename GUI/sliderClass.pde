
//a slider is a button that does not toggle, instead it returns a value
public class Slider extends Button {
  float sliderValue;
  int sliderPosition;
  int sliderMin;
  int sliderMax;

  Slider(String nameShortcut, int x, int y, int w, int h ) { //its built the same way, just we add a min and max value
    super(nameShortcut, x, y, w, h);
    sliderValue = 0;
    sliderMin = 0;
    sliderMax = 0;
    sliderPosition = x+w/2;
  }

  //constructor without position
  Slider(String nameShortcut) {
    super(nameShortcut);
  }

  void assignRange(int min, int max) { //we tell the slider what its range is here
    sliderMin = min;
    sliderMax = max;
    sliderValue = (sliderMin+sliderMax)/2;
  }

  void display() {
    super.display();
    stroke(255);
    rect(sliderPosition-3, buttonY, 6, buttonHeight);
  }

  //alternate constructor, if we want to give it new coordinates
  void display(int x, int y, int w, int h) {
    super.display(x, y, w, h);
    stroke(255);
    rect(buttonX+sliderPosition-3, buttonY, 6, buttonHeight);
  }
  
// not sure what to use the keyboard shortct for. kinda pointless here
  void activateClick() { //instead of toggling, we move the slider
    if (mousePressed && super.hover()) {
      sliderPosition = mouseX - buttonX;
    }
  }


  float getSliderValue() { //here we ask what its value is
    sliderValue = map(sliderPosition, 0, buttonWidth, sliderMin, sliderMax);
    return sliderValue;
  }
}