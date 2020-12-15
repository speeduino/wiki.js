---
title: CanBus Support2
description: 
published: true
date: 2020-12-15T21:58:51.731Z
tags: 
editor: markdown
dateCreated: 2020-12-15T21:58:51.731Z
---

Overview
--------

Speeduino is able to support Canbus in two ways.

1. Use a Mega2560 MCU with a coprocessor board
2. Use a Teensy or STM32 (with internal can module) MCU.

##### About the CanBus Interface
The Canbus Interface offers ,

  1. OBD2 formatted data of current realtime data .
  2. Broadcast selected current realtime data and function status .(coming soon)
  3. Read in Analog and Digital data values from other devices on the BUS including those from OEM devices/ECU.(coming soon)

Settings
--------

### Enable CanBus interface

To enable use of the Canbus interface it must be enabled in TunerStudio.




## OBD2 Data Support

When used with an MCU that has an Internal canbus interface Speeduino firmware is able to output data using the OBD2 std 

Speeduino does not offer “readiness monitoring” or emission testing support and should not be used for such.

### OBD Port Interface Configuration 

The Interface supports 11bit addressing @500kbps data rate.
The port will respond to the STD OBD2 protocol .
Any code reader /app /software following OBD2 standard protocol is able to access the data described below.
The Teensy3.5 uses pins xxx for connection to the can transceiver.
The STM32 uses pins xxx for connection to the can transceiver.

### OBD Port Interface Support Options

The OBD2 port Inteface offers support for ,

   1. To output the current realtime data ([see supported PID list](CanBus_Support2#PID_supported "wikilink")) . 
   2. Output the Analog/Digital data values from the 16 Aux inputs ([see here for info on aux data input configuration](/en/configuration/Auxillary_IO_Configuration))
   3. Activate External Outputs(coming soon!)

### PID supported

The following PIDs are supports by by the OBD port

  


 







