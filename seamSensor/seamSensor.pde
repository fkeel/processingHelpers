// This program is set up to work with the 'basics' sketch in the arduino folder
// Code by Paul Strohmeier for the User Interface Technologies class at University of Copenhagen

import processing.serial.*; //include the serial library

int leadCount = 5;
int size = 100;
Serial arduinoPort;  // The serial port at which we listen to data from the Arduino 
String rawIncomingValues; //this is where you dump the content of the serial port
int[] incomingValues = new int[leadCount*leadCount];     //this is where you will store the incoming values, so you can use them in your program
int token = 10; //10 is the linefeed number in ASCII
//You can replace it with whatever symbol marks the end of your line (http://www.ascii-code.com/)
boolean connectionEstablished = false;

int linearValues[] = new int[8];


void setup() {
  size(500, 600); //sets the size of the output window

  //here we specify which port our program should listen to

  // List all the available serial ports
  println("these are the available ports: ");
  printArray(Serial.list());
  //chose your serial port, by putting the correct number in the square brackets 
  //you might need to just trial and error this, the first time you do it
  String serialPort = Serial.list()[0];
  //check if you are using the port you think you are using
  println("You are using this port: " + serialPort);
  // Open the port with the same baud rate you set in your arduino
  arduinoPort = new Serial(this, serialPort, 9600);
}



void draw() {
  background(255);

  if (connectionEstablished) { //the things below only happen if we know we have a working connection

    //this changes the background color around, 
    //based on the second and third value you sent from the arduino
    stroke(255, 0, 0);
    //fill(incomingValues[i*y]*150, 255, 100, 40);

    for ( int i = 0; i < leadCount*leadCount; i++) { //fix number here
      fill(incomingValues[i]); //multiply
      rect(i%leadCount*size, int(i/leadCount)*size, size, size);
    }
    for ( int i = 0; i < 5; i++) {
      fill(255);
      rect(i*size, i*size, size, size);
    }



    linearValues[0] = incomingValues[1]; 
    linearValues[1] = incomingValues[2]; 
    linearValues[2] = (incomingValues[3]+incomingValues[7])/2; 
    linearValues[3] = (incomingValues[4]+incomingValues[8])/2; 
    linearValues[4] = (incomingValues[4]+incomingValues[8])/2;
    linearValues[5] = (incomingValues[9]+incomingValues[13])/2; 
    linearValues[6] = incomingValues[14];
    linearValues[7] = incomingValues[19];



    translate(50, 230);

    float position = centreOfMass(linearValues);
    float circleSize = arrayAverage(linearValues);
    print(size);
    print(" ");
    position = map(position, 4.2, 2.5, 0, 460);
    circleSize = map(circleSize, 240, 60, 2, 160);
    println(position);
    //  translate(0,90);
    for (int i = 0; i<linearValues.length; i++) {
      fill(linearValues[i], 50, 255-linearValues[i]);
      rect(size*i*0.5, 0, size*0.5, size);
    }
    fill(0, 255, 0);
    ellipse(position, size/2, circleSize, circleSize);
  }
}