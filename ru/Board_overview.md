---
title: Обзор плат 03 и 04
description: 
published: true
date: 2021-01-02T07:42:01.413Z
tags: 
editor: undefined
dateCreated: 2021-01-02T07:41:55.570Z
---

**THIS PAGE IS A WORK IN PROGRESS. FURTHER DETAILS TO COME!**

There are currently 2 families of Speeduino boards available, the v0.3 line and the v0.4 line. These boards were designed to fit 2 different use cases and serve different purposes. The v0.4 line of boards is not necessarily newer/better than the v0.3, the 2 share largely the same features and capabilities. The differences are in how these are intended to be used.

As a very rough indication, the v0.3 line is best suited for retrofitting of fuel injection. The screw terminals make it simpler to connected to a bare wiring loom The v0.4 boards are intended primarily to replace OEM ECUs and hence are designed to be simpler for connector with existing connectors

Feature Compare
===============

|                           | v0.3                                  | V0.4                                                   |
|---------------------------|---------------------------------------|--------------------------------------------------------|
| Board Dimensions          | 13.8cm X 10cm                         | 10cm X 10cm                                            |
| Injector Channels         | 4                                     | 4                                                      |
| Ignition Channels         | 4                                     | 4                                                      |
| Connectors                | Screw terminals                       | Single IDC40 (IDE) Connector Screw terminals for power |
| Analog Inputs (Protected) | TPS, Coolant, Inlet Air Temp, O2, MAP |
| Other outputs             | 4 high current low side drivers       |
| Stepper board socket      | N                                     | Y                                                      |
| I2C (Proto area)          | Y                                     | Y                                                      |
| SPI (Proto area)          | Y                                     | N                                                      |
|                           |                                       |                                                        |

