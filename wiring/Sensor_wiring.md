---
title: Analog sensor wiring
description: 
published: true
date: 2020-04-24T17:53:41.069Z
tags: 
editor: undefined
dateCreated: 2020-01-14T13:44:54.097Z
---

# Analog Sensor Wiring
Analog sensors provide data such as temperatures, throttle position and O2 readings to the ECU. The diagram below shows the typical wiring for these sensors. 

![analog_sensors.png](/img/wiring/analog_sensors.png){.align-center width=500}

### Notes
* Use of 2 wire temperature sensors is **highly** recommended. Whilst 1 wire sensors will work, they are almost always considerably less accurate. Running a dedicated ground wire back to the ECU from the sensor is also recomended.
* The external MAP sensor in the above diagram is optional and may be omitted if the onboard MAP is used. Alternatively an external Baro sensor may be added in the same was as an external MAP
  * There are a few benefits to using the onboard MAP sensor:
    * Its calibration is already set up for Speeduino boards
    * Some cars already run a vacuum line to the ECU
    * No need to worry about signal interference
  * An external MAP can provide benefits as well:
    * Some cars come with a MAP sensor already attached to the intake
    * Less worry about kinking / leaking vacuum line
    * Many existing MAP sensors are mounted directly to the intake manifold
* A 3 wire variable TPS is required. On/Off type throttle switches are not suitable
