---
title: NO2C_for_Speeduino
description: 
published: true
date: 2021-11-17T11:48:03.837Z
tags: 
editor: undefined
dateCreated: 2020-01-06T01:53:35.241Z
---

The No Overhang Two Channel boards made for Speeduino share the features below
------------------------------------------------------------------------------

-   Arduino MEGA 2560 shield board
-   Same size as the Arduino
-   2 injector output channels
-   2 coil output channels
-   Dedicated tachometer output
-   4 medium/high current outputs (idle, boost, VVT, fuel pump, fan, etc)
-   IAT, CLT, TPS, and O2 inputs (protected)
-   On-board MAP sensor
-   Stepper idle control through board mounted DRV8825 accessory PCB
-   VR conditioning through board mounted VR conditioner accessory PCB

Like the official Speeduino boards, the NO2C requires igniter driven coils and a conditioner for crank/cam signals that aren't 5v square-wave. The board is designed to accept the official Speeduino conditioner board for signals that do not meet the requirements.

NO2C v0.1.x
-----------

Uses the AMP MTA-100 or Molex KK100/KK254 connector system and through hole components

### v0.1.0

-   Had flaws which caused the Arduino USB connector to interfere with the boards solder pads
-   lacked tachometer output
-   was never released

### v0.1.1

-   corrected the issue mentioned above
-   added tachometer output

NO2C v0.2.x
-----------

Uses the Molex Micro-Fit 3.0 connector system and through hole components. The Micro-Fit connector is used as a computer power connector and there are several manufacturers, it's known generically as 3mm connector.

For some tips that will help make the assembly of your board a success: **[v0.2.x Assembly Tips](/en/boards/3rd_party/wtmtronics/V02x_Assembly_Tips "wikilink")**

### v0.2.0

-   Added pass through pinholes around the edge for daughter board expansion
-   Increased size of resistor footprints making it easier to find usable resistors and/or use precision resistors for all voltage dividers
-   Increased pitch of 1uf caps (see above)
-   Added launch control input

### v0.2.1

-   Improved silk screen
-   All MOSFET outputs (injector and auxiliary) have the same gate connection to the Arduino MEGA
-   VR signals are routed straight into the conditioner
-   MAP sensor location accepts either though-hole or SMD part
-   Other routing and placement adjustments (R10 and R11 are flipped)

### v0.2.2

-   Moved C20 from the edge of the board, it has always bothered me there
-   Added Serial0/Bluetooth header
-   Other routing and placement adjustments

### vC1

-   Traditional reset protection removed in favor of a jumper and resistor to hold the reset pin high
-   Routing and placement adjustments
-   Version style changed to bring inline with other projects and due to required BOM change compared to v0.2.x

NO2C DB
-------

A daughter board that stacks on top of the NO2C v0.2.x and vCx boards to add the features below. The daughter boards are hybrid surface mount/through hole, see features below for which parts are through hole.

### DB1 (Scraped)

Makes it easy to add additional general outputs, and can be populated to add all the features below.

-   4 low current outputs (through hole)
-   2 general digital inputs (protected)
-   1 analog input (protected)
-   Flex-fuel input (protected)
-   Barometric pressure sensor (provides constant correction vs power on base)

### DB2

Makes it easy to add additional coil outputs, and can be populated to add all the features below.

-   2 additional coil output channels (through hole)
-   4 low current outputs
-   2 general digital inputs (protected)
-   1 analog input (protected)
-   Flex-fuel input (protected)
-   Barometric pressure sensor (provides constant correction vs power on base)

With the low current outputs you could reconfigure two of the medium/high current outputs on the NO2C to act as injector drivers. To do this you will have to make minor changes to the firmware before programming the Arduino.

Links
-------

Board files, BOM and other documentation can be found from [GitHub](https://github.com/turboedge/SpeedyBoards/tree/master/NO2C)