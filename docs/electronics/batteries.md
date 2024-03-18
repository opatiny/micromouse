# Batteries of the micromouse and power management

The power supply of the micromouse is a really important aspect. We need to be able to deliver enough energy in a short time lapse in order to ensure good acceleration. We need relatively high power for the motors (with a higher voltage: 6-12V) and a low voltage for the microcontrollers and sensors (3.3V). We will therefore need a voltage regulator circuit.

- should we add a voltage meter to check the battery voltage?
- we need to be able to provide enough current! Motors require max 0.75 A each and MCU about 0.2 A -> we should be fine with a battery that can output 2A
- most micromouse use LiPo batteries

## The best battery so far

https://www.reichelt.de/akku-pack-li-polymer-7-4-v-1100-mah-rd-xt-1100-s2-p336956.html?&trstct=pol_8&nbc=1

- 7.4V
- length 55mm
- connector: XT60 like for drones
- max current: 27A
- weight: 55g
- capacity: 1.1Ah

What is balancing and how to deal with it?

- the battery has 2 connectors
- "Balancing plug. It's used to equalize the charge between the pack's cells when you recharge the LiPo."
- still need to find a charger

# Links

- 7.4V, 700mAh, 55g, Li-Ion battery: https://www.brack.ch/carrera-rc-rc-akku-li-ion-700-mah-7-4-v-222009
- RC-Akku Li-Ion 800 mAh 7.4V, 43g: https://www.brack.ch/amewi-rc-akku-li-ion-800-mah-7-4-v-1195382
- RC-Akku Li-Ion 600 mAh 7.4V, 45g: https://www.brack.ch/amewi-rc-akku-li-ion-600-mah-7-4-v-1195407
- USB-8.4V-1200, 9V Block, 6F22, 1200mAh Li-Ion (used in uk micromouse): https://www.accuswiss.ch/product_info.php?info=p26815_Liter---USB-8-4V-1200---9V-Block---6F22---7-4-Volt-1200mAh-Li-Ion--Micro-USB.html
- usb rechargable 9V battery: https://thepihut.com/products/400mah-li-ion-rechargeable-9v-e-block-battery

Li-Po batteries with sufficient max current:

- https://www.reichelt.de/akku-pack-li-polymer-7-4-v-1500-mah-rd-xt-1500-s2-p336957.html?&trstct=pol_6&nbc=1
- https://www.reichelt.de/akku-pack-li-polymer-7-4-v-800-mah-rd-xt-800-s2-p336954.html?&trstct=pol_10&nbc=1
- https://www.reichelt.de/akku-pack-li-polymer-7-4-v-1100-mah-rd-xt-1100-s2-p336956.html?&trstct=pol_8&nbc=1
