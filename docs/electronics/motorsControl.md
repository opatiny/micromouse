# Control of the DC motors

## Main idea

We want to create an I2C secondary that will be responsible of the control of the DC motors. It will need to have a high power circuit to power the motors and will have to process the encoders data to ensure that the desired movement is realized.

- Micro-controller: ATMega 328
- Motors driver: H bridge, e.g. L298N (can directly control 2 motors)
- The motor speed is controlled through a PWM

## Links

- ready to buy motor controllers: https://eu.robotshop.com/fr/collections/motor-controllers
