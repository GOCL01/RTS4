// SUPERLOOP EXAMPLE
// No FreeRTOS required
// This is the setup you have been working so far, the superloop runs all the instructions sequentially

void setup()
{
  Serial.begin(9600);

  pinMode(LED_BUILTIN, OUTPUT);
}

void loop()
{
  // Task 1: Blink LED
  digitalWrite(LED_BUILTIN, HIGH);
  delay(2500);

  digitalWrite(LED_BUILTIN, LOW);
  delay(2500);

  // Task 2: Print a message
  Serial.println("Hello from Arduino!");

  // Task 3: Do some other work
  Serial.println("Doing some calculation...");

  int result = 0;

  for (int i = 0; i < 1000; i++)
  {
    result += i;
  }

  Serial.print("Result = ");
  Serial.println(result);
}
