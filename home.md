---
title: Speeduino Manual
description: The Speeduino documentation manual
published: true
date: 2020-01-10T06:08:13.463Z
tags: home
titlepage: true
titlepage-rule-height: 2
titlepage-rule-color: "360049"
titlepage-background: "offline/background1.pdf"
logo: "img/Speeduino logo_med.png"
logo-width: 120
---

# Speeduino Manual
This manual covers the hardware (sensors, wiring etc), software configuration and tuning elements related to running a Speeduino unit. When beginning with Speeduino, particularly if it is your first time installing and configuring an engine management system, this manual will assist in understanding Speeduino's capabilities and how it should be installed, both in terms of hardware and software/firmware.

Whilst this document will assist in providing information related to Speeduino's configuration, it does not cover advanced engine tuning, fuel / ignition strategies etc. As with any changes to engine management, the possibility of damage to hardware is very real should a system be configured incorrectly.

### Getting Started

In terms of starting out with Speeduino, it can help to understand the various compnents that make up the system:
1.   **A Speeduino board** - This is the muscle of the Speeduino ECU and contains all the drivers and IO circuits. This maybe one of the generic boards (Such as the v0.4) or a PNP board for a specific model car
2.   **An Arduino** - This is the brains of Speeduino and contains the processor, memory and storage. It plugs into the Speeduino board in order to interface with the vehicle wiring
3.   **Firmware** - This is the system software that runs on the Arduino board and powers its operation. New firmware is released regularly with updates, performance improvements and bug fixes. 

As a starting point, it is generally recommended to first upload the firmware to your Arduino and get it connecting to the tuning software (Tuner Studio) before moving on to hardware assembly or wiring etc. Software setup and configuration on Speeduino can be completed without the need for any additional hardware to be present (Beyond the arduino itself) and this allows exploration of the software and options available before either an outlay of significant funds or a significant investment of time.

### About this manual

As an open source project, this documentation is growing continually and this means that you may come across gaps in the documentation where little information is currently provided. Please do not hesitate to post on the forum if there is something missing that you need critically (or even not so critically).

Additionally, if you would like to contribute to the Speeduino documentation, we would love to hear from you! The preferred method to request wiki access is either via Slack (https://speeduino.com/forum/app.php/page/slack)
