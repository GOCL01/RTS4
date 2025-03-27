#include <FreeRTOS_SAMD21.h>
#include <semphr.h>  // add the FreeRTOS functions for Semaphores (or Flags).
#include <Arduino_LSM6DS3.h>

#define WAIT_TIME_IN_MS   100
#define TILT_THRESHOLD      0.01
#define BAUD_RATE       19200

// Declare handles to tasks to read IMU and to control the axis X, Y, and Z
TaskHandle_t gHandle_IMU_ReadTask;
TaskHandle_t gHandle_CtrlXTask;
TaskHandle_t gHandle_CtrlYTask;
TaskHandle_t gHandle_CtrlZTask;

// Declare handles to binary semaphores which we will use to manage to synchronize tasks
// such that the controller tasks for X, Y, and Z axis run only after the IMU data are
// were read completely.
SemaphoreHandle_t gIMUDataSemaphoreHandleXTask;
SemaphoreHandle_t gIMUDataSemaphoreHandleYTask;
SemaphoreHandle_t gIMUDataSemaphoreHandleZTask;

struct strIMU_reading
{
  float x;
  float y;
  float z;
};

struct strIMU_reading currentIMU_sample;

static void giveSemaphore(SemaphoreHandle_t semaphoreHandle);
static void takeSemaphore(SemaphoreHandle_t semaphoreHandle);
static void taskReadIMU( void *pvParameters );
static void taskCTRL_X( void *pvParameters );
static void taskCTRL_Y( void *pvParameters );
static void taskCTRL_Z( void *pvParameters );


void setup()
{
  Serial.begin(BAUD_RATE);
  while (!Serial);
  Serial.println("Started");

  if (!IMU.begin())
  {
    Serial.println("Failed to initialize IMU!");
    while (true);
  }

  Serial.print("Accelerometer sample rate = ");
  Serial.print(IMU.accelerationSampleRate());
  Serial.println("Hz");

  gIMUDataSemaphoreHandleXTask = xSemaphoreCreateBinary();
  gIMUDataSemaphoreHandleYTask = xSemaphoreCreateBinary();
  gIMUDataSemaphoreHandleZTask = xSemaphoreCreateBinary();

xTaskCreate( taskReadIMU, 
             "Task A", 
             256, 
             NULL, 
             tskIDLE_PRIORITY + 1, 
             &gHandle_IMU_ReadTask);

xTaskCreate( taskCTRL_X,  
             "Task B", 
             256, 
             NULL, 
             tskIDLE_PRIORITY + 4, 
             &gHandle_CtrlXTask);

xTaskCreate(  taskCTRL_Y,  
              "Task C", 
              256, 
              NULL, 
              tskIDLE_PRIORITY + 4, 
              &gHandle_CtrlYTask);

xTaskCreate(  taskCTRL_Z,  
              "Task D", 
              256, 
              NULL, 
              tskIDLE_PRIORITY + 4, 
              &gHandle_CtrlZTask);

  // Start the RTOS, this function will never return and will schedule the tasks.
  vTaskStartScheduler();

  // error scheduler failed to start
  while (true)
  {
    Serial.println("Scheduler Failed! \n");
    while (true);
  }

}


void loop()
{
  delay(200);
  Serial.println("IDLE TASK");
}

static void giveSemaphore(SemaphoreHandle_t semaphoreHandle)
{
  if (semaphoreHandle != NULL)
  {
    xSemaphoreGive(semaphoreHandle);
  }
  else
  {
    Serial.println("GIVE SEMAPHORE FAILURE: NULL POINTER");
    while(true);
  }
}


static void takeSemaphore(SemaphoreHandle_t semaphoreHandle)
{
  if (semaphoreHandle != NULL)
  {
    xSemaphoreTake(semaphoreHandle, portMAX_DELAY);
  }
  else
  {
    Serial.println("TAKE SEMAPHORE FAILURE: NULL POINTER");
    while(true);
  }
}

static void taskReadIMU( void *pvParameters )
{
  Serial.println("Read IMU: Started");

  float x, y, z;
  char strBuffer[64] = {0};

  while (true)
  {
    if (IMU.accelerationAvailable())
    {
      Serial.println("TASK: Read IMU");
      IMU.readAcceleration(x, y, z);

      currentIMU_sample.x = x;
      currentIMU_sample.y = y;
      currentIMU_sample.z = z;
      
      sprintf(strBuffer, 
              "x: %de-03, y: %de-03, z: %de-03", (int)(x*1000), (int)(y*1000), (int)(z*1000));


      Serial.println(strBuffer);
      Serial.println("TASK IMU: Give semaphore...");
      
      Serial.println("TASK IMU: Give semaphore (CTRL X)...");
      giveSemaphore(gIMUDataSemaphoreHandleXTask);
      
      Serial.println("TASK IMU: Give semaphore (CTRL Y)...");
      giveSemaphore(gIMUDataSemaphoreHandleYTask);

      Serial.println("TASK IMU: Give semaphore (CTRL Z)...");
      giveSemaphore(gIMUDataSemaphoreHandleZTask);
    }
    vTaskDelay( (WAIT_TIME_IN_MS * 1000) / portTICK_PERIOD_US );
  }
}

static void taskCTRL_X( void *pvParameters )
{
  float x;
  int degreesX = 0;

  while (true)
  {
    Serial.println("TASK CTRL X: waiting for semaphore...");
    takeSemaphore(gIMUDataSemaphoreHandleXTask);
    Serial.println("TASK CTRL X: continue execution...");
     x = currentIMU_sample.x;

    if (x > +TILT_THRESHOLD)
    {
      int degreesX = 0;
      x = 100 * x;
      degreesX = map(x, 0, 97, 0, 90);
      Serial.print("TASK CTRL X: Tilting up ");
      Serial.print(degreesX);
      Serial.println("  degrees");
    }
    if (x < -TILT_THRESHOLD)
    {
      x = 100 * x;
      degreesX = map(x, 0, -100, 0, 90);
      Serial.print("TASK CTRL X: Tilting down ");
      Serial.print(degreesX);
      Serial.println("  degrees");
    }
  }
}
  


static void taskCTRL_Y( void *pvParameters )
{
  float y;
  int degreesY = 0;

  while (true)
  {
    Serial.println("TASK CTRL Y: waiting for semaphore...");
    takeSemaphore(gIMUDataSemaphoreHandleYTask);
    Serial.println("TASK CTRL Y: continue execution...");

    y = currentIMU_sample.y;
    
    if (y > +TILT_THRESHOLD)
    {
      y = 100 * y;
      degreesY = map(y, 0, 97, 0, 90);
      Serial.print("TASK CTRL Y: Tilting left ");
      Serial.print(degreesY);
      Serial.println("  degrees");
    }
    if (y < -TILT_THRESHOLD)
    {
      y = 100 * y;
      degreesY = map(y, 0, -100, 0, 90);
      Serial.print("TASK CTRL Y: Tilting right ");
      Serial.print(degreesY);
      Serial.println("  degrees");
    }
  }
}

static void taskCTRL_Z( void *pvParameters )
{
  float z;
  while (true)
  {
    Serial.println("TASK CTRL Z: waiting for semaphore...");
    takeSemaphore(gIMUDataSemaphoreHandleZTask);
    Serial.println("TASK CTRL Z: continue execution...");
    z = currentIMU_sample.z;
    
    if ((z < 0.1) && (z > -0.1))
    {
      Serial.println("TASK CTRL X: Horizontal position is OK ");
    }
  }
}


