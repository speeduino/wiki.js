---
title: GearControl_for_Speeduino
description: 
published: true
date: 2020-04-08T02:06:07.657Z
tags: 
editor: undefined
dateCreated: 2020-01-06T01:37:13.632Z
---

Dxcontrol-Gears , A Gearbox Controller for Speeduino
====================================================

By Darren Siepka

### What is it ?

dxControl-Gears is a controller for electronically controlled Automatic gearboxes , designed to accompany Speeduino. It is a custom development of the dxControl-GPIO code .

It supports up to 32 output channels to drive solenoids and valve , 16 digital input channels ,8 analog input channels.

Future releases will have pwm input and output capability along with direct or Canbus connectivity to the Speeduino ECU.

### Gearbox Configurations Available

1. A340E

2. AODE (coming soon)

3. 5R55s (coming soon)

4. TBA... Yours?

#### The A340E

The A340E made by Aisin Warner can be found in numerous vehicles including mitsubishi and Lexus.

It has Two shift solenoids and electric convertor lockup.

The solenoid to gearselection pattern is

`               Solenoid 1       Solenoid 2`
` Gear 1             on               off`
` Gear 2             on               on`
` Gear 3             off              on`
` Gear 4             off              off`

#### The AODE

#### The 5R55s

### Input Hardware Testing

### Output Hardware Testing