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

## Analyse distance sensors results

### `distanceSensorsConstant1.csv`

Using breadboard with 2 sensors to see what the measurements look like.

- constant distance of 250 mm from edge of board
- measurements every second

### `distanceSensorsCalibration1.csv`

Using breadboard with 2 sensors to see what the measurements look like when distance varied.

- distance varied from 0 to 450 mm with 50mm steps (from edge of board)
- using the push button to measure when required
