---
title: Analog sensor wiring
description: 
published: true
date: 2025-07-27T06:31:40.040Z
tags: sensors, wiring
editor: markdown
dateCreated: 2020-01-14T13:44:54.097Z
---

# Analog Sensor Wiring
Analog sensors provide data such as temperatures, throttle position and O2 readings to the ECU. The diagram below shows the typical wiring for these sensors. 

![Typical analog sensor wiring](/img/wiring/analog_sensors.png){.align-center width=500}

### Notes
* Use of 2 wire temperature sensors is **highly** recommended. Whilst 1 wire sensors will work, they are almost always considerably less accurate. Running a dedicated ground wire back to the ECU from the sensor is also recomended.
* The external MAP sensor in the above diagram is optional and may be omitted if the onboard MAP is used. Alternatively an external Baro sensor may be added in the same was as an external MAP
* A 3 wire variable TPS is required. On/Off type throttle switches are not suitable