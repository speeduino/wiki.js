---
title: VSS and Gear Detection
description: 
published: true
date: 2021-09-12T10:02:03.692Z
tags: 
editor: undefined
dateCreated: 2020-05-12T02:08:21.817Z
---

# VSS and Gear Detection

Speeduino includes Vehicle Speed Sensing option that senses speed by measuring pulses in speeduino input. Other VSS input options aren't yet supported.

## Settings

![vss_settings.png](/img/accessories/vss_settings.png)

-   **VSS input mode** - Select between "Pulses per KM" or "Pulses per mile" depending on which one is preferred. If VSS is not used, set this to Off.
-   **VSS Pin** - Select what input pin is used for VSS signal.
> **Note:** In Arduino Mega you need to use pins that have external interrupt capability. These pins are 2, 3, 18, 19, 20 and 21. Other pins in Arduino Mega wont work for this purpose.{.is-info}
### VSS calibration
-   **Pulses Per KM(pulses)** - You can set manually how many pulses at VSS input equal one kilometer travel distance. Or you can drive speed of 60km/h and click "60km/h auto-calibrate" button to set pulses per km setting automatically.
-   **Smoothing Factor(%)** - A smoothing factor to help reduce noise in the VSS signal. Typical values are between 0 and 50
### Gear Detection
> Gear detection should only be calibrated once VSS is working correctly and should be done with a passenger for safety!. 
{.is-warning}

Once VSS is working accurately, gear detection can also be configured. To calibrate this:
1. Place car in 1st gear and begin driving
2. Once RPM reaches approx. 2500 in this gear, press the `Set Gear 1` button
3. Repeat above steps for each gear (Pressing the appropriate button each time)
