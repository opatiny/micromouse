# Microcontroller choice

## Xiao esp32-s3

Board we wanted to use initially
Exists in Platformio
Does not have enough GPIO pins!

## ESP32-S3-DevKitC-1 (Espressif)

It appears that the regulator used on the dev board accepts maximal voltages of 2.7 to 20V. Using this board would therefore allow us not to use a voltage regulator! It would therefore be yet another component which we would not need to add to our board.

## Links

- ProS3? https://esp32s3.com/#:~:text=As%20an%20input%2C%20it%20will,4.8V%20and%205.2V.
- board with antenna on Mouser ESP32-S3-DevKitC-1: https://www.mouser.ch/ProductDetail/Espressif-Systems/ESP32-S3-DevKitC-1U-N8R8?qs=Li%252BoUPsLEnv4qqHEsdK%252Bbw%3D%3D
