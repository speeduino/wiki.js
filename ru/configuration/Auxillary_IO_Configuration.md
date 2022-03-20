---
title: Конфигурация вспомогательных вводов-выводов
description: 
published: true
date: 2021-01-02T18:36:40.052Z
tags: 
editor: undefined
dateCreated: 2021-01-02T04:21:13.651Z
---

# Конфигурация вспомогательных вводов-выводов Auxillary IO Configuration

Speeduino также поддерживает считывание до 16 дополнительных входных каналов. Эти входы могут быть либо аналоговыми, либо цифровыми контактами на Mega2560 (или других используемых mcu), либо от удаленного устройства передачи данных (например, DxControl GPIO) через вторичный последовательный порт или интерфейс Canbus (если имеется).

Канал данных, сконфигурированный здесь, будет иметь необработанные данные, доступные в TunerStudio в качестве датчика, и также будет регистрироваться.

## How to Use

The configuration is mainly split into two categories,

-   **Local MCU Pin** - [How to Configure to use a Local MCU pin](#How_to_Configure_to_use_a_Local_MCU_pin "wikilink")
-   **External Data Source** - [How to Configure to use a External Data Source](#How_to_Configure_to_use_a_External_Data_Source "wikilink")

### How to Configure to use a Local MCU pin

The configuration page is accessed from the Accessories drop down within TunerStudio ,select the "local Auxillary input channel configuration" option ![](Auxindrop_nocan.jpg "fig:Auxindrop_nocan.jpg")

This window will be opened. ![](Auxin_config.jpg "fig:Auxin_config.jpg")

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

To use the Auxillary input channels for external data the Secondary IO must be enabled. [See here for further information on how to do this.](Secondary_Serial_IO_interface#Enable_Secondary_IO_interface "wikilink")

The configuration page is accessed from the Accessories drop down within TunerStudio ,select the "External Auxillary input channel configuration" option ![](Auxindrop_withcan.jpg "fig:Auxindrop_withcan.jpg")

This window will be opened. ![](ExtAuxin_config2.jpg "fig:ExtAuxin_config2.jpg")

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