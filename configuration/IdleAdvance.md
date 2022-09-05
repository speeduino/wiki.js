---
title: Idle advance
description: Controlling idle speed with changes to advance
published: true
date: 2022-09-05T00:31:29.706Z
tags: 
editor: undefined
dateCreated: 2020-01-14T00:45:09.872Z
---

# Idle advance control
Idle speed can be controlled without the use of an idle valve (IACV) by adjustiming timing. This feature references the same idle RPM target curve that is used by the closed loop idle control and will then adjust the advance based on the error between current and target RPM.

## Settings
![idle_advance.png](/img/idle/idle_advance.png){.align-center}

* **Idle advance mode**
	* **Added** - This is the most common mode and will alter the regular advance amount by adding (or subtracting) a certain number of degrees based on the amount of RPM delta (Between target and actual RPMs)
  * **Switched** - The ignition advance will switch to the values in the idle advance curve rather than adjusting the normal advance values
* **Idle detect mode** - This setting specifies how the ECU determines whether it is at idle or not. Most commonly this is based on a variable TPS and a specific TPS%, but if a closed throttle switch (CTPS) is available, this may be used instead
* **Delay before idle control** - This allows the idle RPM to settle during decelleration before the ignition advance is changed. 
* **Active below** - Maximum RPM that the idle advance control will be active under
* **Active Below** - If the idle detect mode is set to TPS, this is the throttle position that the control will be active below
* The following 3 settings are only used if idle detection uses a CTPS input
  * **CTPS enabled** - Whether to use a CTPS input
  * **CTPS Pin** - The Arduino pin that the CTPS is connected to
  * **CTPS Polatiry** - Whether idle is indicated by the input being pulled to ground (Normal) or indicated by the input being pulled to 5v (Inverted). In Normal mode, the internal pullup will be enabled. 

### Idle Advance curve
This curve specifies the amount of timing adjustment (Added mode) or the absoolute advance amount (Switched mode) that will be used based on the delta (error) from target RPM. 

The RPM delta is equal to: `[Idle Target RPM] - [Current RPM]`

Generally timing will be added (positive values) in order to try and increase RPM and timing will be removed (Negative values) to redue RPM.

### Idle RPM target curve
This curve specifies what the desired idle RPM is based on the current coolant temperature. This table is shared with the idle air control if that is being used in conjuction with idle advance control. 