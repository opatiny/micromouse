# I2C to IO expander

We need an additional module that allows to have more IO pins through I2C because our microcontroller doesn't have enough pins otherwise.

Ideally we'd like to be able to do some PWM on these pins in order to put the buzzer on one of the pins, hence saving another MCU pin.

## Links

- TCA6408A (8 outputs, 1.6 to 5.5V): https://www.ti.com/product/TCA6408A#features
- XRA1200/1200P (8 outputs, 3.3V max): https://www.mouser.de/datasheet/2/146/xra1200_100_092011-1856036.pdf
