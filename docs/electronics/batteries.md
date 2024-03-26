# Batteries and battery charger

## Batteries: 1100mAh 2S1P LiPo batteries

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

## Charger: 608AC smart charger

To charge our batteries:

- plug charger
- connect batteries: the voltage in each cell appears
- set Task to Charge
- set Chemistry to LiPo
  set Condition to the voltage at which you want to charge each of the cells, e.g 4.1 (max for our cells would be 4.2V)
- set Cells to 2S
  Set the charging current to

# Important notice for LiPo batteries

- do not discharge batteries more than 70% of nominal capacity (draw max 700mAh from a 1000mAh battery)
- never let voltage of the cells drop below 2.6V -° in our case we must get a warning when voltage is approaching 5.2V
- our battery current should not exceed 1C -> do not charge with more than 1.1 A!!
