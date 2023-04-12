---
title: Thermo fan
description: Control of a cooling fan relay
published: true
date: 2022-09-05T11:47:44.803Z
tags: 
editor: undefined
dateCreated: 2020-01-14T02:17:03.743Z
---

# Thermo fan
Control of a cooling (thermo) fan is available through the Thermo fan dialog. 

> PWM fan output is not available for MEGA2560 MCU. Only on/off mode. 
{.is-info}

## Settings
![fan_settings2.png](/img/accessories/fan_settings2.png){.align-center width=450}

* **Fan mode** - `On/Off`or `PWM`. Set this to `Off` if fan output is not used.
* **Allow fan when off** - Whether the fan will run when the engine is not running.
* **Allow fan when cranking** - Whether the fan will run when engine is cranking.
* **Output pin** - The arduino pin that the fan control will use. In most cases this should be left as `Board Default`
* **Output inverted** - Most setups will use `No` for this setting, but if you have a fan circuit that flips the output, the polarity can be reversed with this setting
* **Fan switching temperature** - The temperature above which the fan will be turned on. 
* **Fan hysteresis** - The number of degrees below the fan set point that fan will be turned off. This is used to avoid oscillation around the set point resulting in the fan turning on and off rapidly.
* **PWM Fan frequency** - Sets the PWM fan output frequency. See the fan controller specifications for the correct frequency.

> Speeduino fan output is control signal only. Not capable of driving fan motor directly. So relay is required to turn fan on and off or separate fan controller in case of PWM fan.{.is-warning}

## PWM Fan Curve
![pwm_fan.png](/img/accessories/pwm_fan.png){.align-center width=450}

PWM Fan Curve sets the fan duty based on engine coolant temp. Duty range is 0-100%, but note that depending on the fan controller, the duty range can be different. In example 10-90% or the fan controller will go to fault state. See the fan controller specifications for the valid range.