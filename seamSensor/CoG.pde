





/*------------------------------------------------------*/
/* CENTRE OF MASS - Assume all strips readings are weights 
/* placed equidistant on an imaginary plank. 
/* Calculate where they would balence.
/*------------------------------------------------------*/

float centreOfMass(int[] weights) { //takes an array of values, and calculates their centre of mass (see https://www.mathsnetalevel.com/2924)

  //Centre of Mass = weightA * positionA + weightB * positionB + weightC * positionC ... / weightA + weightB + weightC ...

  float weightLocation = 0;
  float weightSum = 0;
  float centreOfMass;

  for (int i = 0; i < weights.length; i++) {

    weightLocation = weightLocation + weights[i]*(i); //sum of all weights multiplied by their position
    weightSum = weightSum + weights[i]; //sum of all weights
  }

  centreOfMass = weightLocation / weightSum;
  // println(centreOfMass);
  return centreOfMass;
}

float arrayAverage(int[] weights) { //takes an array of values, and calculates their centre of mass (see https://www.mathsnetalevel.com/2924)

  //Centre of Mass = weightA * positionA + weightB * positionB + weightC * positionC ... / weightA + weightB + weightC ...

  float weightSum = 0;
  float mean;

  for (int i = 0; i < weights.length; i++) {

    //  weightLocation = weightLocation + weights[i]*(i); //sum of all weights multiplied by their position
    weightSum = weightSum + weights[i]; //sum of all weights
  }

  mean = weightSum / weights.length;
  // println(centreOfMass);
  return mean;
}