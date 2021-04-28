
//TODO: needs a 'void setSliderValue(int x)' function
//needs some method of entering a precise value by keyboard
//maybe also constraining it to certain step sizes (using integer instead of float might already fix stuff

//slider value is in percent (float between 0 and 1)
//slider POSITION is pixels (int between sliderMin and sliderMax);

//might need some more options to edit the handle appearence

//a slider is a button that does not toggle, instead it returns a value
public class Slider extends Button {
  float sliderValue;
  int sliderMin;
  int sliderMax;
  int sliderPosition;
  boolean active;
   color handle = color(255,255,255);


  //constructor without position
  Slider(String nameShortcut) {
    super(nameShortcut);
    sliderValue = 0.5;
    sliderMin = 0;
    sliderMax = 1;
    sliderPosition = int(buttonWidth*sliderValue)+buttonX;
    active= false;
  }


<<<<<<< Updated upstream
=======
  // void display() {
  // super.display();
  //  stroke(0,200,0);
  //    rect(sliderPosition-3, buttonY, 6, buttonHeight);
  // }
>>>>>>> Stashed changes

  //create the slider
  void display(int x, int y, int w, int h) {
    buttonX = x;
    buttonY = y;
    buttonWidth = w;
    buttonHeight = h;
    sliderPosition = int(buttonWidth*sliderValue)+buttonX;

    fill(state? boxActive:boxInactive); //color of rectangle
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    stroke(255, 0, 0);
    fill(handle);
    rect(sliderPosition-2, buttonY, 4, buttonHeight);

    if (this.checkMouse) {
      this.activateClick();
    }
    if (this.checkKey) {
      this.activateKey();
    }
     if (displayName) {
      fill(state? textActive:textInactive); //color of name
      text(buttonName, buttonX+nameOffsetX, buttonY+nameOffsetY+buttonHeight);
      // fill(state? highGreen:highRed);  //color of hotkey
    }
  }

<<<<<<< Updated upstream

  void setSliderValue(float target) {
    sliderValue = target;
  }

  // not sure what to use the keyboard shortct for. kinda pointless here
  //I changed it around, so the curser can drift out of the slider
=======
  // not sure what to use the keyboard shortct for. kinda pointless here
>>>>>>> Stashed changes
  void activateClick() { //instead of toggling, we move the slider

    if (!mousePressed && super.hover()) {
      readyForClick = true;
    } else if (!mousePressed) {
      readyForClick = false;
    }

    if (mousePressed &&  readyForClick) {
      active= true;
      if (mouseX>buttonX && mouseX < buttonX+buttonWidth) {
        if ((mouseY<buttonY) || (mouseY> buttonY+buttonHeight)) {
          fill(0);
        } else {
          fill(255);
        }

        sliderPosition = mouseX;
        text(str(this.getSliderValue()), mouseX+10, mouseY + 10); //add the value, so you know what you're doing
      }
      fill(255);


      clicked = true;
    } else {
      active = false;
    }
  }

  boolean sliderActive() {
    return active;
  }
  float getSliderValue() { //here we ask what its value is
    sliderValue = map(sliderPosition, buttonX, buttonX+buttonWidth, sliderMin, sliderMax);
    return sliderValue;
  }
<<<<<<< Updated upstream
  
   void handleFill(int a, int b, int c) {
    handle = color(a, b, c);
  }
  
   void handleFill(int a, int b, int c, int d) {
    handle = color(a, b, c, d);
=======
}



public class DiscreteSlider extends Button {
  int sliderValue;
  int sliderPosition;
  int sliderMin;
  int sliderMax;
  int steps;

  DiscreteSlider(String nameShortcut, int x, int y, int w, int h) { //its built the same way, just we add a min and max value
    super(nameShortcut, x, y, w, h);
    sliderValue = 0;
    sliderMin = 0;
    sliderMax = 1;
    sliderPosition = x+w/2;
    steps = 0;
  }

  //constructor without position
  DiscreteSlider(String nameShortcut) {
    super(nameShortcut);
    sliderMax = 1;
  }

  void assignSteps(int stepnumber) {
    steps = stepnumber;
  }
  void assignRange(int min, int max) { //we tell the slider what its range is here
    sliderMin = min;
    sliderMax = max;
    sliderValue = (sliderMin+sliderMax)/2;
  }

  //  void display() {
  // super.display();
  // stroke(255);
  // int value= this.getSliderValue();
  // println("SLIDER VALUE FROM WITHIN THE DISCRETE SECTION" + value);
  // rect(value*steps-3, buttonY, 6, buttonHeight);
  // }

  //alternate constructor, if we want to give it new coordinates
  void display(int x, int y, int w, int h) {
    super.display(x, y, w, h);
    stroke(255);
    float currentSliderPosition = (this.getSliderValue()/float(steps-1))*buttonWidth;
    rect(buttonX+currentSliderPosition-3, buttonY, 6, buttonHeight);
    strokeWeight(1);
    for (int i = 0; i <steps-1; i = i+1) {
      line(
        (buttonX+(i/7.0)*buttonWidth), 
        buttonY, 
        (buttonX+(i/7.0)*buttonWidth), 
        buttonHeight+buttonY);
    }
  }

  boolean isClicked() {
    if (mousePressed && super.hover()) {
      clicked = true;
      sliderPosition = mouseX - buttonX;
    } else {
      clicked = false;
    }
    return clicked;
  }

  // not sure what to use the keyboard shortct for. kinda pointless here
  void activateClick() { //instead of toggling, we move the slider
    if (mousePressed && super.hover()) {
      clicked = true;
      sliderPosition = mouseX - buttonX;
    } else {
      clicked = false;
    }
  }


  int getSliderValue() { //here we ask what its value is
    float tempValue = map(sliderPosition, 0, buttonWidth, sliderMin, sliderMax);
    sliderValue = int(tempValue*float(steps));
    println("THIS IS THE FREAKING " + sliderPosition + " xx " + buttonWidth + " xx " +  tempValue + " xx " + sliderMax);
    return sliderValue;
>>>>>>> Stashed changes
  }
}