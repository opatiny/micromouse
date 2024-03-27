# Pins mapping of the ESP32-S3-DEVKITC (Espressif)

![](../datasheets/images/esp32-s3-pinout.png)

## Left side (USB connectors at the bottom)

| Jumper pin | Silk label | Pin value | Usage                       |
| ---------- | ---------- | --------- | --------------------------- |
| J1_1       | 3V3        | 3V3       | MCU output voltage (Vin)    |
| J1_2       | 3V3        | 3V3       | MCU output voltage (Vin)    |
| J1_3       | RST        | RST       |                             |
| J1_4       | 4          | GPIO4     | Encoder left, pin 1         |
| J1_5       | 5          | GPIO5     | Encoder left, pin 2         |
| J1_6       | 6          | GPIO6     | Encoder right, pin 1        |
| J1_7       | 7          | GPIO7     | Encoder right, pin 2        |
| J1_8       | 15         | GPIO15    | Left motor, pin 1           |
| J1_9       | 16         | GPIO16    | Left motor, pin 2           |
| J1_10      | 17         | GPIO17    | Right motor, pin 1          |
| J1_11      | 18         | GPIO18    | Right motor, pin 2          |
| J1_12      | 8          | ADC1_7    | Battery voltage measurement |
| J1_13      | 3          | GPIO3     | Buzzer                      |
| J1_14      | 46         | GPIO46    |                             |
| J1_15      | 9          | GPIO9     |                             |
| J1_16      | 10         | GPIO10    |                             |
| J1_17      | 11         | GPIO11    |                             |
| J1_18      | 12         | GPIO12    |                             |
| J1_19      | 13         | GPIO13    |                             |
| J1_20      | 14         | GPIO14    |                             |
| J1_21      | 5V         | 5V0       | Connected to battery        |
| J1_22      | G          | GND       | Common ground               |

## Right side (USB connectors at the bottom)

Note: ToF are VL53L1X time of flight distance sensors.

| Jumper pin | Silk label | Pin name | Usage                 |
| ---------- | ---------- | -------- | --------------------- |
| J3_1       | G          | GND      | Common ground         |
| J3_2       | TX         | GPIO43   |                       |
| J3_3       | RX         | GPIO44   |                       |
| J3_4       | 1          | GPIO1    | SDA                   |
| J3_5       | 2          | GPIO2    | SCL                   |
| J3_6       | 42         | GPIO42   | Left ToF XSHUT        |
| J3_7       | 41         | GPIO41   | Front-left ToF XSHUT  |
| J3_8       | 40         | GPIO40   | Front ToF XSHUT       |
| J3_9       | 39         | GPIO39   | Front-right ToF XSHUT |
| J3_10      | 38         | GPIO38   | Right ToF XSHUT       |
| J3_11      | 37         | GPIO37   |                       |
| J3_12      | 26         | GPIO26   |                       |
| J3_13      | 35         | GPIO35   |                       |
| J3_14      | 0          | GPIO0    |                       |
| J3_15      | 45         | GPIO45   |                       |
| J3_16      | 48         | GPIO48   |                       |
| J3_17      | 47         | GPIO47   |                       |
| J3_18      | 21         | GPIO21   |                       |
| J3_19      | 20         | GPIO20   |                       |
| J3_20      | 1          | GPIO19   |                       |
| J3_21      | G          | GND      | Common ground         |
| J3_22      | G          | GND      | Common ground         |

## Other

- RGB LED on pin 38
