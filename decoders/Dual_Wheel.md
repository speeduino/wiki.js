---
title: Dual Wheel
description: 
published: true
date: 2020-01-17T00:44:09.513Z
tags: trigger
---

## Dual Wheel

A dual wheel trigger is one where there is a primary multi-tooth wheel combined with a secondary single pulse to provide location information. The primary input should contain no missing teeth. Both pulses can run at either cam or crank speed, but sequential operations requires that the secondary pulse is located on the cam. The design of the secondary trigger can vary (Eg a single short tooth, half-moon wheel etc), provided it only provides a single pulse per revolution.

As with other arbitrary tooth count wheels, the number of teeth must evenly divide into 360 (or 720 if running at cam speed).

Tooth \#1 is defined to be the first tooth on the primary wheel AFTER the pulse on the secondary wheel.

### Applications

Dual wheel triggers are standard fitment on a number of Euro make cars, particularly those from VW and Audi. They are also a popular aftermarket fitment due to their simplicity and ease of fitment.

### Tuner Studio Configuration


<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/decoders/dualwheel_triggerconfig.png" />

</center>
Fields:

-   Primary base teeth: This is the number of teeth on the primary input wheel. If the primary wheel is located on the cam (or is otherwise running at cam speed), divide it's teeth by two for this setting
-   Trigger Angle: This is the angle in crank degrees **AFTER** TDC (ATDC) of the first tooth on the primary input, following the single pulse on the secondary input.
-   Trigger edge: Whether the trigger will be taken from the leading (rising) or trailing (falling) edge of the primary input
-   Secondary trigger edge: As above, but for the secondary input
-   re-sync every cycle: Whether the system will reset the sync level every time the secondary input is seen. This can be useful for noisy crank triggers that otherwise my lose sync permanently and not recover until a restart.

### Timing Setting

The trigger angle can be found by placing the engine at TDC, then calculating how far it must be rotated until the first primary tooth after the secondary pulse.

#### Sequential operation

The missing tooth decoder supports sequential operation if the secondary input is running at cam speed. If Sequential mode is selected for either the fuel timing or spark timing, the system will expect that the secondary input is running at cam speed and will only provide half the output pulses if this is not the case.

This cam signal should take the form of a single pulse every complete cycle. This can be a short tooth or a half moon type arrangement, provided that electrically there is only a single rising (or falling) pulse per cycle.