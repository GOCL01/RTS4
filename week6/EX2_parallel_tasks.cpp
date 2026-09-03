#include <FreeRTOS_SAMD21.h>

// Handles for our tasks
TaskHandle_t LEDTaskHandle = NULL;
TaskHandle_t PrintTaskHandle = NULL;


// --------------------------------------------------
// TASK 1: Blink LED
// --------------------------------------------------

static void LED_Task(void *pvParameters)
{
  pinMode(LED_BUILTIN, OUTPUT);

  while (true)
  {
    digitalWrite(LED_BUILTIN, HIGH);

    // Give CPU to other tasks for 500 ms
    vTaskDelay(500 / portTICK_PERIOD_MS);

    digitalWrite(LED_BUILTIN, LOW);

    // Give CPU to other tasks for 500 ms
    vTaskDelay(500 / portTICK_PERIOD_MS);
  }
}


// --------------------------------------------------
// TASK 2: Print messages
// --------------------------------------------------

static void Print_Task(void *pvParameters)
{
  int counter = 0;

  while (true)
  {
    counter++;

    Serial.print("Print task running: ");
    Serial.println(counter);

    // Wait 1 second, allowing other tasks to run
    vTaskDelay(1000 / portTICK_PERIOD_MS);
  }
}


// --------------------------------------------------
// SETUP
// --------------------------------------------------

void setup()
{
  Serial.begin(9600);

  while (!Serial);

  // Create LED task
  xTaskCreate(
    LED_Task,
    "LED TASK",
    256,
    NULL,
    tskIDLE_PRIORITY + 1,
    &LEDTaskHandle
  );

  // Create Print task
  xTaskCreate(
    Print_Task,
    "PRINT TASK",
    256,
    NULL,
    tskIDLE_PRIORITY + 1,
    &PrintTaskHandle
  );

  // Start FreeRTOS
  vTaskStartScheduler();
}


// --------------------------------------------------
// LOOP
// --------------------------------------------------

void loop()
{
  // FreeRTOS is controlling the tasks.
}
