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

## PID theory

- P: proportional term, corrects present error
- I: integral term, corrects past error
- D: differential term, corrects future error

## Phase lead controller: an alternative to PID or PD

- https://micromouseonline.com/2011/05/16/designing-a-phase-lead-controller/

## Links

- visual explanation of PID regulator: https://www.youtube.com/watch?v=4Y7zG48uHRo
- PID equation IEEE course: https://docs.google.com/presentation/d/19loBpku__17k4MO-2T24BOqiYk6qPrbNBHbNcyRvOSU/edit#slide=id.g190c6a9e1b4_0_268
- example of bdc motor on esp32 s3 with PID!!! https://github.com/espressif/esp-idf/tree/v4.4/examples/peripherals/mcpwm/mcpwm_brushed_dc_control
- SP-IDF is the official development framework for the ESP32: https://docs.espressif.com/projects/esp-idf/en/stable/esp32/index.html
