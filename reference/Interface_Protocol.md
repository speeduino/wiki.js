---
title: Interface Protocols
description: 
published: true
date: 2021-07-29T18:45:18.652Z
tags: 
editor: markdown
dateCreated: 2021-07-29T18:45:18.652Z
---

# Interface Protocols
> This information is intended for Advanced users ,a typical user does not need to have an understanding of the protocols used by the Interfaces in order to use Speeduino.
{.is-warning}


Speeduino can be interfaced to via  several ways.
1. USB
2. Secondary Serial
3. Canbus (MCU dependant)

## 1. USB
This is the primary interface and the way in which TunerStudio connects to Speeduino in order to program/configure its settings.

## 2. Secondary Serial
The Secondary Serial interface enables an external device to access data from Speeduino or to expand the io of the Speeduino ECU. 
A full explanation of the features and operation of secondary serial can be found here. [Secondary_Serial_IO_interface](/en/Secondary_Serial_IO_interface)

## 3. CanBus
Canbus is only available directly on Teensy and STM32 MCU based Speeduino. Mega2560 based units need additional hardware such as DxControl GPIO .  
A full explanation of the features and operation of secondary serial can be found here.
[Canbus_Support](/en/Canbus_Support2)