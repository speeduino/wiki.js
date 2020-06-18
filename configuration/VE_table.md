---
title: Fuel (VE) table / map
description: Configuration of the main fuel / VE table 
published: true
date: 2020-06-18T00:47:09.502Z
tags: tuning, fuel, ve table, fuel table
editor: markdown
---

# Fuel (VE) table

The fuel or VE table is the primary method of controlling the amount of fuel that will be injected at each speed/load point. 

![ve_table.png](/img/tuning/ve_table.png){.align-center width=400}

## Configuration
The fuel map is a 3D, interpolated table that uses RPM and fuel load to lookup the desired VE value. The fuel load axis is determined by whether you are using Speed Density (MAP kPa) or Alpha-N (TPS) for your fuel load (See [Engine_Constants](/en/configuration/Engine_Constants))

The values in this table represent a percentage of the `Required Fuel` amount that will be injected when the engine is at a given speed/load point. 

### Options
- **Multiply VE value by MAP:Baro ratio:** Enabling this option 'flattens' the fuel table by multiplying the value in the current speed/load point by the MAP value divided by the Baro value. You can tune with or without this option enabled, but it is generally recommended to be turned on as it will allow for simpler and more predictable tuning results. 
> **Warning:** Changing this value will required retuning of the fuel map!
{.is-warning}

- **Multiply by ration of AFR to Target AFR:** This option is normally set to `No`



## Secondary Fuel table

![2nd_fuel_table.png](/img/tuning/2nd_fuel_table.png){.align-center width=400}

Speeduino also has the ability to use a secondary fuel table which allows for blended and switched mode fueling. There are 2 blended modes and 2 switched modes available.

Blended fuel modes work in conjunction with the primary fuel table to come up with a single, combined VE. Switched fuel modes are where either the primary or secondary fuel table is used, but not both at the same time. Which table is being used at any given time can be configured based on either an external input (Eg dash switch) or set via certain conditions. 


### Multiplied %


### Added

### Switched - Conditional


### Switched - Input based

