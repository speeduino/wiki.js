---
title: Flex Fuel
description: Setting up the flex fuel / ethanol content sensor
published: true
date: 2020-04-08T02:07:49.978Z
tags: 
editor: undefined
dateCreated: 2020-01-06T01:53:57.218Z
---

# Flex Fuel

## Overview

Speeduino has the ability to modify fuel and ignition settings based on the ethanol content of the fuel being used, a practice typically known as flex fuelling. A flex fuel sensor is installed in the feed or return fuel lines and a signal wire is used as an input on the Speeduino board.

As ethanol is less energy dense, but also has a higher equivalent octane rating, adjustments to the fuel load and ignition timing are required.

## Hardware

Speeduino uses any of the standard GM/Continental Flex fuel sensors that are widely available and were used across a wide range of vehicles. These were available in 3 different units, all of which are functionally identical, with the main difference being only the physical size and connector. The part numbers for these are:

-   Small - \#13577429
-   Mid-size - \#13577379
-   Wide - \#13577394 (Same as the mid-size one, but with longer pipes)

All 3 use a variant of the Delphi GT150 series connector. You can use a generic GT150 connector, but you will have to clip off 2 tabs from the side of the sensor.

Part numbers :

-   Housing (\#13519047)
-   Pins (\#15326427)
-   Seal (\#15366021)

Alternatively, there is a GM part for a harness connector, part number 13352241: <http://www.gmpartsdirect.com/oe-gm/13352241>

### Wiring

All units are wired identically and have markings on the housing indicating what each pin is for (12v, ground and signal) Speeduino boards v0.3.5+ and v0.4.3+ have an input location on their proto areas that the signal wire can be directly connected to.

On boards earlier to these, you will need to add a pullup resistor of between 2k and 3.5k Ohm. Recommended value is 3.3k, however any resistor in this range will work. Note that this is a relatively strict range, more generic values such as 1k or 10k DO NOT WORK with these sensors.

## Tuning
![flex_settings.png](/img/flex/flex_settings.png){.align-center width=450}

-   **Sensor frequency -** The minimum and maximum frequency of the sensor that represent 0% and 100% ethanol respectively. For standard GM/Continental flex sensors, these values are 50 and 150
-   **Fuel multiplier% -** This is the additional fuel that should be added as ethanol content increases. The Low value on the left represents the adjustment to the fuel map at 0% ethanol and will typically be 100% if the base tune was performed with E0 fuel. If the base tune was made with E10 or E15 however, this value can be adjusted below 100%. The high value represents the fuel multiplier at 100% ethanol (E100) and the default value of 163% is based on the theoretical difference in energy density between E0 and E100. Tuning of this value may be required
-   **Additional advance -** The additional degrees of advance that will be applied as ethanol content increases. This amount increases linearly between the low and high values and is added after all other ignition modifiers have been applied.
