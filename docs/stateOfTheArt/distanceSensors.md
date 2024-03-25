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

| Pro                               | Cons                                      | ≤   |
| --------------------------------- | ----------------------------------------- | --- |
| Readings consistent               | Expensive (2-4$)                          |
| Easy I2C interface                | Large separate board -> additional cables |
| No influence of surface and angle | Relatively slow (~16ms update rate)       |

## Comparison of the different VL sensors

I bought the VL53L1x but looking at this comparison table, I should have taken the Vl6180X, which has smaller minimum range, smaller max range and is cheaper....

- the different sensors have the same footprint
- the only advantage of the VL53L1X would be that it has a smaller field of view (min 15°)

https://www.pololu.com/product/2490#comparison

# Links

- vl53l1x ToF sensor: https://www.tinytronics.nl/en/sensors/distance/vl53l1x-time-of-flight-tof-distance-sensor
