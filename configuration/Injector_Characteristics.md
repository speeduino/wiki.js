---
title: Injector_Characteristics
description: 
published: true
date: 2020-01-06T02:21:20.560Z
tags: 
---

Overview
--------

Settings
--------

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/constants/injectorChars.png" />
</center>

| Variable                    | Typical value | Comment                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|-----------------------------|---------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Injector Open Time          | 1.0 - 1.5     | The time the injector takes to open completely once triggered, plus the time necessary to close. This is specific to each injector type and version. See [Fuel Calculation](Fuel_Calculation "wikilink") for how this value is used, and the [Tuning section](Tuning_section "wikilink") for adjustments to this value.                                                                                                                                                                                                                                                          |
| Injector Close Angles       | 355           | This represents the angle, relative to each cylinders TDC, that the injector squirt will end. This can be varied per channel (Including for semi-sequential wiring), but the default value of 355 is suitable for most applications.                                                                                                                                                                                                                                                                                                                                             |
| Injector Duty Limit         | 85%           | The injector opens and closes once per crank revolution so, taking into account the open time of the injector, the duty cycle is limited to avoid this exceeding the revolution time. A value of 85% is recommended, but a higher value can be used for faster opening injectors. Note that once this duty cycle limit is reached, it will not be exceeded as the fuel injector cannot close and reopen fast enough to supply more fuel. This may potentially cause lean conditions at high RPM. If hitting this limit, strongly consider whether larger injectors are required. |
| Injector Voltage Correction | 100%          | The percentage the the injector pulse width is varied with changes in supply voltage. A value of 100% means no change to the pulse width.                                                                                                                                                                                                                                                                                                                                                                                                                                        |

