

void setup() {
  // put your setup code here, to run once:

  Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:

  for (int i = 0; i < 500; i++) {

    Serial.print(i);
    Serial.print(", ");
    Serial.print(i / 2);
    Serial.print(", ");
    Serial.print((i%3) + 1);
    Serial.println(", ");
  }
  delay(100);
}


