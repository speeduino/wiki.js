---
title: Miata/MX5 89-95 NA6 PNP
description: Plug and Play board for the NA Miata/MX5 model years '89 through to early '95
published: true
date: 2021-01-27T12:00:24.611Z
tags: boards
editor: markdown
dateCreated: 2020-01-06T01:53:34.029Z
---

Introduction
------------

The Speeduino Miata / MX5 Plug N Play (PNP) box is designed for easy installation on the 1.6L NA6 vehicles using the 48-pin ECU. This is all 1.6L models from 1989 through 1993 and some 1.6s up to 1995.

The stock ECU for these vehicles have a 2 plug loom connection and look like the below:

![OEM_ECU.png](/img/MX5/OEM_ECU.png){.align-center width=500}

> **WARNING:** Note that some changes to the stock hardware configuration are required with this unit. In particular, please see below in the fuel pump section for details that must be understood prior to starting
{.is-danger}



Hardware requirements
---------------------

The PNP box plugs straight into the stock wiring in place of the original ECU, however some hardware changes are either recommended or are desirable in most installations.

Most significantly, Speeduino does not operate with the stock AFM on the NA6 engine. This unit can either be retained or removed, but if being kept in place, the connector to it should be disconnected.

### Manifold Pressure

For a load reference, it is strongly recommended to run a manifold pressure line to the Speeduino PNP box. This allows Speeduino to run in the default Speed-Density configuration and is usually a fairly easy installation. The unit comes with a built-in MAP sensor that supports up to 1 Bar of boost, but is compatible with other external sensors if more pressure is required.

The 1.6L cars typically come with a suitable MAP port near the throttle body that is capped off in stock form and is generally the easiest place to take the manifold pressure reference.

![MAP_orig.png](/img/MX5/MAP_orig.png){.align-center width=500}

5mm or 6mm vacuum hose should be used and there are multiple original holes in the firewall where this can be run.

### Throttle Position Sensor

Manual NA6s come with a switch only TPS that provides limited feedback to the ECU. It is highly recommended to replace this with a Variable TPS (VTPS) that provides a signal indicating the current throttle position. The original wiring can be used with any 3 wire VTPS

![TPS_wiring.png](/img/MX5/TPS_wiring.png){.align-center width=500}

> **Note:** If a VTPS is **NOT** being fitted, the stock TPS should be disconnected and a 1k resistor placed between the signal line and ground to prevent erratic acceleration enrichment at full throttle.
{.is-warning}


### Inlet Temperature Sensor

In the stock configuration, inlet air temperature is provided by a sensor in the AFM. If the AFM is retained then this sensor will work if jump wires are run from the AFM to the disconnected connector (See image below), however as most setups elect to remove the AFM, an additional sensor needs to be added. The recommended sensor is the GM open air IAT that is common to many GM vehicles. Part number for this is \#25036751 and it can be found fairly cheaply from many online sources, including the Speeduino store (https://speeduino.com/shop/index.php?id_product=23&controller=product)

The 2 wires from this sensor can be pinned directly into the AFM connector on pins 1 and 6 (It does not matter which wire goes to which pin):

![IAT_connector.png](/img/MX5/IAT_connector.png){.align-center width=500}

### Wideband O2 Sensor

Whilst not mandatory, the installation of a wideband oxygen sensor and controller is strongly recommended. Any wideband controller that outputs a 0-5v signal is supported and calibration for common controllers can be found in the Tools-&gt;Calibrate AFR Table dialog.

The wideband analog output signal should be connected to the original O2 sensor wire. This has a convenient connector in the engine bay, located just next to the coils. This can be found by following the wire from the original sensor. If not reusing the original narrowband sensor, the connector can be cut from this and attached to the wideband signal.

### Fuel pump control

The stock ECU does not perform any fuel pump control as this is taken care of by the AFM. Speeduino however can control the fuel pump through the original wiring, but requires the removal of the ST_SIG fuse. Failure to remove this fuse prior to powering the unit on will trip the smart FET that is used on this line, but should not cause permanent damage if only performed once or twice.

The fuse to be removed is found in the engine bay fuse block:

![ST_SIG_fuse.png](/img/MX5/ST_SIG_fuse.png){.align-center width=500}

#### Alternative control methods

If the above method of fuel pump control is either not desirable or not available, an alternative driver wired to pin 2O on the main connector that can be used for this. Pin 2O originally carries the AFM signal, however as Speeduino does not use this (And the AFM must be disconnected) it can be used to carry the fuel pump control.

To do this, a jumper wire is required on the AFM connector per the below:

![AFM_fuel_pump.png](/img/MX5/AFM_fuel_pump.png){.align-center width=500}


Once the above jumper is in place, the fuel pump pin in TunerStudio should be set to A9.

### Setup on 1.8 engines

Wiring on the 48-pin 1.8 (NA8) models is largely identical to the 1.6 (NA6) however there are some minor differences. In addition to other points on this page, the following should be observed for 1.8 setups:

-   Fuel pump output pin should be set to A9
-   If the tacho doesn't work, set the tacho pin to 49 and add a jumper to the pins labelled 'Tach' on the board (Just above R56)
-   If the TPS reading is fixed at full open/closed and you have a heated rear demister, you may need to remove/cut wire 2L. This should only be done in this specific case and it is unlikely to affect most cars.

## Configuration and start
It is strongly recommended to start by using the NA6 base tune that is available through SpeedyLoader. 

### Sensor calibration

The stock sensors can use preset calibrations within TunerStudio. The following values should be used if the stock sensors are retained:
**Stock Coolant Sensor (CLT)** - RX-7_CLT(S4 & S5)
**Stock inlet air sensor (IAT)** - RX-7_AFM(S5 in AFM)

![sensor_calibrations.PNG](/img/MX5/sensor_calibrations.PNG){.align-center width=420}
