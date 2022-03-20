---
title: Injector Characteristics
description: Configuring the injector properties
published: true
date: 2020-04-08T02:08:09.204Z
tags: 
editor: undefined
dateCreated: 2020-01-06T01:54:01.036Z
---

# Injector Characteristics
## Overview
Fuel injectors have unique hardware properties that must be accounted for within your tune. Ideally these will be provided as part of the specifications for your injectors, however in some cases the data may not be avaialble or be difficult to find. Typical values are given below as starting points for these cases. 

## Settings
![Injector Characteristics](/img/constants/injectorChars.png){.align-center width=50%}

| Variable                    | Typical value | Comment                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|-----------------------------|---------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Injector Open Time          | 0.9 - 1.5     | The time the injector takes to open completely once triggered, plus the time necessary to close. This is specific to each injector type and version.                                                                                                                                                                                                                                                           |
| Injector Close Angles       | 355           | This represents the angle, relative to each cylinders TDC, that the injector squirt will end. This can be varied per channel (Including for semi-sequential wiring), but the default value of 355 is suitable for most applications.                                                                                                                                                                                                                                                                                                                                             |
| Injector Duty Limit         | 85%           | The injector opens and closes once per crank revolution so, taking into account the open time of the injector, the duty cycle is limited to avoid this exceeding the revolution time. A value of 85% is recommended, but a higher value can be used for faster opening injectors. Note that once this duty cycle limit is reached, it will not be exceeded as the fuel injector cannot close and reopen fast enough to supply more fuel. This may potentially cause lean conditions at high RPM. If hitting this limit, strongly consider whether larger injectors are required. |
| Injector Voltage Correction | 100%          | The percentage the the injector pulse width is varied with changes in supply voltage. A value of 100% means no change to the pulse width.                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| Voltage Correction Mode     | Open time only| Whether the voltage correction applies to just the opening time or the whole pulse width. |