---
title: System Wiring Diagram
description: A high level master system wiring diagram
published: true
date: 2025-07-27T06:15:42.321Z
tags: 
editor: markdown
dateCreated: 2020-01-06T23:29:13.246Z
---

# High level wiring guide

Speeduino can be configured in many ways depending on the engine, sensors, ignition and fuel hardware being used. For this reason it is impossible to provide 1 single diagram that will cover all scenarios, however the below is provided as a high level guide that can be used as a starting point. 

See the [Hardware Requirements](/Hardware_requirements) page for specific requirments and exceptions to the image below.  

![Typical System wiring diagram](/img/wiring/wiring_overview.png){.align-center}

## Best Practice

All Speeduino installations will differ in some aspects and require some level of customisation, however the following should be kept in mind for most setups:

* The ECU should share switched power with all devices that it will control (Injectors, relays, solenoids etc). 
  * **Eg:** An Idle control valve should not ever be be powered when the 12v supply to the ECU is off. This can lead to backfeeding of power to the ECU. 
* Speeduino ECUs are generally not recommended for installation in the engine bay and wiring the ECU into a cabin location is preferred. 
* Consider the wiring path of all sensors (Particularly crank and cam) carefully and avoid running them near any high power devices (HT leads, alternator etc). 
	* Shielded wiring is strongly recommended for crank/cam sensors. 
* Take note of the output current limits for the board you're using. Some outputs will drive valves directly (Eg idle, boost etc) however higher current devices such as fans and fuel pumps will need to go through a relay. 