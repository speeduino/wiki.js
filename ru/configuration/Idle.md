---
title: Idle
description: 
published: true
date: 2021-01-02T04:32:55.051Z
tags: 
editor: markdown
dateCreated: 2021-01-02T04:32:55.051Z
---

# Idle Control
## Overview
The idle control outputs are used to alter the state of an idle control valve to increase the amount of air entering the engine at idle. These come in multiple types (Described below) and each is configured and tuned differently. 

Open and closed loop idle control is available for both PWM and Stepper based idle valves. 

## Compatible Idle Valve Types

There are currently 3 modes of idle control available, using on/off, PWM duty cycle, or a stepper step count, enabled below a set coolant temperature. These modes cover the most common types of idle mechanisms in use. 

### On/Off (aka Fast Idle)

This is a simple digital on/off "switch" output by Speeduino that triggers at a selected temperature. It is intended to control an on/off fast idle valve as found in many older OEM setups, or an open/closed solenoid-type valve that is chosen for the purpose. In addition to OEM idle valves, examples of valves popular for re-purposing as on/off idle valves are larger vacuum, breather, or purge valves, and even fuel valves. Idle speed adjustment is generally set only once, with an in-line adjustable or fixed restrictor, pinch clamp, or other simple flow-control method.

<center>
<img src="http://i.imgur.com/yu5YIbY.png" width="150px" />

<img src="http://i.imgur.com/rAYzaop.png?1" width="150px" />

<img src="http://i.imgur.com/wUvNNwm.png?1" width="150px" />
</center>

*Note: On/Off valves can be used in many ways to increase or decrease air flow for various idle purposes in-addition to warm-up. Examples are use as dashpot valves to reduce deceleration stalling, idle speed recovery for maintaining engine speed with accessory loads such as air conditioning, or air addition for specific purposes such as turbo anti-lag air control. See [Generic Outputs](Generic_Outputs "wikilink") for control information.*

### PWM

