# Common programming errors and possible causes

Errors of the microcontroller

## Core 1 panic'ed

The core panics which causes the device to reboot all of the time. This error is generally related to the multiple threads running in parallel. We identified two main causes:

1. No `vTaskDelay` in the `while` loop: without a delay in the loop the hand can never be given to the other tasks, which causes the device to crash.
2. Insufficient stack size of the task: If the tasks takes more memory than it was allocated it generate a stack overflow which crashes the device.

## A fatal error occurred: Failed to connect to ESP32-S3: No serial data received.

The serial device is not detected.

- check the list of available serial devices with `ls /dev/tty.*`
- check that the cable is both for charging and transfering data!
- check that the correct USB connector is used if they are 2

## Serial monitor prints unknown characters

Probably a problem with the serial speed. Add following lines to `platformio.init` and check the given speeds are correct:

```
monitor_speed = 115200
upload_speed = 921600
```

## E (4478) SPIFFS: mount failed, -10025

Issue on the espressif devkit. Probably because partition was never formatted. Try uploading the contents of the `data` folder on the MCU with

```bash
pio run --target uploadfs
```

## Links

- espressif serial comm problems: https://forum.digikey.com/t/esp32-s3-devkitc-1u-cant-get-serial-monitor-to-work/28069/2

```

```
