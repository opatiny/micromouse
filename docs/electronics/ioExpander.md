# I2C to IO expander

We need an additional module that allows to have more IO pins through I2C because our microcontroller doesn't have enough pins otherwise.

Ideally we'd like to be able to do some PWM on these pins in order to put the buzzer on one of the pins, hence saving another MCU pin.

## Links

- TCA6408A (8 outputs, 1.6 to 5.5V): https://www.ti.com/product/TCA6408A#features
- XRA1200/1200P (8 outputs, 3.3V max): https://www.mouser.de/datasheet/2/146/xra1200_100_092011-1856036.pdf

- PCA9685 has 16 PWM outputs: https://www.mouser.de/ProductDetail/NXP-Semiconductors/PCA9685PW112?qs=6YAT8rHPFU9wZqiAeiOMZw%3D%3D&mgh=1&vip=1&gad_source=1&gclid=CjwKCAjw7-SvBhB6EiwAwYdCAXFtVlhRFrgpRtoXzgJpr3ubGgi0Ao3OpAYnoZW9AsbrIGiYQQJkiBoCRvAQAvD_BwE
