# General electronics notes

What do we want on our mouse?

- 2x DC motors with encoders
- 1x H bridge dual motor driver
- 2x speed controllers for the motors? -> still to be defined
- 1x MPU with bluetooth and/or wifi for debug
- 1x buzzer for sound signals
- debug LEDS
- 5x distance sensors

We distinguish two different possible approaches:

1. Use a commercial speed controllers
   - in this case we would only have one main MPU that directly sends the desired speeds to the controllers
   - question: how to know the total number of impulsions from the encoders (for odometry)
     - is this info provided by the speed controller
     - do we connect the encoders directly to the leader MPU, where we count the impulsions ourselves?
     - distance sensors connected on main MPU
2. Custom speed control
   - requires the implementation of a PID regulator
   - we would have an I2C follower MPU dedicated to the control of the motors -> lots of additional code to write
   - the distance sensors are connected to the secondary MPU too
