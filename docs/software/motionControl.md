# Control of the mouse movement

They are many challenges we have to face:

- drive straight: be able to remain in the center of a corridor
- turn left and right to navigate through the maze
- follow a known path
- handle diagonals?

"Remember that your main aim is position control rather than velocity control. Your software will adjust motor speeds to achieve a given mouse position. There is a likely to be a tradeoff between good positional control and high speed – even before you get to the stage of skidding out of control on the corners." - https://micromouseonline.com/micromouse-book/sensors/odometry/

## Control of one motor

We first want to be able to control one motor. If we are able to give a speed to a motor and a distance for which it has to spin at that speed, the control of the whole robot will be a lot easier.

## Control of both motors together

Controlling the speeds of the two motors at the same time is what will allow us to make the mouse follow a desired trajectory. Ideally, at a higher level, we would like to give complex commands to the mouse such as "go forward 10 cm" and have then not have to worry about it anymore.

We can define a set of basic moves we would like the mouse to do

- go forward a given distance
- go backwards a given distance
- turn on the spot of xx degrees, negative values could be clockwise and positive anti-clockwise
- turn of xx degrees with a given radius?

## Links

- wheel slipping issue: https://robotics.stackexchange.com/questions/1658/implementing-slip-compensation-into-a-half-size-micromouse
- reading encoder data on arduino: https://github.com/ukmars/ukmarsbot/blob/master/docs/encoder-software.md
