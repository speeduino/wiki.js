---
title: Thermo fan
description: Control of a cooling fan relay
published: true
date: 2020-01-16T11:42:04.261Z
tags: aux outputs, tuning
---

# Thermo fan
Control of a cooling (thermo) fan is available through the Thermo fan dialog. 

> Note that only On/Off fan control is currently possible (Not fan speed control using PWM). 
{.is-info}

## Settings
![fan.png](/img/accessories/fan.png){.align-center width=450}

* **Fan mode** - Currently only `On/Off` mode is supported
* **Output pin** - The arduino pin that the fan control will use. In most cases this should be left as `Board Default`
* **Output inverted** - Most setups will use `No` for this setting, but if you have a fan circuit that flips the output, the On/Off polarity can be reversed with this setting
* **Fan temperature** - The temperature above which the fan will be turned on. 
* **Fan hysteresis** - The number of degrees below the fan set point that fan will be turned off. This is used to avoid oscillation around the set point resulting in the fan turning on and off rapidly. 