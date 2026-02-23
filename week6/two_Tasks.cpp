#include <FreeRTOS_SAMD21.h>

TaskHandle_t TaskAHandle = NULL;
TaskHandle_t TaskBHandle = NULL;

static void TaskA(void *pvParameters)
{
  int counter = 0;

  while (1)
  {
    counter++;
    Serial.print("Task A running -> ");
    Serial.println(counter);

    if (counter == 5)
    {
      Serial.println("Task A deleting Task B...");
      vTaskDelete(TaskBHandle);   // Delete Task B
    }

    vTaskDelay(1000 / portTICK_PERIOD_MS);
  }
}

// TODO : Create TaskB function here

void setup()
{
  Serial.begin(115200);
  while (!Serial);

  xTaskCreate(TaskA, "TaskA", 512, NULL, 1, &TaskAHandle);
// TODO Create TaskB here

  vTaskStartScheduler();
}

void loop() {}
