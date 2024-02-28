# Control of the DC motors (motor drivers)

## Main idea

We want to create an I2C secondary that will be responsible of the control of the DC motors. It will need to have a high power circuit to power the motors and will have to process the encoders data to ensure that the desired movement is realized.

- Micro-controller: ATMega 328
- Motors driver: H bridge, e.g. L298N or LN288D (can directly control 2 motors)
- The motor speed is controlled through a PWM
- Motors must be equipped with encoders

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

## Do we need speed controllers?

Speed controllers are used to directly control the speed of the motors, instead of controlling the current and therefore the torque. The speed controller uses the encoder data to regulate the motor speed using a closed loop system. Using a speed controller would facilitate the control of our motors on a higher level, but it adds one more circuit to the mouse, which requires power and space.

Could we not use a speed controller and instead directly control the motors from the MCU through an H bridge and use the encoder data to determine the distance that has been covered, hence realizing a position regulation instead of a speed regulation?

This approach is definitely used in some mice:

- https://www.youtube.com/watch?v=b9JztUkttgk

## Encoders

- encoders theory: https://www.posital.com/en/products/communication-interface/incremental/incremental-encoders.php
- TTL (transistor transistor logic) output encoder: encoders with two lines that have a 90° offset to be able to know the direction in which we rotate -> https://www.motioncontroltips.com/what-is-ttl/

## Links

- ready to buy motor controllers: https://eu.robotshop.com/fr/collections/motor-controllers
- I2C motor controller for 1 motor up to 2.5A speed or position controller closed loop: https://www.pololu.com/product/3142
- motors control with simple P regulator: https://ieee.berkeley.edu/micromouse-lab-5/
- micromouse online motors control: https://micromouseonline.com/2011/05/15/designing-the-motor-controller/
