# Control of the mouse movement

They are many challenges we have to face:

- drive straight: be able to remain in the center of a corridor
- turn left and right to navigate through the maze
- follow a known path
- handle diagonals?

"Remember that your main aim is position control rather than velocity control. Your software will adjust motor speeds to achieve a given mouse position. There is a likely to be a tradeoff between good positional control and high speed – even before you get to the stage of skidding out of control on the corners." - https://micromouseonline.com/micromouse-book/sensors/odometry/

## Links

- wheel slipping issue: https://robotics.stackexchange.com/questions/1658/implementing-slip-compensation-into-a-half-size-micromouse
- reading encoder data on arduino: https://github.com/ukmars/ukmarsbot/blob/master/docs/encoder-software.md
