---
title: VVT
description: 
published: true
date: 2021-08-10T13:13:40.230Z
tags: tuning, variable valve timing, vvt
editor: markdown
dateCreated: 2020-05-14T05:39:02.336Z
---

# Variable Valve Timing (VVT)

Speeduino has an on board VVT controller than can be used to regulate one or two camshafts. VVT output can adjust valve timing or lift usually by controlling solenoid that uses oil pressure to change cam timing/lift. 

Supported VVT modes are On/Off, openloop PWM and closed loop PWM.

## VVT modes

### On/Off

In On/Off mode the VVT output is either On or Off depending on the load and RPM. This is suitable control mode for simple VVT systems in older engines. MAP or TPS can be selected as load source. VVT control table is used to define when VVT output is on or off. Value 100 on the table defines that output is on and any other value sets the output off. For simplicity it's recommended to use values 100 and 0 in the VVT control table to represent on and off (0% duty and 100% duty). This mode can be used for example in BMW single vanos engines and Honda VTEC engines.

### Open loop PWM

In Open loop PWM mode the VVT output uses Pulse Width Modulation to adjust the cam timing. MAP or TPS can be selected as load source and also output frequency is selectable. Output duty is defined by the VVT control table so that value on the map is directly the VVT output duty. VVT output has 0.5% duty accurasy and the usable frequency range is 10-510Hz

### Closed loop PWM

Closed loop PWM mode also uses Pulse Width Modulation for VVT output to adjust the cam timing. But in this mode the VVT control table is used as cam angle target table. VVT control algorithm uses PID loop to keep the cam angle at the target value using the VVT output duty. Setting up the closed loop VVT is way more in depth than On/Off or Open Loop modes. But yeilds to better cam control if the engine supports this kind of VVT mode.

> **Note:** Currently Closed loop VVT control is experimental feature and it only works for Miata, Missing tooth and ST170 trigger patterns.{.is-info}

## Settings

![vvt.png](/vvt.png){.align-center}

## VVT duty cycle

![vvt_cntrl_table.png](/img/accessories/vvt_cntrl_table.png){.align-center}

The VVT control table function varies depending on whether on/off, open or closed loop VVT mode has been selected. 

- In On/Off mode, 1000 is taken as "output on" and any other values represents "output off". Values 0 and 100 are recommended to use in this mode.
- In open loop mode, the map values are the duty cycle percents that will be used
- In closed loop mode, this map serves as a target table.
