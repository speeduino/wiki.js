---
title: Setting up TunerStudio
description: How to create and connect to your ECU within TunerStudio
published: true
date: 2020-01-14T07:33:43.161Z
tags: 
---

Tuner Studio is the tuning interface software used by Speeduino. It runs on Windows, Mac and linux and provides configuration, tuning and logging capabilities.

Once you have the firmware compiled and uploaded to your Arduino, you're ready to setup Tuner Studio in order to configure and monitor it. If you haven't yet compiled and uploaded the firmware, refer to the [Installing Firmware](/Installing_Firmware) page.

## Downloading Tuner Studio

If you haven't already, grab a copy of Tuner Studio from: http://www.tunerstudio.com/index.php/downloads
Tuner Studio is available for Windows, Mac and linux and will run on most PCs as it's system requirements are fairly low.

The current minimum version of TunerStudio required is 3.0.7, but the latest version is usually recommended.

If you find Tuner Studio to be useful, please consider paying for a license. This is a fantastic program from a single developer that rivals the best tuning software in the world, it's worth the money.

## Setting up your project

### Create new project

When you first start TunerStudio, you'll need to setup a new project which contains the settings, tune, logs etc. On the start up screen, select 'Create new project'

![TS_1.png](/img/TunerStudio/TS_1.png =500x){.align-center}

Give you project a name and select the directory you want the project to be stored in. Tuner Studio then requires a firmware definition file in order to communicate with the arduino. Tick the 'Other / Browse' button.

![TS_1.png](/img/TunerStudio/TS_2.png =400x){.align-center}

Then browse to the Speeduino source directory, enter the reference subfolder and select speeduino.ini file

<img src="https://raw.githubusercontent.com/speeduino/wiki/master/TS_3.png" width="40%" />

### Configuration options

Set the configuration parameters for your project. These can be changed any time later on, so don't worry if you don't have them at this time.

<img src="https://raw.githubusercontent.com/speeduino/wiki/master/TS_4.png" width="40%" />

### Comms settings

Select your comms options. The exact port name will depend on which operating system you are running and this will be the same as in the Arduino IDE. Baud rate should be 115200.

<img src="https://raw.githubusercontent.com/speeduino/wiki/master/TS_5.png" width="40%" />

### Load base tune

Once the project is created, you'll need to load in a base tune to ensure that all values are at least somewhat sane. Failure to do this can lead to very strange issues and values in your tune.

<img src="https://raw.githubusercontent.com/speeduino/wiki/master/TS_6.png" width="40%" />

In the Speeduino reference directory, you will find the base tune file to be opened:

<img src="https://raw.githubusercontent.com/speeduino/wiki/master/TS_7.png" width="40%" />

And that's it! Tuner Studio should now attempt to connect to the Arduino and show a realtime display of the ECU.

------------------------------------------------------------------------

------------------------------------------------------------------------