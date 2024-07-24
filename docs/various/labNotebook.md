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

- ordered ball bearings set on polulu for custom caster wheel cause the ones we have are to high
- finished finding footprints and 3D models for kicad
- model most of 3D parts in solidworks
- push button task
- X1 encoder task works but not X4 yet (will have 4x greater resolution, counting all edge changes)
- PCB layout mostly finished and asked for review from chevallier

### 15 - 21

- no news from chevallier
- finished PCB v1.0.0 and ordered on PCBway!
- globally finished report state of the art
- design and print springy bumper
- asked for access to a workshop but didn't actually get it
- create calibration procedure for distance sensors using button -> measured sensors data to see how it looks

### 22-28

- problems with custom clearance of the PCBs delayed delivery
- managed to make X4 encoding work
- worked on motor control
  - can go forward and backward at desired speed with ramp
  - can move N degrees
- finally received PCBs on saturday!

### 29 - 05

- long week this week, one of the downs of the project...
- assembly of PCB v1.0.0 on monday
- a lot of problems with switching to the new MCU, but managed to debug all of them by the end of the week
- corrected kicad for next version of PCB
- managed to make all threads work on Algernon except motors
- next monday: double check the new PCB and order on Aisler

## May

### 06 - 12

- on Monday, verified PCB and ordered 3 on Aisler
- didn't work on Algernon the rest of the week (ascention)
- except worked a bit on the report introduction

### 13 - 19

- fixed V1.0.0 problem with motor pin on same pins as RGB LED
- both motors work separately
- started writing code to control the robot movement
- question: should I refactor the code to use classes instead of having a global state object shared between function?
- received PCB V1.1.0 and assembled it
- list of expenses of the project
- programmed robot to stop when obstacle detected -> it moved for the first time!!
- start odometry task
- hardware is finished!! -> 2 weeks earlier than planned

### 20 - 26

- 2 days were holidays so worked a bit less
- add debug mode to log true rpm speed depending on speed command
- write PID control function
- worked on function to drive robot straight using pid on wheels speed

### 27 - 02

- worked a bit on report intro

## June

### 03 - 09

- work on motor speed calibration: convert a given speed in rpm to a command for the PWM
- worked on report theory and hadware parts

### 10 - 16

- worked on PID of the speeds of the two wheels in order to try to drive straight. Managed to have plots of the response of the controller that look relatively good. We have a problem with the speed measurement though, because it has very big steps -> not very precise
- Called Chevallier and we discussed of a way to improve the speed. 2 possibilites:
  - use timer and constant nb of steps. This will be more precise for low speeds
- use the induced voltage of the motor, that is proportional to its speed -> we will need voltage dividers and ADCs
- todo: speed vs induced voltage curve of the motors to determine the speed constant

### 17 - 23

Current state and goals until the end of the project?

Current state

- robot hardware works except for minor unimportant bugs
- all elements work separately and can be controlled though the serial interface
- PID on wheels speeds starts to work, robot moved straight for the first time

**Objectives until the end of the project**

1. implement the low speed measurement of the speed using a known nb of steps divided by delta t and compare both speeds
2. test the motors: speed vs induced voltage plot and deduce speed constant
3. try to measure motors speed through induced voltage
4. **important**: PID on the robot speed (v and omega) and add the walls term in order to stay in the middle of a corridor
5. wifi debug interface
   - retrieve state in the web page
   - be able to send commands to the robot to control it from the web page
   - plot interesting things: distances, controller data (speeds, commands, target)
6. write a good report

Chevallier approved.

- implemented new speed X/dt -> better than before, can update speed every 1 ms instead of every 10ms
- made wifi work for the first time in germany and managed to change serial params through it

### 24 - 30

- started working fully on graphical interface
  - export important data from robot and send them over wifi
  - use react components to display the information
- managed to plot robot distances irl, there is a problem with the messages queue, sometimes big delays between two messages
- plot the robot position in an x/y plane!
- worked on robot speed control, where the regulation is made on v and omega of the robot

## July

### 01 - 07

- continued with the graphical interface and the plot of the regulators
- started working a lot on the report: wrote maze, mechanics and solutions chapters

### 08 - 14

Exams

### 15 - 21

Exams

## 22 - 28

- working full time on the report
