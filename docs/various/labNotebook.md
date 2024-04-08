# Lab notebook: daily project notes

## February

### 26 - 03

- order polulu components
- planning v1
- recapitulative state of the art table
- mms discovery and first test
- choice of MCU: esp32c3 and attribution of all pins
- configuration of programming environment of the esp32c3 on the mac
  - test of serial communication
  - first i2c device (accelerometer)
  - configure wifi

## March

### 04 - 10

- ordered distance sensors on tinyelectronics.nl

### 08 - 14

- received distance sensors
- started distance sensing thread and tried modifying the sensors I2C addresses
- realized that we cannot change the addresses permanently -> we'll have to do it every time the device is powered -> not enough pins -> need IO expander ove I2C

### 15 - 22

- try to find suitable battery
- order lipo batteries as well as charger
- made first motor tests with motor driver -> can make motor spin at various speeds
- use IO pins of the MCU on XSHUT pins to enhance distance sensors thread and have 2 sensors work in parallel
- after discussion, realized that it is probably easier to change the MCU board instead of adding IO expander. We're considering the Espressif ESP32-S3 board: the code will be the same, but we'll have more GPIO

### 25 - 31

- ordered JST and XT60 connectors on amazon
- ordered new esp boards on Mouser
- fixed distance sensors thread -> it now works with 2 sensors in parallel
- meeting Prof. Weiss on Monday
- battery voltage measurement task works

## April

### 01 - 07

- buzzer task works
- received batteries and charger and learned to use it
- manage to spin a motor forwards and backwards
- analysed impact of motor on battery voltage
- start encoder task -> problem: counter increases even when motor does not spin
- PCB v 0.1 schematic mainly finished
- started PCB layout too

### 08 - 14
