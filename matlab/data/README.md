# Information about the data csv files

Motor speed absolute value from 0 to 255.

## Battery voltage when motors speed varies quickly

### `batteryVoltage1.csv`

- motor: 1
- motor speed: 200
- profile: rectangle
- length: 1 s
- sampling: 20 ms
- task priority: 0
- battery: 3S AAA batteries

### `batteryVoltage2.csv`

- motor: 1
- motor speed: 200
- profile: rectangle
- length: 1 s
- sampling: 5 ms
- task priority: 0
- battery: 3S AAA batteries

### `batteryVoltage3.csv`

- motor: 1
- motor speed: 200
- profile: rectangle
- length: 1 s
- sampling: 1 ms
- task priority: 2
- battery: 3S AAA batteries

### `batteryVoltage4.csv`

- motor: 1
- motor speed: 200
- profile: rectangle
- length: 1 s
- sampling: 5 ms
- task priority: 2
- battery: 3S AAA batteries

### `batteryVoltage4.csv`

- motor: 1
- motor speed: 100
- profile: rectangle
- length: 1 s
- sampling: 5 ms
- task priority: 2
- battery: LiPo battery 2S1P
- added 0.1uF ceramic capacitors on motor terminals

## Analyse distance sensors results

### `distanceSensorsConstant1.csv`

Using breadboard with 2 sensors to see what the measurements look like.

- constant distance of 250 mm from edge of board
- measurements every second using N times DELAY
- timing budget: 140 ms

### `distanceSensorsCalibration1.csv`

Using breadboard with 2 sensors to see what the measurements look like when distance varied.

- distance varied from 0 to 450 mm with 50mm steps (from edge of board)
- using the push button to measure when required
- timing budget: 140 ms

## Analyse encoders data

Log the data the encoder for a given speed profile. All measurements were made on motor 1.

### `encoders1.csv`

- profile: rectangle
- max speed: 100
- movement length: 1 s
- encoding: X4
- sampling: 5 ms

### `encoders2.csv`

- profile: trapeze
- ramp delay: 1
- max speed: 100
- movement length: 1 s
- encoding: X4
- sampling: 5 ms

### `encoders3.csv`

- profile: step response
- max speed: 100
- encoding: X4
- sampling: 5 ms

### `encoders4.csv`

- profile: trapeze
- ramp delay: 5
- max speed: 100
- movement length: 1 s
- encoding: X4
- sampling: 5 ms

### `encoders5.csv`

- profile: step response
- max speed: 255
- encoding: X4
- sampling: 5 ms

### `encoders6.csv`

- profile: trapeze
- ramp delay: 10
- max speed: 100
- movement length: 1 s
- encoding: X4
- sampling: 5 ms

## True wheel speed vs command

We want to analyse what the true wheel speed is depending on the duty cycle applied to the motor

- command (duty cycle) is a value between -256 and 255
- the actual motors speed is in rpm
- robot: Algernon v1.1.0
- motors 3 (left) and 4 (right)
- battery: LiPo battery 2S1P

### `wheelSpeedCalibration1.csv`

- delay between speed changes: 1s
- speed range: [0, 255]
- command step: 10

### `wheelSpeedCalibration2.csv`

- delay between speed changes: 2s
- speed range: [-255, 255]
- command step: 5

### `wheelSpeedCalibration3.csv`

- delay between speed changes: 1s
- speed range: [-255, 255]
- command step: 1

### `wheelSpeedCalibration5.csv`

- delay between speed changes: 1s
- speed range: [-255, 255]
- command step: 5

Caution: in this case we use the new speed measurement X/dt and the odometry delay is 1ms

## Wheel speed calibration

We use the same dataset types as for wheel speed calibration.

Check whether cpp and matlab yield to same result.

- command (duty cycle) is a value between -256 and 255
- robot: Algernon v1.1.0
- motors 3 (left) and 4 (right)
- battery: LiPo battery 2S1P

### `wheelSpeedCalibration4.csv` and `polynoms4.csv`

- delay between speed changes: 1s
- speed range: [-255, 255]
- command step: 5

### `wheelSpeedCalibration6.csv` and `polynoms6.csv`

- delay between speed changes: 1s
- speed range: [-255, 255]
- command step: 5

Caution: in this case we use the new speed measurement X/dt and the odometry delay is 1ms

## Test speed calibration

Verify if desired RPM speed and actual motor speed is the same.

- speed range: -550 -> 550 rpm
- robot: Algernon v1.1.0
- motors 3 (left) and 4 (right)
- battery: LiPo battery 2S1P

### `testSpeedCalibration1.csv`

- delay between speed changes: 1s
- speed step: 10 rpm

## Test PID

Check how the desired speed is reached by both wheels, using a PID regulator

- robot: Algernon v1.1.0
- motors 3 (left) and 4 (right)
- battery: LiPo battery 2S1P

## `testPid1.csv`

- Kp: 0.020
- Ki: 0.000
- Kd: 0.010

Time in ms.

## `testPid2.csv`

Completely refactored odometry to fix speed issues. Odometry and PID loops have a delay of 10 ms.

- Kp: 0.020
- Ki: 0.001
- Kd: 0.000

Time in seconds.

## `testPid3.csv`

- Kp: 0.020
- Ki: 0.000
- Kd: 0.001

Time in seconds.

## `testPid3.csv`

- Kp: 0.020
- Ki: 0.002
- Kd: 0.000

Time in seconds.

## `testPid6.csv`

- Kp: 0.015
- Ki: 0.003
- Kd: 0.000

## Compare speed measurement methods

We measure the speed in 2 ways:

1. divide number of counts from since last call by the time elapsed
2. divide a known number of counts, always the same, by the time taken to move this nb of steps

- robot: Algernon v1.1.0
- motors 3 (left) and 4 (right)
- battery: LiPo battery 2S1P

### `compareSpeeds1.csv`

- odometry task delay: 10ms

```csv
 pNegLeft, pPosLeft, pNegRight, pPosRight
-0.0000000061, -0.0000000037, -0.0000000037, 0.0000000016
-0.0000052032, 0.0000054147, -0.0000028143, -0.0000009649
-0.0016165279, -0.0019280235, -0.0008025189, 0.0002857632
-0.0617476981, 0.2247056010, 0.0270471843, 0.0791166413
-42.7075095500, 74.9729712389, -45.3625414581, 45.1797983120
```

### `compareSpeeds2.csv`

- odometry task delay: 1ms
- same regressions as before
- we see that the speed speed is really big for smaller speeds: variations of 167 rpm at a time

Questions:

- why is the low speed never zero??

```csv
 pNegLeft, pPosLeft, pNegRight, pPosRight
-0.0000000061, -0.0000000037, -0.0000000037, 0.0000000016
-0.0000052032, 0.0000054147, -0.0000028143, -0.0000009649
-0.0016165279, -0.0019280235, -0.0008025189, 0.0002857632
-0.0617476981, 0.2247056010, 0.0270471843, 0.0791166413
-42.7075095500, 74.9729712389, -45.3625414581, 45.1797983120
```

### `compareSpeeds4.csv`

- odometry task delay: 1ms
- logging delay: 250 ms
- both high speed and low speed are computed every 1ms

## Controller delay impact

We have a delay in the `robotDriveStraight` function, that implements the speed controllers of the wheels. We vary this delay in order to see the impact on the step response of the controller. Ideally, we want to reduce this delay to the maximum, because delay in regulation loops lead to higher instability of the system.

- target speed: 200 rpm
- robot: Algernon v1.1.0
- motors 3 (left)
- battery: LiPo battery 2S1P

Files: `controllerDelayImpactXXms.csv`
