---
title: Auxillary IO Configuration
description: 
published: true
date: 2021-11-17T12:02:01.896Z
tags: 
editor: undefined
dateCreated: 2020-01-06T01:53:50.218Z
---

# Auxillary IO Configuration

Speeduino also supports the reading of up to 16 additional input channels. These inputs can be either Analog or Digital Pins on the Mega2560(or other mcu in use) or from a remote data aquistion device (such as The DxControl GPIO for instance) via the secondary serial port or the Canbus interface(if available).

A data channel configured here will have the raw data avilable in TunerStudio as a Gauge and will also be loggable too.

## How to Use

The configuration is mainly split into two categories,

-   **Local MCU Pin** - [How to Configure to use a Local MCU pin](#How_to_Configure_to_use_a_Local_MCU_pin "wikilink")
-   **External Data Source** - [How to Configure to use a External Data Source](#How_to_Configure_to_use_a_External_Data_Source "wikilink")

### How to Configure to use a Local MCU pin

The configuration page is accessed from the Accessories drop down within TunerStudio ,select the "local Auxillary input channel configuration" option 

![accdrop_nocan.jpg](/img/TunerStudio/accdrop_nocan.jpg)

This window will be opened. 

![auxin_config.jpg](/img/TunerStudio/auxin_config.jpg "fig:auxin_config.jpg")!

In the above image the first two channels have been configured as an local analog and a local digital input respectively.

-   **Input Alias** - This is a user defined Alias name (up to 20 characters) for the input channel
-   **Aux Input Channel Enable** - This Enables/Disables the input channel
-   **PIN** - Is the pin selected(only for local options)

#### Input Alias

The input alias can be any ascii character name the user wishes up to 20 characters long. This can also be left as the default .

#### Aux input Channel Enable

Options here are

-   **OFF** - Channel is disabled
-   **EXT/CAN** - The channel is assigned to an external data source

(this option is only visible if CAN_COMMANDS is enabled in project properties.[See here for further information](#How_to_Configure_to_use_a_External_Data_Source "wikilink")

-   **Local_analog** - Select a local analog mcu pin
-   **Local_Digital** - Select a local digital mcu Pin

#### PIN

This setting is only available for local mcu pin selections. It is the actual mcu pin name.

### How to Configure to use a External Data Source

To use the Auxillary input channels for external data the Secondary IO must be enabled. [See here for further information on how to do this.](https://wiki.speeduino.com/en/Secondary_Serial_IO_interface)

The configuration page is accessed from the Accessories drop down within TunerStudio ,select the "External Auxillary input channel configuration" option 

![accdrop_nocan.jpg](/img/TunerStudio/accdrop_nocan.jpg)

This window will be opened. 

![extauxin_config_nocan.jpg](/img/TunerStudio/extauxin_config_nocan.jpg)
![](ExtAuxin_config2.jpg "fig:ExtAuxin_config2.jpg")

For External data inputs to be active the "Enable External Data Input" option must be enabled.

In the above image the first three channels have been configured as an local analog and a local digital input and a External input respectively.

-   **Input Alias** - This is a user defined Alias name (up to 20 characters) for the input channel
-   **External Aux Input Channel Enable** - This Enables/Disables the input channel
-   **Source CAN Address** - Is Real Can address of the source device
-   **Source Data Start Byte** - Is the first byte ( of the 8bytes in a canbus command) where the data can be found
-   **Input Parameter Number of Bytes** - Is the number of bytes the data is stored in(lsb first)

#### Input Alias

The input alias can be any ascii character name the user wishes up to 20 characters long. This can also be left as the default .

#### External Aux input Channel Enable

Options here are

-   **OFF** - Channel is disabled
-   **EXT/CAN** - The channel is assigned to an external data source
-   **Local_analog** - Select a local analog mcu pin
-   **Local_Digital** - Select a local digital mcu Pin

#### Source CAN Address

This is the Hex address of the remote Device

#### Source Data Start Byte

A can data command has up to 8 bytes. This value sets the first data byte the data value begins at.

#### Input Parameter Number of Bytes

The data byte can be made from a single byte or two (word or 16bit value)