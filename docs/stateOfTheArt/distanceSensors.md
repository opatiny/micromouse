# Distance sensors

They are 2 main technologies used in micromice:

- ToF distance sensors
- IR distance sensors

We have to choose between these two technologies.

## IR

| Pro                                       | Cons                                                                |
| ----------------------------------------- | ------------------------------------------------------------------- |
| Inexpensive (0.1$)                        | Readings depend on orientation of surface detected and its color    |
| Fast                                      | Additional sensor conditioner required (typically resistor divider) |
| Small, does not require a lot of space    |                                                                     |
| Most competition micromice use IR sensors |                                                                     |

Other:

- Requires an IR LED and IR photodiode, directly soldered on the board
- Using a voltage divider results in linear response depending on light intensity. We get an analog reading that still has to be processed to result in a distance measurement.

## ToF

| Pro                               | Cons                                      |
| --------------------------------- | ----------------------------------------- |
| Readings consistent               | Expensive (2-4$)                          |
| Easy I2C interface                | Large separate board -> additional cables |
| No influence of surface and angle | Relatively slow (~16ms update rate)       |

# Links

- vl53l1x ToF sensor: https://www.tinytronics.nl/en/sensors/distance/vl53l1x-time-of-flight-tof-distance-sensor
