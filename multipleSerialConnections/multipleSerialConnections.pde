import processing.serial.*; //library for serial communication
Serial firstArduinoPort; //creates object "firstArduinoPort" of serial class
Serial secondArduinoPort;   //creates object "secondArduinoPort" of serial class
//==================================================================
void setup()
{
  println(Serial.list()); //prints a list of open ports use this to doublecheck which port is which
  //also make sure to assign correct boud rate

  //initialize serials 
  firstArduinoPort = new Serial(this, Serial.list()[0], 38400); //port 4
  firstArduinoPort.bufferUntil(' ');
  secondArduinoPort = new Serial(this, Serial.list()[1], 9600); //port 6
  secondArduinoPort.bufferUntil(' ');
}
//==================================================================
void draw()
{
  firstArduinoPort.write("this string will be sent to your first arduino");
  secondArduinoPort.write("this string will be sent to your second arduino");
}



// this function is called whenever serial information is recieved
void serialEvent(Serial myPort) {
  //println("serial event detected");
  if (myPort == firstArduinoPort) {
    

    //--------------code for recieving and parcing serial information from Arduino1 goes here------------------//
    /// check processing tutorial on serial communication (serial call/response) example
    String myString = firstArduinoPort.readStringUntil(' '); //reads string until space -- follow example
}
else if (myPort == secondArduinoPort) {


    //--------------code for recieving and parcing serial information from Arduino1 goes here------------------//
    /// check processing tutorial on serial communication (serial call/response) example
    String myString = secondArduinoPort.readStringUntil(' ');
    }
  }