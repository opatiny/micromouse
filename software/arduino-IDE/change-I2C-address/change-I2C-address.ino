/*
This example shows how to set up and read multiple VL53L1X sensors connected to
the same I2C bus. Each sensor needs to have its XSHUT pin connected to a
different Arduino pin, and you should change sensorCount and the xshutPins array
below to match your setup.

For more information, see ST's application note AN4846 ("Using multiple VL53L0X
in a single design"). The principles described there apply to the VL53L1X as
well.
*/

#include <Wire.h>
#include <VL53L1X.h>

#define ADDRESS 0x35

VL53L1X sensor;

void setup()
{
  Serial.begin(9600);
  while (!Serial) {}

  Wire.begin();

  sensor.setAddress(ADDRESS);
  Serial.print("New address set to 0x");
  Serial.println(sensor.getAddress(), HEX);
  sensor.startContinuous(50);
  Serial.println("Continuous sensing");
}

void loop()
{
  delay(1000);
  Serial.print(sensor.read());
  if (sensor.timeoutOccurred()) { Serial.print(" TIMEOUT"); }
  Serial.print('\t');
  Serial.println();
}