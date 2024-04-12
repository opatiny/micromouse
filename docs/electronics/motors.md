# Motors and encoders

We are using brushed DC motors with an integrated gearbox. Additionally, we measure the motors movement with magnetic encoders.

## Voltage drop due to motors

"One major drawback to working with motors is the large amounts of electrical noise they produce. This noise can interfere with your sensors and can even impair your microcontroller by causing voltage dips on your regulated power line. Large enough voltage dips can corrupt the data in microcontroller registers or cause the microcontroller to reset." - https://www.pololu.com/docs/0J15/9

**Solution:** Solder 0.1uF ceramic capacitors (not polarized!) between motor terminals and motor case

## Cables

The Polulu motors encoders are equipped with JST SH cables. Two of the 6 pins are directly connected to the motors pins. By checking the specifications, we wee that the cables are 28AWG, which can have a maximal continuous current of 1.5A.

- http://www.mosaic-industries.com/embedded-systems/electronic-instrument-design-new-product-development/cables/ribbon-cable-current-rating
- https://www.pololu.com/product/4763/specs
