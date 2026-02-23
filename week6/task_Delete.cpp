#include <FreeRTOS_SAMD21.h>   // Include FreeRTOS library for SAMD21 boards

// Handle used to reference the created task (thread)
TaskHandle_t HandleThread_1 = NULL;

/*
  Task function (Thread 1)
  This function will run as a separate FreeRTOS task.
  pvParameters can be used to pass parameters to the task (unused here).
*/
static void thread_1(void *pvParameters) 
{
  // Print message 10 times
  for(int idx = 0; idx < 10; idx++)
  {
     Serial.println("THREAD ");  // Send text over serial monitor

     // Delay task execution for 500 milliseconds
     // This allows other tasks to run (non-blocking delay in FreeRTOS)
     vTaskDelay(5 / portTICK_PERIOD_MS);
  }

  // Delete this task once finished
  // NULL means the currently running task deletes itself
  vTaskDelete(NULL);
}

void setup() {
  // Initialize serial communication at 300 baud rate
  Serial.begin(300);

  // Wait until the serial port is ready (needed for some boards)
  while(!Serial);

  /*
    Create a FreeRTOS task
    Parameters:
    1. Task function name
    2. Task name (for debugging)
    3. Stack size (in words, not bytes)
    4. Task parameter (NULL since not used)
    5. Priority (slightly above idle priority)
    6. Task handle reference
  */
  xTaskCreate(thread_1, 
              "PRINT THREAD", 
              756, 
              NULL, 
              tskIDLE_PRIORITY + 1, 
              &HandleThread_1);

  // Start the FreeRTOS scheduler
  // After this call, the RTOS takes control of task execution
  vTaskStartScheduler();


}

void loop() {

  int idx = 0;

  // Infinite loop (Arduino main loop)
  while(true)
  {
    idx++;  // Increment counter

    // Print formatted text to serial monitor
    Serial.print(idx);
    Serial.print(":");
    Serial.print("L");
    Serial.print("O");
    Serial.print("O");
    Serial.print("P");
    Serial.print("-");
    Serial.println("");  // Print newline
  }
}
