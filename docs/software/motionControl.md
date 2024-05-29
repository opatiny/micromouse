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

## Problem with structuring the code

I initially structured the code in order to have a main `state` object passed to all the functions that need it in the different tasks. Indeed, since all tasks run in parallel, I find it difficult to see how I can keep multitasking while using classes. Using classes would probably make the final interface easier, and it would therefore be a more elegant solution, but I don't see how to implement it right now.

- example odometry code and robot simulator: https://www.toptal.com/robotics/programming-a-robot-an-introductory-tutorial
- concurrent planning and execution: https://www.cs.cmu.edu/~reids/papers/tca-ambler.pdf

## Links

- wheel slipping issue: https://robotics.stackexchange.com/questions/1658/implementing-slip-compensation-into-a-half-size-micromouse
- reading encoder data on arduino: https://github.com/ukmars/ukmarsbot/blob/master/docs/encoder-software.md
- types of errors in the mouse position (I should have used steppers -> much less errors): https://micromouseonline.com/micromouse-book/navigation/straights/
- UCBE course: https://ieee.berkeley.edu/micromouse-lab-5/
