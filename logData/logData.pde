//This is an example of how to write data to a file.
//You can find your file in a folder called "data" in the directory that the sketch is stored
//Code by Paul Strohmeier (paul.strohmeier@gmail.com) 
//For the Interactive User Interfaces course at University of Copenhagen

import java.io.BufferedWriter; //log lines
import java.io.FileWriter; //create files

String dataToBeLogged = "This is an example of how to write data to a file"; // string that we will write to file
int counter = 0; //will be incremented with each writing
boolean toggle = false; //boolean to prevent writing multiple lines to the file 

void setup() { //setup function is executed once when the file starts
  size(400, 300); // sets the size of the window
}

void draw() { //draw is executed continuously
  background(120, 30, 50);
  text("Hit the 'w' to write text to file", width/2, height/2);

  if (keyPressed) { // if a key is pressed
    if (key == 'w' && toggle == false) { //write data to file, but only once 
      toggle = true; //setting toggle to true prevents writing multiple lines
      appendTextToFile("testFile", "Id" + counter + "\t ");
      appendTextToFile("testFile", dataToBeLogged);    
      appendTextToFile("testFile", "\n" + "\r"); 
      counter++;
      println("We wrote data with the ID: " + counter + " to the file");
    }
  } else {    
    toggle = false;
  }
}