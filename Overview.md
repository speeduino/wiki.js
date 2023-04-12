---
title: Overview
description: 
published: true
date: 2022-10-15T13:42:31.360Z
tags: 
editor: undefined
dateCreated: 2020-01-06T01:37:18.780Z
---

So what's the go?
-----------------

The Speeduino project aims to create a fully featured, totally open source (Hardware and firmware) Engine Management System (EMS) / Engine Control Unit (ECU) on top of the [| Arduino Mega](http://arduino.cc/en/Main/arduinoBoardMega2560) platform. In order of priority the specific aims are:

-   Low barrier to entry (ie price and availability of hardware, clear, well documented code, easily accessible software development etc)
-   Capabilities / Features
-   Simplicity of development

In short, the main goal is to be in all places as simple as possible. No weird build environments, no knowledge of assembly needed, favour simplicity over performance where needed and make as low a barrier to entry as can possibly be achieved. Both the hardware and software/firmware sides of the system are covered with all being covered under open licenses.

Current Feature List
--------------------

What you will get is flexible and configurable fuel and ignition management that will work for the majority of every day type setups. Currently supported features include:

-   16x16 3D fuel and ignition maps, with base of either TPS (Alpha-N) or MAP (Speed Density)
-   Supports up to 8 cylinders fuel and ignition with 4 channels of fuel and 4 channels of ignition outputs
    -   1, 2 (Even fire only), 3 and 4 cylinder engines with full sequential fuel and ignition
    -   6 (even fire only) and 8 cylinder engines are supported with wasted spark and 2 squirts per cycle
-   6x6 3D individual cylinder trim on engines up to 4 cylinders
-   After Start Enrichment
-   Rev limiting (Spark based, hard and soft)
-   Cranking specific enrichment, dwell timing and advance
-   General logging through TunerStudio
-   High speed tooth logging
-   TPS calibration through TunerStudio
-   Sensor calibration through TunerStudio (Coolant, IAT and O2)
-   Warm Up Enrichment (WUE)
-   TPS based acceleration enrichment
-   Tacho output
-   Fuel pump activation/deactivation (With priming)
-   Over dwell and over duty protection
-   Battery voltage compensation for dwell and injectors
-   Modular wheel decoder support. Included decoders:
    -   Missing tooth (Eg 36-1, 60-2 etc)
    -   Dual wheel (Evenly spaced teeth on crank, single tooth on cam)
    -   Basic distributor
    -   GM 7X
    -   GM 24X
    -   4g63 aka 4/2
    -   'Jeep 2000'
    -   Audi 135
    -   Miata 99-05
    -   Honda D17 (12+1)
    -   Nissan 360
    -   Subaru 6/7
    -   Taking requests...
-   Open and closed loop idle control (PWM and Stepper)
-   Closed loop boost control
-   Open loop VVT control
-   Deceleration fuel cut off (DFCO)
-   Launch control
-   Flex fuel
-   O2 based autotune (Registered version of TunerStudio required)
-   WMI control
-   Up to 8 Programmable outputs
