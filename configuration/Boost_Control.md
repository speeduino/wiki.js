---
title: Boost Control
description: Open and closed loop boost control settings
published: true
date: 2023-07-12T23:50:49.176Z
tags: 
editor: markdown
dateCreated: 2020-01-06T01:53:51.415Z
---

# Boost Control

Speeduino has an on board closed loop boost controller than can be used to regulate standard single turbo setups.

Most 3 or 4 port boost solenoids can be used, with frequencies between 15Hz and 500Hz supported. Any of the on board high current outputs can be directly connected to the solenoid and is controlled via a boost target table and PID tuning. Over boost limiting is also available.

## Settings

Speeduino's boost control uses a PID algorithm with 2 modes of operation, Simple and Full. Each has their own advantages and disadvantages, as outlined below

![boost_settings.png](/img/accessories/boost_settings.png){.align-center width=400}

In Simple mode, the PID values themselves are controlled by the ECU itself and a sensitivity slider is used to adjust how aggressive the output duty cycle will be set. The simple mode can be easy and fast to setup, however has the downside that to avoid overboost, the sensitivity may need to be set low, which can increase lag.

### Boost Cut

Boost Cut is a safety setting that will cut engine cycles (fuel, spark or both) if the boost level exceeds a certain figure. 

## Target table

![Example boost map](/img/accessories/boost_map.png){.align-center width=450}

The boost map function varies depending on whether open or closed loop boost control has been selected. 

- In closed loop mode, this map serves as a target table. The values in the map are the desired boost pressures (in kPa). In closed loop mode, these target values can optionally be modified by a flex fuel value if available. 
- In open loop mode, the map values are the duty cycle percents that will be used
