---
title: Injector wiring
description: Wiring description and diagrams for fuel injectors
published: true
date: 2020-01-24T06:29:26.450Z
tags: wiring
---

# Injector wiring
## Overview
Speeduino contains 4 injector control circuits and is capable of supporting up to 8 injectors (and cylinders) with these.

## Supported Injectors
Speeduino supports High-Z (aka 'high-impedance' or 'saturated') injectors natively. Low-Z injectors are supported with the addition of resistors wired in series with the signal wires. High-Z injectors are typically those with a resistance greater than 8 Ohms.

If "Low-Z" ("peak and hold" or PWM-controlled) injectors that are lower impedance are used, the wiring will require series resistors on each injector to avoid damaging the board with excessive current. The resistor ohms and watt rating can be calculated by Ohm's Law, or use an Internet calculator page such as the [Speeduino Injector Resistor Calculator](http://efistuff.orgfree.com/InjectorResistorCalculator.html).

## Layouts
There are a number of ways that the injectors can be wired depending on your configuration and preference.

### 1, 2 and 3 injectors

For these configurations, each injector is wired into it's own output from the Speeduino board.

### 4 injectors

For 4 cylinders/injectors, there are 2 ways that these can be connected to Speeduino:

#### Method 1 (Semi-sequential)

The standard method is the same as that used for 6 or 8 cylinder setups, where 2 injectors are connected to each injector channel. In this configuration, only 2 injector channels will be used. The injectors paired together must have their Top Dead Centres (TDC) 360 crank degrees apart.

![inj_4Cyl_semi-seq.png](/img/wiring/inj_4Cyl_semi-seq.png){.align-center width=450}

#### Method 2 (Full sequential)

This method is only available on 4 cylinder / 4 injector applications and allows you to wire 1 injector per channel. The injector channels always fire in numerical order (ie 1, 2, 3, 4) so your injectors should be wired to take your firing order into account. Within Tuner Studio, this option can be enabled by selecting:

`Settings -> Engine Constants -> Injector Timing -> Semi-Sequential`

![inj_4Cyl_seq.png](/img/wiring/inj_4Cyl_seq.png){.align-center width=450}

### 5 injectors

5 cylinder setups should be wired to use all 4 injector outputs with 2 injectors sharing output \#3. For the typical inline 5 cylinder firing order (1-2-4-5-3), injectors 4 and 3 would be joined together on injector 3 output.

### More than 5 injectors

For setups with more than 4 injectors, the number of outputs used will be equal to half the number of injectors.

#### 6 Cylinder
![inj_6Cyl_semi-seq.png](/img/wiring/inj_6Cyl_semi-seq.png){.align-center width=450}

#### 8 Cylinder
![inj_8Cyl_semi-seq.png](/img/wiring/inj_8Cyl_semi-seq.png){.align-center width=450}

Inline with the above, this configuration requires each injector output to be connected to 2 injectors.
The injectors should be grouped in opposing pairs, that is, cylinders whose Top Dead Centres are 360 degrees apart.