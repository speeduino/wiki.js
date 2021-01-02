---
title: Nitrous Control
description: 
published: true
date: 2021-01-02T04:38:25.145Z
tags: 
editor: markdown
dateCreated: 2021-01-02T04:38:25.145Z
---

# Nitrous Control
Speeduino contains a 2 step nitrous control system for controlling valves and making fueling adjustments for dry setups. 
The 2 stages operate independantly and can overlap (ie both run at the same time) if needed. 

![nitrous_settings.png](/img/accessories/nitrous_settings.png){.align-center width=450}

## Activation Settings
- **Nitrous Mode:** Whether 1 or 2 stages will be used
- **Arming Pin:** The Arduino Pin to be used for arming the nitrous control. 
- **Arming pin polarity:** What pin state is considerd to be armed. Generally this will be LOW for a ground switching input
- **Minimum CLT:** The minimum coolant temperature that the stages will activate at
- **Minimum TPS:** The minimum TPS that the stage will activate at
- **Maximum MAP:** A protection to ensure that the nitrous will not activate above a certain level of boost
- **Leanest AFR:** Nitrous will only activate if the AFR is (And remains) below this value

## Stage Settings

The settings for each stage are identical and allow for the 2 stages to run individually or joinly overlapping during a given RPM window. 

- **Nitrous output Pin:** The (Arduino) pin that will be driven high when the stage is active. 
- **Minimum Engage RPM:** The RPM at which the stage will begin
- **Maximum Engage RPM:** The RPM at which the stage ends
- **Fuel adder @ Min/Max RPM:** The amount of fuel to be added at the minimum and maximum RPM points. 
  - The fuel adder amount will be scaled between these 2 values as the RPMs rise
  - A calculator for these fuel adder values can be found at: https://bit.ly/3a0e9WU
- **Ignition retard when active:** An ignition modifier to be used to retard timing when the stage is active
	- Note that the retard values are cumulative. If both stages are active then the total retard amount will be the sum of both stages. 