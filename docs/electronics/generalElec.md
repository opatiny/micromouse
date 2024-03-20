# General electronics notes

What do we want on our mouse?

- 2x DC motors with encoders
- 1x H bridge dual motor driver
- 2x speed controllers for the motors? -> still to be defined
- 1x MPU with bluetooth and/or wifi for debug
- 1x buzzer for sound signals
- debug LEDS
- 5x distance sensors (ToF?)
- voltage regulator to convert battery voltage to 3.3V for microcontroller and sensors
- battery (9V or 7.4V?)
- Reset button for MCU

## Distance sensors: VL53L1X

The device pins have the following functions:
[!](../datasheets/images/vl53l1x-pin-description.png)

- The `XSHUT` pin has to be pulled up for the device to be active.
- Device default address is 0x29 (41)
- Arduino library: Adafruit VL53L1X
- range: ~30 to 4000 mm -> the smallest distance is not great for our use case...
- timing budget: from 20 to 1000ms. Be careful, if the timing budget is too short, the whole MCU reboots. It basically defines how long a measurement can be.
  "140 ms is the timing budget which allows the maximum distance of 4 m (in the dark on a white chart) to be reached under Long distance mode Increasing the timing budget increases the maximum distance the device can range and improves the repeatability error. However, average power consumption augments accordingly." - https://xod.io/
- We can't change the I2C addresses permanently on the VL53L1X!!! https://community.st.com/t5/mems-sensors/vl53l1x-device-address-storage/td-p/355584
- we'll therefore need an I2C to GPIO module because otherwise we don't have enough pins on our MCU

## Buzzer

We'll need PWM to get different notes with the buzzer.
"All GPIO pins on XIAO ESP32S3 support PWM output. Therefore, you can use any pin to output PWM to adjust the brightness of lights, control servos, and other functions." - https://wiki.seeedstudio.com/xiao_esp32s3_pin_multiplexing/

### Links

- adafruit guide: https://learn.adafruit.com/adafruit-vl53l1x?view=all
- https://github.com/pololu/vl53l1x-arduino?utm_source=platformio&utm_medium=piohome
- timing budget reference: https://xod.io/libs/wayland/vl53l1x-time-of-flight/set-measurement-timing-budget/#:~:text=The%20VL53L1X%20timing%20budget%20can,ms%20up%20to%201000%20ms.&text=20%20ms%20is%20the%20minimum,only%20in%20Short%20distance%20mode.&text=33%20ms%20is%20the%20minimum,work%20for%20all%20distance%20modes.
