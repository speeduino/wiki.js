---
title: Reset_Control
description: 
published: true
date: 2021-01-20T12:25:15.098Z
tags: 
editor: markdown
dateCreated: 2020-01-06T01:54:04.493Z
---

Background
----------

The Arduino Mega platform is great in that it provides a low cost, low barrier to entry platform for projects. Unfortunately, these conveniences come with some disadvantages.

Specifically, in an effort to make the programming process as painless as possible, most (possibly all) versions of the Arduino Mega 2560 board will reset themselves when a new serial connection is initiated. Needless to say, it's pretty inconvenient for the computer controlling your engine to reboot if you're driving the car and the serial connection to your logger becomes unstable and has to reconnect (hint: the engine stops).

This feature will enable you to prevent that from happening.

Requirements
------------

Reset Control can be used as simply as setting some options and [connecting a wire](/reset_control#Wiring "wikilink"). However, some options also require [updating the usb-serial bootloader](/en/configuration/Reset_Control#updating-the-bootloader "wikilink") on the ATmega16U2 chip (if the board has one).

(TODO more details)

Options
-------

![<File:2018-02-27> 21 11 05-Reset Control.png](2018-02-27_21_11_05-Reset_Control.png "File:2018-02-27 21 11 05-Reset Control.png")

The Speeduino firmware provides three options for preventing the Arduino from resetting *(**\*** indicates a [bootloader update](#Updating_the_Bootloader "wikilink") is required)*:

-   Prevent When Running
    -   Disabled
        -   No reset control is enabled
    -   When the engine is running**\***
        -   As long as the engine is running, the Arduino will not automatically reset itself.
        -   The Control Pin will be held high as long as the engine is running.
        -   It will only be possible to update the Speeduino firmware when the car is not running or the Control Pin is otherwise held low.
    -   Prevent Always**\***
        -   The Control Pin is always held high.
        -   It will only be possible to update the Speeduino firmware if the Control Pin is held low by jumper, switch, or some other means.
    -   Serial Command
        -   Similar to "Prevent Always," except that no custom bootloader is required.
        -   The Control Pin will normally be held high.
        -   To update the Speeduino firmware, you will need to first send the character 'U' to it over the serial connection. This will let it know that an update is coming and it will reset itself upon receiving any more data.

Wiring
------

### Standard 16u2 Firmware or No 16u2

This is as simple as running a wire from the control pin to the reset pin on your Arduino.

### Custom 16u2 Firmware

The custom 16u2 firmware differs from the stock one in that it uses one of the 16u2's GPIO pins to recognize when the board should / should not be allowed to reset. The pin used is PB7, as illustrated.

![](Reset_control_16u2_pins.jpg "Reset_control_16u2_pins.jpg")

How you connect the control pin to PB7 is up to you, but if you are connecting from a pin on the Speeduino's proto area, you may wish to use right-angle pin headers on the Arduino to make separating the Speeduino shield from the Arduino MCU (also illustrated).

Updating the Bootloader
-----------------------

Using the "When the engine is running" and "Prevent Always" reset control modes requires updating the usb-serial firmware on your Arduino's ATmega16U2 chip (these modes are unavailable if your board uses something else to perform usb serial functionality, such as an FTDI or CH340 chip).

A hex file for the updated bootloader can be found in the following locations:

-   In the [Speeduino Firmware download](Compiling_and_Installing_Firmware#Downloading_the_firmware "wikilink") under the "reference/bootloaders" directory
-   In the Speeduino source on GitHub: [1](https://raw.githubusercontent.com/noisymime/speeduino/master/reference/bootloaders/Speeduino-usbserial-atmega16u2-Mega2560-Rev3.hex)

To perform the update, you will need a copy of [dfu-programmer](https://dfu-programmer.github.io/). Directions for installing dfu-programmer for Mac can be found [here](https://www.arduino.cc/en/Hacking/DFUProgramming8U2). It may also be possible to use Atmel's flip programmer but it has not been tested.

The procedure is as follows (directions are for Windows but are very similar for Linux and Mac):

1.  Extract both dfu-programmer and the updated bootloader into the directory of your choice.
2.  Plug your Arduino into a USB port and wait for the computer to recognize it.
3.  Briefly short the 16U2's RESET and GND pins. This will cause the 16U2 to enter [DFU mode](https://www.arduino.cc/en/Hacking/DFUProgramming8U2).
4.  If you are prompted by Windows to install a driver, do not let Windows install the driver automatically. Instead, browse to the .inf file that came with dfu-programmer.
5.  Use the following commands to backup your existing usb-serial firmware and install the new one (prepend sudo on Mac and Linux):
    1.  `dfu-programmer` `atmega16u2` `read` `>` `arduino-usbserial-backup.hex`
    2.  `dfu-programmer` `atmega16u2` `erase`
    3.  `dfu-programmer` `atmega16u2` `flash` `Speeduino-usbserial-atmega16u2-Mega2560-Rev3.hex`
    4.  `dfu-programmer` `atmega16u2` `reset`

6.  The bootloader update is complete. You should now disconnect and reconnect the Arduino to your computer.

In Windows, your Arduino will now appear as a generic USB Serial Device in the Device Manager so you will likely need to reconfigure TunerStudio to use the new port. If you like, you can check the "Bus reported device description" property in the device's Details tab to verify that "Speeduino Mega 2560" is shown.

Updating the Speeduino Firmware With "Serial Command" Selected
--------------------------------------------------------------

Performing a Speeduino firmware update using the Serial Command method is a multi-step process:

1.  Using the serial terminal program of your choice (this was tested using [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/)), open a serial connection to your Speeduino. At this time, you may wish to enter a "?" to verify that the serial connection is working properly.
2.  Enter "U" in the terminal. If all goes well, it should respond with the message "Comms halted. Next byte will reset the Arduino."
3.  Without entering any more characters, close the serial terminal.
4.  Finally, start the firmware upload. The Arduino should now reset and accept the firmware upload as normal.

(TODO: Screenshots)

Updating the Speeduino Firmware With the Updated 16U2 Bootloader Installed
--------------------------------------------------------------------------

If you have reset control set to "When engine is running," there is no special procedure required to update your Speeduino firmware. As long as the engine is not running, the Arduino will behave just as any other and you can update it the same way you would any other time.

If you have reset control set to "Always," you will either need to temporarily disable it from inside TunerStudio in order to update your Speeduino firmware.