---
title: Turbine Bear
description: 
published: true
date: 2021-08-25T05:42:10.592Z
tags: 
editor: markdown
dateCreated: 2021-08-25T01:57:06.706Z
---

# Turbine Controller
Blah blah

## Features

Blah

## Board Configuration
The Dropbear board contains 4 switches and 1 DIP switch pair that can be used to change the setup of the ECU. 

### Crank/Cam inputs
The ECU contains a dual onboard conditioner that can can be used with VR sensors. The selection between Hall/Optical sensors and VR sensors is made via a pair of switches, one each for the crank and cam. These can be selected independently for setups that use one of each sensor type. 

When set for Hall sensors, this input will work with both the traditional ground switching sensor (the pullup resistor is on the board and does not need to be added) or a 0-12v signal as used on some GM vehicles. 

#### Crank filter
The board includes a variable hardware filter on the crank input that can be used to adjust the amount of capacitor filtering being used on this signal. This is designated `SW4` or `SW3` on the PCB and operates on both Hall and VR inputs. 

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



## Pin out

The ECU uses 2x 24 pin Delphi Sicma connectors. The connectors are keyed and will only connect to the matching colour loom plug. 

### Black Connector      
![Delphi SICMA Black Connector](/img/boards/Connector_black.png){.align-center width=400}

| Pin | Direction | Max Current | Purpose | Comment |
|-----|-----------|-------------|---------|---------|
| A1  | Input     | 5A          | Switched 12v      | Main power input. Connect to switched 12v power via 5A fuse        |
| A2  | Input     | 15A         | Power Ground      | Connect to battery negative.        |
| A3  | Output    | 80mA        | Sensor reference  | Used for sensors requiring a 5v reference (Eg TPS). **Do not use for powering offboard systems.**        |
| A4  | N/A       | N/A         | Not used.         |         |
| A5  | Input     | N/A         | Spare Digital In 2| 12v or Ground switching digital input. Can be used for VSS, Idle Up etc. MCU pin #22 in TunerStudio        |
| A6  | Both      | N/A         | CAN L             | CAN L connection        |
| A7  | Both      | N/A         | CAN H             | CAN H connection        |
| A8  | Input     | 15A         | Power Ground      | Connect to battery negative.        |
| B1  | Output    | 100mA       | Tacho             | 12v square wave output for use as input to a tachometer        |
| B2  | Input     | N/A         | Crank Primary     | Primary crank sensor (CKP) input. Can be 12v, Ground switching or the positive wire of a VR sensor. See [Crank/Cam Inputs](#crankcam-inputs) section        |
| B3  | Input     | N/A         | Crank Negative    | **Only used with a VR sensor.** Connect to negative side of VR crank sensor. See [Crank/Cam Inputs](#crankcam-inputs) section        |
| B4  | Input     | N/A         | Cam Primary     | Cam sensor (CMP) primary input. Can be 12v, Ground switching or the positive wire of a VR sensor. See [Crank/Cam Inputs](#crankcam-inputs) section        |
| B5  | Input     | N/A         | Cam Negative    | **Only used with a VR sensor.** Connect to negative side of VR cam sensor. See [Crank/Cam Inputs](#crankcam-inputs) section        |
| B6  | Input     | N/A         | Spare Digital 1| 12v or Ground switching digital input. Can be used for VSS, Idle Up etc. MCU pin #23 in TunerStudio        |
| B7  | Input     | N/A         | Clutch input.     | Ground switching digital input that goes to ground when clutch is engaged. Do not feed 12v on this input        |
| B8  | Input     | N/A         | Flex sensor       | Signal wire from GM/Continental Flex sensor.         |
| C1  | Output    | N/A         | Analog ground     | Ground reference for use by sensors such as TPS, IAT, CLT. **Do not use for powering offboard controllers**       |
| C2  | Input     | N/A         | Spare Analog 1    | Spare analog input for use with **0-5v** sensors such as fuel pressure/temperature, oil pressure etc. MCU pin A17 in TunerStudio        |
| C3  | Input     | N/A         | Spare Analog 2    | Spare analog input for use with **0-5v** sensors such as fuel pressure/temperature, oil pressure etc. MCU pin A18 in TunerStudio        |
| C4  | Input     | N/A         | O2 Sensor         | Connect to the 0-5v signal wire of external wideband controller. Can also be used with 0-1v output from narrowband sensor however wideband is **strongly** recommended        |
| C5  | Input     | N/A         | Coolant Sensor    | Connect to one side of 2 wire coolant sensor (CLT). Other side of sensor connected to pin C1        |
| C6  | Input     | N/A         | Inlet Air Sensor  | Connect to one side of 2 wire inlet air temp sensor (IAT). Other side of sensor connected to pin C1        |
| C7  | Input     | N/A         | Throttle Sensor   | Connect to signal line of variable throttle position sensor (TPS). Other pins of sensor should connect to C1 and A3        |
| C8  | Input     | N/A         |External MAP Sensor| Signal line if using external MAP sensor. Input should be 0-5v and MAP source switch should be set to 'Ext.'. See [MAP Selection](#map-selector) section for more details. If using internal sensor this pin should be left unconnected.        |

### Grey Connector
![Delphi SICMA Grey Connector](/img/boards/Connector_grey.png){.align-center width=400}

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
| C3  | Output    | 2A          | Spare 2/Stepper-B2  | Can be used either as ground switching output for general purpose use or 12v output if using a stepper idle control (Requires stepper driver to be fitted, see [Stepper Driver](#stepper-driver))       |
| C4  | Output    | 2A          | Idle/Stepper-B1  | Can be used either as ground switching idle output (For use with PWM valves) or 12v output if using a stepper idle control (Requires stepper driver to be fitted, see [Stepper Driver](#stepper-driver))       |
| C5  | Output    | 500mA       | Ignition  | Ground switching output for use with ignition relay. Teensy pin 30    |
| C6  | Output    | 1.5A        | Spill relay     | Ground switching output for the spill valve relay. Teensy pin 31 |
| C7  | Output    | 1.5A        | Fuel Pump         | Ground switching output for triggering fuel pump relay. **Do not drive pump directly from this pin, use only with relay**        |
| C8  | Input     | 15A         | Power Ground      | Connect to battery negative.        |

