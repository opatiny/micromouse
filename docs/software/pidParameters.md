# Choosing PID parameters

We proceed by trial and error.

## Wheels speed PID

Both wheels have the same PID parameters. The speed regulated is in rpm.
Rolled really straight for about 7m.

- (BA) Kp: 0.100
- (BB) Ki: 0.001
- (BC) Kd: 0.004

## Robot speed PID

We regulate the robot's speed using two PID regulators, one for the angular speed (in rad/s) and the other one for the linear speed (in m/s).