While similar in construction to many solenoid on/off valves; [PWM](https://www.arduino.cc/en/Tutorial/PWM) idle valves are designed to vary the opening, and therefore flow through the valve, by PWM valve positioning.

These valves are opened and closed by varying the duty cycle of signal sent to them. 

> **Note:** As a fail-safe, some PWM idle valves default to a partially-open state when they are disconnected or are receiving 0% duty cycle. They will close then re-open with increasing PWM DC%, so be sure to research or test your valve type for proper operation.
{.is-info}


#### PWM Settings

Settings in TunerStudio include selecting PWM idle control, temperature and DC settings for warmup, and PWM DC during cranking under the following selections:

![Example PWM idle settings](/img/idle/pwm_menu.png){.align-center width=350}

The '*Idle - PWM Duty Cycle*' and '*Idle - PWM Cranking Duty Cycle*' options will only be available when '*PWM Open Loop*' is selected in the Idle Control options

Under Idle control type, PWM is selected:

![Example PWM idle settings](/img/idle/pwm_settings.png){.align-center width=400}

The temperature-versus-DC is selected under the Idle - PWM Duty Cycle selection. Note the relationship between temperature and PWM DC can be altered by simply moving the blue dots in the curve, or by selecting the table for manual entry as shown here:

![Example PWM idle curve](/img/idle/pwm_curve.png){.align-center width=400}

Some engines prefer additional airflow during cranking for a reliable start. This air can be automatically added only during cranking by using the Idle - PWM Cranking Duty Cycle settings. Once the engine starts and rpm rise above the set maximum cranking rpm, the idle control switches to the previous warmup settings. Note the relationship between coolant temperature during cranking and PWM DC can be altered by simply moving the blue dots in the curve, or by selecting the table for manual entry as shown here:

![Example PWM cranking curve](/img/idle/pwm_cranking_curve.png){.align-center width=400}

> ***NOTE:** Every engine, valve type and tune is different. Suitable settings must be determined by the tuner. Do not infer any tuning settings from the images in this wiki. They are only examples.*
{.is-warning}

##### 2 wire vs 3 wire valves

Both 2 and 3 wire PWM idle controllers are supported. In general, the 3 wire models will provide a smoother response than the 2 wire ones, but the difference is not always significant. For 3 wire valves, 2 of the Aux outputs will be required.

<center>
<img src="http://i.imgur.com/QfDesZC.png" width="150px" />
</center>

### Stepper Motors

Stepper motor idle controls are very common on GM and other OEM setups. These motors typically have 4 wires (bi-polar). They must be driven through power transistors or a driver module, such as the [DRV8825 stepper motor driver](https://www.pololu.com/product/2133) optional to the v0.4 board. These driver modules can be purchased inexpensively from a variety of vendors on sites such as eBay, Amazon, etc.

Most stepper idle valves function by turning a threaded rod in and out of the valve body in a series of partial-turn steps, increasing or decreasing airflow around the plunger (on end of valve below), and into the engine. The idle airflow bypasses the primary throttle body:

<center><img src="http://i.imgur.com/ZAhTLrs.png" width="150px" /></center>

Example of a generic DRV8825 driver module on a v0.4 board:

<center><img src="http://i.imgur.com/nHMXFNK.png" width="150px" /></center>

Note the board is mounted at a standoff for air circulation and cooling:

<center><img src="http://i.imgur.com/L65i6z1.png" width="150px" /></center>

The DRV8825 motor outputs are labeled as A2-A1-B1-B2, and the wiring connection examples are to this labeling. Check your schematics for the output connections that route to these DRV8825 outputs:

<center><img src="http://efistuff.orgfree.com/images/DRV8825_Motor_Wiring.png" width="150px" /></center>

Examples of wiring to the DRV8825 driver:

<center><img src="http://efistuff.orgfree.com/images/IAC_DSM_95-99.png" width="150px" /></center>

The GM "screw-in" style used 1982 to 2003 on many models:

<center><img src="http://efistuff.orgfree.com/images/IAC_GM_82-03.png" width="150px" /></center>

#### Stepper Driver Current Adjustment

The DRV8825 stepper driver module includes a potentiometer (adjustable resistor) indicated by the yellow arrow in the image below. The potentiometer is used for setting the driver's maximum current output limit. Because Speeduino uses full-step operation, the current limit is not critical to protect the module, but should be adjusted to the module's maximum value for best operation of most automotive stepper IACs.

<center><img src="http://i.imgur.com/1U3IQgF.jpg" width="150px" /></center>

You will need a multi-meter or volt-meter to make the adjustment as outlined here. In order to set the potentiometer to maximum current before first use, ensure power to the module is OFF, then gently turn the potentiometer dial clockwise to the internal limit. **Do not force the adjustment beyond the internal stop.** Power-up Speeduino with 12V, and use the meter to test the voltage between the center of the potentiometer and any 12V ground point. Note the voltage reading. Power-down and repeat the test, this time turning the potentiometer counter/anti-clockwise gently to the internal limit. The test direction that resulted in higher voltage is the correct setting for the module.

*Note: Original Pololu modules are typically adjusted clockwise for maximum voltage. However, clone modules may be either clockwise or counter-clockwise, which makes this testing necessary.*

The module's rated *continuous* current is up to 1.5A. While the module can supply a peak of 2.2A of current; in full-step mode and with the potentiometer adjusted to this position, the driver is limited to approximately 70% of full current, or approximately 1.5A.

#### Stepper Settings

Settings in TunerStudio include selecting stepper idle control, temperature and step settings for warmup, and open steps during cranking under the following selections:

<center>
<img src="http://i.imgur.com/hC15oxv.png" width="450px" />
</center>

Under Idle control type, stepper is selected. The basic stepper operational settings are also located in this window:

![Stepper idle settings](/img/idle/stepper.png){.align-center width=350}

* **Step time:** This is how long (in ms) that the motor requires to complete each step. If this is set too low, the idle motor will not have completed the step before the ECU tries to make the next one, which leads to the motor 'twitching' and not functioning correctly. If this is set longer than needed the system will take longer to make each adjustment and the overall idle response will be slower. Typical values are usually 2ms - 4ms. The common GM stepper motor requires 3ms.
* **Cool time:** Some motors require a slight pause in between steps in order to function correctly. This is know as the 'cooling' time. Typically this value will be less than 4ms at the most, with many motors operating normally with no cooling period (0ms)
* **Home Steps:** Stepper motors must be 'homed' before they can be used so the that ECU knows their current position. You should set this to the maximum number of steps that the motor can move.
* **Minimum steps:** In order to allow a smooth idle that isn't continually fluctuating, the ECU will only move the motor if at least this many steps are required. Typical values are in the 2-6 range, however if you have a noisy coolant signal line, this value may need to be increased.
* **Don't exceed:** In order to prevent the stepper motor attempting to move beyond it's maximum range, this is a limit placed on the total number of steps that will be made. The value in this field must always be lower than the number of homing steps

The temperature-versus-steps is selected under the Idle - Stepper Motor selection. Note the relationship between temperature and motor steps can be altered by simply moving the blue dots in the curve, or by selecting the table for manual entry as shown here:

![Example stepper idle curve](/img/idle/stepper_curve.png){.align-center width=400}

Some engines prefer additional airflow during cranking for a reliable start. This air can be automatically added only during cranking by using the Idle - Stepper Motor Cranking settings. Once the engine starts and rpm rise above the set maximum idle rpm, the idle control switches to the previous warmup settings. Note the relationship between coolant temperature during cranking and motor steps can be altered by simply moving the blue dots in the curve, or by selecting the table for manual entry as shown here:

![Example cranking stepper curve](/img/idle/stepper_curve_cranking.png){.align-center width=400}

> ***NOTE:** Every engine, valve type and tune is different. Suitable settings must be determined by the tuner. Do not infer any tuning settings from the images in this wiki. They are only random examples.*
{.is-info}


***NOTE:** Refer to the [Pololu video](https://www.pololu.com/product/2133/faqs) for instructions to set the DRV8825 driver current level to maximum for most automotive full-step stepper motors.*

#### Examples

| Motor      | Step time | Home steps |
|------------|-----------|------------|
| GM 4-wire  | 3         | 250        |
| DSM 4-wire | 4         | 270-320    |

***NOTE:** While normal DSM stepper function is seen at room temperatures at 3ms, step skipping occurs just under that speed. Very cold temperatures may cause skipping, thus the recommendation of 4ms. Test for the most suitable speeds for your setup.*

### Stand-Alone (Non-Electronic)

While not an idle control mode, Speeduino is compatible with stand-alone idle valves that are self-controlling. Examples of this are thermal wax or bi-metal spring idle or auxiliary air valves like the one below. Internally expanding and contracting material opens and closes air valves, providing increased air flow and engine rpm when cold for warmup. Speeduino functions to enrich the cold engine and adjust for the additional air, in the same way it would if you opened the throttle slightly.

<center><img src="http://i.imgur.com/I9Wc9p2.png" width="150px" /></center>

Other examples of stand-alone valves are simple On/Off valves as shown in the next section, controlled by inexpensive thermal switches like these:

<center><img src="http://i.imgur.com/YImLboR.png" width="150px" /> <img src="http://i.imgur.com/nHEt5a5.png" width="150px" /> <img src="http://i.imgur.com/E13Z9Op.png" width="150px" /></center>

## Closed Loop Control

Closed loop idle control operates by setting RPM targets rather than configuring the duty cycle or steps directly. A PID algorithm is used and can be tuned to match the valve/motor that you are using. 

### Closed loop settings

### Closed loop targets