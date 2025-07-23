---
title: Airbear
description: 
published: true
date: 2025-07-23T21:31:16.013Z
tags: wifi bluetooth ble dash dashboard airbear
editor: markdown
dateCreated: 2025-04-19T23:05:25.945Z
---

# Airbear

Airbear is a Wifi and BLE module for Speeduino ECUs that allows it to display dash informatino or tune the the system wirelessly. 

## Setup

Out of the box the Airbear unit will start a wifi network with the SSID (Name) `Speeduino Dash`. The network will not have a password to join. Connect to this network and then open the following URL in a browser: http://speeduino.local/

### Connecting to Wifi

Generally it is recommended to connect to your own wifi network when this is available. 

If your home wifi network is not available when the unit starts, it will start the default  `Speeduino Dash` network so that the unit can be accessed when away from known networks. 

## Modes

Airbear has 3 different modes for presenting the data from the ECU. This can be selected through the first config page, located at http://speeduino.local/config

![Airbear mode selection](/img/boards/airbear/config-mode.png){.align-center width=500}

### Web Dash

In this mode a dashboard interface is presented at the default URL (http://speeduino.local) that can be viewed either on PC or via phone/tablet. 

Up to 3 separate connections can be made to the dashoboard at the same time from different client devices. 

### Tuner Studio (Wifi)

Setting the Connection Type to TunerStudio allows the ECU to be tuned and monitored over wifi with TunerStudio. 

Set the mode to 'TunerStudio' via the Airbear web interface and then restart the device. Within TunerStudio itself, change your Communication Settings to the following:

**Connection Type:** TCP/IP - Wifi driver
**Port:** 2000
**IP Address:** speeduino.local (Or the manual IP address if you prefer)

![Airbear TunerStudio wifi settings](/img/boards/airbear/ts-connection-settings.png){.align-center width=500}

### Bluetooth