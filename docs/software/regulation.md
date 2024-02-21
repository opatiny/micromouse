# Coding your own regulators

The micromouse requires mutliple regulators to work as expected:

- speed regulation of the DC motors based on encoder values
- position regulation to follow a desired trajectory based on distance sensor readings

In this document, we sumarize multiple ressources to code your own regulator and find the correct values of the different parameters.

## Motors control by coding a PD regulator yourself

Designing a PD controller for micromouse: https://www.youtube.com/watch?v=qKoPRacXk9Q

- voltage => speed
- current => torque => acceleration

Steps:

- plot speed VS time for different constant voltages (open loop) -> you should put a wheel on the motor with similar inertia to the robot
- deduce the gain $K_m$ of the system by plotting end values
- compute the time constant by drawing the tangent at the origin of the curve
- in a PD controller, you have two parameters to optimize : Kd and Kp. THe goal is to have a voltage in the motors that is close to the voltage predicted by the feed forward. If the voltage in the motors is saturating and is oscillating between max and min voltage, it's really bad for the motors! YOur controller is therefore not necessarily good even though the speed response and the displacement look really good!
- there is a relationship between Kd and Kp and $\zeta$ and $\omega_n$.

- $\zeta$: dampening factor
- $\omega_n$: bandwidth

## Anti windup

## Links

- visual explanation of PID regulator: https://www.youtube.com/watch?v=4Y7zG48uHRo
