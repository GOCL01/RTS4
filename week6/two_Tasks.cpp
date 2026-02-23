#include <FreeRTOS_SAMD21.h>

TaskHandle_t TaskAHandle = NULL;
TaskHandle_t TaskBHandle = NULL;

/*
  Task A (Higher priority - priority 2)
  Prints "High Priority Task" every second.
*/
static void TaskA(void *pvParameters)
{
    while (1)
    {
        Serial.println("High Priority Task");
        vTaskDelay(1000 / portTICK_PERIOD_MS);  // Delay for 1 second
    }
}

/*
  TODO : Task B (Lower priority - priority 1)
  Prints "Low Priority Task" every 3 seconds.
*/


void setup()
{
    Serial.begin(115200);
    while (!Serial);

    // Create Task A (Higher priority - priority 2)
    xTaskCreate(TaskA, "TaskA", 512, NULL, 2, &TaskAHandle);

    // TODO : Create Task B (Lower priority - priority 1)
    

    vTaskStartScheduler();
}

void loop() {}
