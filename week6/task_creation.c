//**************************************************************************
// FreeRtos on Samd21
// 
//
// Project is a simple example of how to get FreeRtos running on a SamD21 processor
// Project can be used as a template to build your projects off of as well
//
//**************************************************************************

#include <FreeRTOS_SAMD21.h>
// Select the serial port the project should use and communicate over
// Some boards use SerialUSB, some use Serial
//#define SERIAL          SerialUSB //Sparkfun Samd21 Boards



const char *pcTextForTask1 = " Task 1 ";
const char *pcTextForTask2 = " Task 2 ";
const char *pcTextForTask3 = " Task 3 ";

void vTaskFunction1( void *pvParameters )
{
char *pcTaskName;
const TickType_t xDelay500ms = pdMS_TO_TICKS( 500 );

pcTaskName = ( char * ) pvParameters;
/* As per most tasks, this task is implemented in an infinite loop. */
for( ;; )
{
    /* Print out the name of this task. */
    Serial.println( pcTaskName );
    /* Delay for a period. This time a call to vTaskDelay() is used which places
    the task into the Blocked state until the delay period has expired. The
    parameter takes a time specified in ‘ticks’, and the pdMS_TO_TICKS() macro
    is used (where the xDelay250ms constant is declared) to convert 500
    milliseconds into an equivalent time in ticks. */
    vTaskDelay( xDelay500ms );
  }
}


void vTaskFunction2( void *pvParameters )
{
char *pcTaskName;
const TickType_t xDelay500ms = pdMS_TO_TICKS( 500 );


pcTaskName = ( char * ) pvParameters;
/* As per most tasks, this task is implemented in an infinite loop. */
for( ;; )
{
    /* Print out the name of this task. */
    Serial.println( pcTaskName );
    /* Delay for a period. This time a call to vTaskDelay() is used which places
    the task into the Blocked state until the delay period has expired. The
    parameter takes a time specified in ‘ticks’, and the pdMS_TO_TICKS() macro
    is used (where the xDelay250ms constant is declared) to convert 250
    milliseconds into an equivalent time in ticks. */
    vTaskDelay( xDelay500ms );
  }
}


void vTaskFunction3( void *pvParameters )
{
char *pcTaskName;
const TickType_t xDelay1000ms = pdMS_TO_TICKS( 1000 );


pcTaskName = ( char * ) pvParameters;
/* As per most tasks, this task is implemented in an infinite loop. */
for( ;; )
{
    /* Print out the name of this task. */
    Serial.println( pcTaskName );
    /* Delay for a period. This time a call to vTaskDelay() is used which places
    the task into the Blocked state until the delay period has expired. The
    parameter takes a time specified in ‘ticks’, and the pdMS_TO_TICKS() macro
    is used (where the xDelay250ms constant is declared) to convert 250
    milliseconds into an equivalent time in ticks. */
    vTaskDelay( xDelay1000ms );
  }
}



void setup() 
{
  Serial.begin(9600);
  delay(1000); // prevents usb driver crash on startup, do not omit this
  while (!Serial) ;  // Wait for serial terminal to open port before starting program
  Serial.println("");
  Serial.println("******************************");
  Serial.println("        Program start         ");
  Serial.println("******************************");

  /* Create the other task in exactly the same way.  Note this time that we
  are creating the SAME task, but passing in a different parameter.  We are
  creating two instances of a single task implementation. */
  xTaskCreate( vTaskFunction1, "Task 1", 240, (void*)pcTextForTask1, 1, NULL );
  xTaskCreate( vTaskFunction2, "Task 2", 240, (void*)pcTextForTask2, 2, NULL );
  xTaskCreate( vTaskFunction3, "Task 3", 240, (void*)pcTextForTask3, 3, NULL );

  /* Start the scheduler to start the tasks executing. */
  vTaskStartScheduler();  

  /* The following line should never be reached because vTaskStartScheduler() 
  will only return if there was not enough FreeRTOS heap memory available to
  create the Idle and (if configured) Timer tasks.  Heap management, and
  techniques for trapping heap exhaustion, are described in the book text. */

    // error scheduler failed to start
  while(1)
  {
    Serial.println("Scheduler Failed! \n");
    delay(1000);
  }

}

//*****************************************************************
// This is now the rtos idle loop
// No rtos blocking functions allowed!
//*****************************************************************
void loop() 
{
    // Optional commands, can comment/uncomment below
    //SERIAL.println(" IDLE "); //print out dots in terminal, we only do this when the RTOS is in the idle state
    //delay(50); //delay is interrupt friendly, unlike vNopDelayMS
}


//*****************************************************************
