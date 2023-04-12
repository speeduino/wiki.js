---
title: Connecting Tunerstudio via Canbus
description: Connecting to Tunerstudio via Canbus to tune and monitor Speeduino and other can connected devices
published: true
date: 2022-12-30T10:30:47.417Z
tags: 
editor: undefined
dateCreated: 2022-12-30T08:19:57.703Z
---

# Connecting to Tunerstudio via Canbus
# NOTE: THIS IS A DRAFT Proposal subject to change!
Last update (30 December 2022)
## Outline

The usual way in which we connect the PC/tuning device running Tunerstudio to the Speeduino ecu is via USB . 
This page explains the format by which the usb/serial data from the tuning device should be converted into a canbus message to enable connection instead using one of the canbus ports on the ECU .
Teensy and STM32 mcu based Speeduino have native canbus ports (the number of ports depends on the specific version of those MCU)
A mega2560 based Speeduino needs a coprocessor module that connects via serial3 to the mega board to add a canbus port .At the time of writing(30/12/2022) no coprocessor interface supports the tuning option.

The data is transferred at 500k using 11bit addressing via ISO tp.

## TS configuration 
You must first enable cancommands from the project properties menu.This will enable the TS canid selection page within project properties.
You must ensure that the Speeduino ECU is configured as TS can device 0.
Other ECU TS is able to communicate with that support tuning over can should be assigned another of the 15 tscanids (as defined by the device firmware).
The selection of tscanid is very important as it allows the usb to canbus dongle to retrieve the actual canbus address of the ECU (s) to enable further communication with Tunerstudio.

## The serial to canbus format and protocol.
Below explains how the serial commands normally sent to and from TS are repackaged and sent over the canbus by the usb to canbus dongle (here onwards referred to as "the dongle") and how the receiving ECU reacts to those messages.

### Step 1
upon initial connection TS sends out a "Q" request.
The dongle sends out a can message with address 0x7df.
The 8 bytes of the message are filled as follows(example showing for a speeduino ecu).

byte 0 - 0x03
byte 1 - 0x22  ( send mode 22)
byte 2 - 0x80  ( PID 0x80 )
byte 3 - 0x00 (the tscanid of the ecu)
byte 4
byte 5
byte 6
byte 7

bytes 4-7 are unused in this message.
byte 3 should reflect the tscanid of the ecu . Tunerstudio sends the tscanid value of the device it is attempting to contact with the "Q" request . The dongle must insert this id into byte3.

The receiving ECU must reply with a 26 byte message on address 0x7e8 using the ISO tp format.
The message comprises 
0x62 ( confirming a mode 22 , 0x22+0x40)
0x80 ( confirming it was a pid 80 )
0x00 ( the tscanid of the ecu)
The ECU firmware revision in the first 20bytes.
A ascii space (0x )
The ECU 11bit canbus tuning address in the last two bytes (little endian).

The dongle must strip the can address from the reply and save it for future data transfers to that tscanid.