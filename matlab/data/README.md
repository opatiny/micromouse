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
- speed step: 10

### `wheelSpeedCalibration2.csv`

- delay between speed changes: 2s
- speed range: [-255, 255]
- speed step: 5

### `wheelSpeedCalibration3.csv`

- delay between speed changes: 1s
- speed range: [-255, 255]
- speed step: 1

## Wheel speed calibration

Check wheter cpp and matlab yield to same result.

- command (duty cycle) is a value between -256 and 255
- robot: Algernon v1.1.0
- motors 3 (left) and 4 (right)
- battery: LiPo battery 2S1P

### `wheelSpeedToCommand1.csv` and `polynoms1.csv`

- delay between speed changes: 1s
- speed range: [-255, 255]
- speed step: 5
