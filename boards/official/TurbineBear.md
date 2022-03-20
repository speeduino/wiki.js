---
title: Turbine Bear
description: 
published: true
date: 2021-09-30T00:27:00.547Z
tags: 
editor: undefined
dateCreated: 2021-08-25T01:57:06.706Z
---

# Turbine Controller
Blah blah

## Features

Blah

## Board Configuration
The Dropbear board contains 4 switches and 1 DIP switch pair that can be used to change the setup of the ECU. 

### RPM 1/2 (N1/2) inputs
The ECU contains is designed to take 2 hall/optical inputs. 

#### N1 filter
The board includes a variable hardware filter on the N1 input that can be used to adjust the amount of capacitor filtering being used on this signal. This is designated `N1 Filter` on the PCB. 

> Changing this filter from the default setting (On/On) is not required in most cases. It should only be considered if the trigger is utilising 60+ teeth at crank speed. 
{.is-warning}

The switches come with an insulating Kapton seal on them that must be removed before the switches can be adjusted. If not adjusting filter this tape should be left in place. 

![Dropbear crank filter switch](/img/boards/filter_dip.jpg){.align-center width=150}

Recommended values for the filters are shown below (By default both switches will be in the On position):

| Tooth count (at crank speed)  | Switch 1 | Switch 2 |
|-------------------------------|----------|----------|
| Less than 60                  |    On    |    On    |
| 60-100                        |    On    |    Off   |
| 100+                          |    Off   |    On    |

> Both switches can be set to off, however doing so will disable all hardware filtering. This can be useful when performing bench testing with a stim, but is not recommend for real world use
{.is-warning}

## EGT inputs
The v0.2 controller contains a total of 4 EGT circuits, however EGT1 and EGT2 could not be fully populated at PCBA time and should not be used. There are override pins on the Black connector for EGT1 and EGT2 inputs however that allow the use of external thermo amps

EGT 3 and 4 on the Grey connector use digital thermo amps on board. 

An option will be added in TunerStudio to select whether EGT 1/2 or EGT 3/4 should be used. 


## Pin out

The ECU uses 2x 24 pin Delphi Sicma connectors. The connectors are keyed and will only connect to the matching colour loom plug. 

### Black Connector      
![Delphi SICMA Black Connector](/img/boards/Connector_black.png){.align-center width=400}
> Note connector alignment in above image
{.is-info}

| Pin | Direction | Max Current | Purpose | Comment |
|-----|-----------|-------------|---------|---------|
| A1  | Input     | 5A          | Switched 12v      | Main power input. Connect to switched 12v power via 5A fuse        |
| A2  | Input     | 15A         | Power Ground      | Connect to battery negative.        |
| A3  | Output    | 80mA        | Sensor reference  | Used for sensors requiring a 5v reference (Eg TPS). **Do not use for powering offboard systems.**        |
| A4  | Input     | N/A         | Starter switch        | Ground switching input to trigger the starter. Teensy pin 22         |
| A5  | Input     | N/A         | RPM 2             | Hall effect input for RPM2 (N2)        |
| A6  | Both      | N/A         | CAN L             | CAN L connection        |
| A7  | Input     | N/A         | EGT 2-  | **DO NOT USE ON V0.2 BOARD!**       |
| A8  | Input     | 15A         | Power Ground      | Connect to battery negative.        |
| B1  | Output    | 100mA       | Tacho             | 12v square wave output for use as input to a tachometer        |
| B2  | Input     | N/A         | EGT 2 Override  | This pin bypasses the onboard Thermo amp for EGT2 and instead takes a 0-5v signal from an offboard amp       |
| B3  | Input     | N/A         | EGT 1 Override  | This pin bypasses the onboard Thermo amp for EGT1 and instead takes a 0-5v signal from an offboard amp       |
| B4  | Input     | N/A         | Idle/Run Switch        | Goes to ground when Run is selected. Teensy pin 23         |
| B5  | Input     | N/A         | RPM1              | Hall effect input for RPM1 (N1)        |
| B6  | Both      | N/A         | CAN H             | CAN H connection        |
| B7  | Input     | N/A         | EGT 2+  | **DO NOT USE ON V0.2 BOARD!**       |
| B8  | Input     | N/A         | Kill Switch       | Ground switching input to kill engine. Teensy pin A15/D34         |
| C1  | Output    | N/A         | Analog ground     | Ground reference for use by sensors such as TPS, IAT, CLT. **Do not use for powering offboard controllers**       |
| C2  | Input     | N/A         | CDP Sensor        | 0-5v signal line from CDP transducer        |
| C3  | Input     | N/A         | Fuel flow Sensor  | Input for use with **0-5v** fuel flow sensor. Teensy pin A18        |
| C4  | Input     | N/A         | Inlet Air Sensor  | Connect to one side of 2 wire inlet air temp sensor (IAT). Other side of sensor connected to pin C1        |
| C5  | Input     | N/A         | Coolant Sensor    | Connect to one side of 2 wire coolant sensor (CLT). Other side of sensor connected to pin C1        |
| C6  | Input     | N/A         | EGT 1+  | **DO NOT USE ON V0.2 BOARD!**       |
| C7  | Input     | N/A         | EGT 1-  | **DO NOT USE ON V0.2 BOARD!**       |
| C8  | Input     | N/A         | Throttle Sensor   | Connect to signal line of variable throttle position sensor (TPS). Other pins of sensor should connect to C1 and A3        |

### Grey Connector
![Delphi SICMA Grey Connector](/img/boards/Connector_grey.png){.align-center width=400}
> Note connector alignment in above image
{.is-info}

| Pin | Direction | Max Current | Purpose | Comment |
|-----|-----------|-------------|---------|---------|
| A1  | N/A       | N/A         | N/C     | Not used|
| A2  | Input     | N/A         | EGT 4+  |         |
| A3  | Input     | N/A         | EGT 4-  |         |
| A4  | Input     | N/A         | EGT 3+  |         |
| A5  | Input     | N/A         | EGT 3-  |         |
| A6  | N/A       | N/A         | N/C     | Not used|
| A7  | N/A       | N/A         | N/C     | Not used|
| A8  | Output    | 500mA       | Fuel 2  | Backup fuel control output        |
| B1  | N/A       | N/A         | N/C     | Not used|
| B2  | N/A       | N/A         | N/C     | Not used|
| B3  | N/A       | N/A         | N/C     | Not used|
| B4  | N/A       | N/A         | N/C     | Not used|
| B5  | N/A       | N/A         | N/C     | Not used|
| B6  | N/A       | N/A         | N/C     | Not used|
| B7  | N/A       | N/A         | N/C     | Not used|
| B8  | Output    | 500mA       | Fuel 1  | Primary fuel control output       |
| C1  | Output    | 1.5A        | Safety relay      | Ground switching output for use with safety relay. Teensy pin 26        |
| C2  | Output    | 1.5A        | Starter relay     | Ground switching output for the starter relay. Teensy pin 27 |
| C3  | Output    | 1.5A        | Spare 1 | Spare ground switching output. Teensy pin 28       |
| C4  | Output    | 1.5A        | Spare 2 | Spare ground switching output. Teensy pin 29       |
| C5  | Output    | 500mA       | Ignition  | Ground switching output for use with ignition relay. Teensy pin 30    |
| C6  | Output    | 1.5A        | Spill relay     | Ground switching output for the spill valve relay. Teensy pin 31 |
| C7  | Output    | 1.5A        | Spare 3 | Spare ground switching output. Teensy pin 8       |
| C8  | Input     | 15A         | Power Ground      | Connect to battery negative.        |

## Engine States
| State Number | Description | Exit Condition | Next State |
|--------------|-------------|----------------|------------|
| 0						 | **OFF**. Fuel is turned off, all relay outputs turned off. | RPM is detected or starter button pin goes to ground | 1-5 based on RPM detected. Will be state 1 if starter pin is grounded |
| 1						 | **PRE-START**. Starter is turned on but fuel and ignition are off. Will remain in this mode until RPM reaches defined level or times out | RPM exceeds X1 or time with starter on exceeds timeout value | 2 (or 0 if timed out) |
| 2						 | **START**. Fuel and ignition are turned on  | RPM exceeds X2 or time with starter on exceeds timeout value | 3 (or 0 if timed out) |
| 3            | **PRE-WARMUP**. Fuel is commanded to 'Starter fuel duty'. Starter is off. Ignition is off | 	RPM exceeds X3 | 4 |
| 4            | **WARMUP**. Fuel duty is based on warmup curve | RPM exceeds X4 | 5 |
| 5            | **IDLING**. Fuel duty is based on Idle Duty setting | Run switch pin is pulled to ground | 6 |
| 6            | **RUNNING**. Fuel duty is based on main 3D lookup table | Run switch pin is no longer pulled to ground | 5 |
| 7            | **EGT PROTECTION**. Fuel is commanded to 0 | RPM drops to 0 and remains there for 1 second | 0 |
| 8            | **TEST**. Unused test mode | NA | NA |
| 9            | **KILLED**. Engine has been killed due to kill switching being pressed | Engine RPM returns to 0 | 0 |
