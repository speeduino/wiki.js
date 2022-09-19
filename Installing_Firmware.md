---
title: Speeduino Firmware setup
description: Setting up the Speeduino firmware on your board
published: true
date: 2022-04-05T07:43:11.798Z
tags: 
editor: undefined
dateCreated: 2020-01-06T01:37:01.522Z
---

# Loading the Speeduino firmware

## Overview
The Speeduino firmware is the code that powers the hardware and must be installed onto your board prior to using the ECU. New firmware releases are made regularly (Approximately every 2 months) that bring new features, bug fixes and performance improvements so staying up to date is highly recommended. 

With the goal of maximum simplicity in mind, the process of compiling and installing the firmware is reasonably straightforward. Most users will use the SpeedyLoader method for installing the firmware


## Installation - SpeedyLoader

The simplest (and recommended) method of installing the Speeduino firmware onto a standard Arduino Mega 2560 or Teensy is with the SpeedyLoader utility. SpeedyLoader takes care of downloading the firmware and installing it onto an Arduino without the need to manually compile any of the code yourself. You can choose the newest firmware that has been released, or select from one of the older ones if preferred. SpeedyLoader will also download the .ini file and optionally a base tune for the firmware you choose so it can be loaded into your TunerStudio project.

-   **Windows:** [32-bit](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader-ia32.exe) / [64-bit](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader-x64.exe)
-   **Mac:** [SpeedyLoader.dmg](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader.dmg)
-   **Linux:** [SpeedyLoader.AppImage](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader.AppImage)
    -  Will need to be made executable after downloading (eg. `chmod +x`)
    -  Linux requires libusb libraries to be installed. EG if on Debian/Ubuntu:
            `sudo apt-get install libusb-1.0-0 libusb-0.1-4:i386`
-   **Raspberry Pi** [SpeedyLoader.AppImage](https://github.com/speeduino/SpeedyLoader/releases/latest/download/SpeedyLoader-armv7l.AppImage)
    -   Raspberry Pi / Raspbian users can install the required libraries with:
            `sudo apt-get install libusb-1.0-0 libusb-0.1-4`

Once the firmware is installed on the board, see [Connecting to TunerStudio](/Connecting_to_TunerStudio) for more details on how to configure TunerStudio

## Installation - Manually Compiling using Arduino IDE
> Note that manually compiling the firmware is **NOT** required to install Speeduino, the easiest (and recommended for most users) method is using SpeedyLoader as described above.
{.is-warning}

 
If you want to compile the firmware yourself, or make any code changes, then the source of both the releases and the current development version is freely available.

### Requirements

-   A Windows, Mac or Linux PC
-   [The Arduino IDE](http://arduino.cc/en/Main/Software). Current minimum version required is 1.6.7, although a newer version is recommended.
-   A copy of the latest Speeduino code base. See below.
-   A copy of [TunerStudio](http://www.tunerstudio.com/index.php/downloads) to test that the firmware has uploaded successfully
-   [Time -library](https://github.com/PaulStoffregen/Time) installed on Arduino IDE.

### Downloading the firmware

There are two methods for obtaining the Speeduino firmware:

1.  Regular, stable code drops are produced and made as releases on Github. These can be found at: [Releases](https://github.com/noisymime/speeduino/releases)
2.  If you want the latest and greatest (And occasionally flakiest) code, the git repository can be cloned and updated. 
See [here](https://github.com/noisymime/speeduino)

### Compiling the firmware

-   Start the IDE, select *File &gt; Open*, navigate to the location you downloaded Speeduino to and open the **speeduino.ino** file.
-   Set the board type: *Tools &gt; Board &gt; Arduino Mega 2560* or Mega ADK (Teensy and other Arduino board types are also supported, but this guide only explains Arduino Mega)
-   Click the **Verify** icon in the top left corner (Looks like a tick) 

At this point you should have a compiled firmware! If you experienced a problem during the compile, see the [Troubleshooting](/en/Installing_Firmware#troubleshooting) section below.

This video walks through the whole process of installing the firmware on your Arduino from scratch: https://www.youtube.com/watch?v=AX9URou4JTs

#### Optional (But recommended)

There is an option available for changing the compiler optimisation level, which can improve . By default, the IDE uses the -Os compile option, which focuses on producing small binaries. As the size of the Speeduino code is not an issue but speed is a consideration, changing this to -O3 produces better results (Approximately 20% faster, with a 40% larger sketch size) To do this, you need to edit the platform.txt file:

-   Make sure the Arduino IDE isn't running
-   Open the platform.txt file which is in the following locations:
    -   On Windows: c:\\Program Files\\Arduino\\hardware\\arduino\\avr
    -   On Mac: /Applications/Arduino/Contents/Resources/Java/hardware/arduino/avr/
    -   On Linux:
-   On the following 3 entries, change the Os to be O3:
    -   compiler.c.flags
    -   compiler.c.elf.flags
    -   compiler.cpp.flags
-   Save the file and restart the Arduino IDE

### Installing

Once you've successfully compiled the firmware, installation on the board is trivial.

-   Plug in your Mega 2560 to a free USB port
-   If you're running an older version of **Windows** and this is the first time you've used an Arduino, you may need to install drivers for the Arduino serial chip (USB-UART or "USB adapter chip").

Most official boards and many non-official versions use the ATMega16U2 or 8U2, whereas many of the Mega2560 clone boards utilize the CH340G IC. Both types work well. The serial chips can generally be identified by appearance:

* **ATMega16U** - This has a square IC near the USB connector - drivers are included in Windows 7+, MacOS and Linux.
* **WCH CH340G** - This has a rectangular IC near the USB connector- uses "CH341" drivers from [WCH](http://www.wch.cn/downloads/file/65.html) for Windows
  * WCH-original CH340/CH341 drivers for other systems (Mac, Linux, Android, etc) may be found [here](http://www.wch.cn/downloads/CH341SER_ZIP.html).

-   In Arduino IDE; select the Mega2560: *Tools &gt; Board*
-   Select your system's serial port to upload: *Tools &gt; Serial Port*
-   Hit the *Upload* button from the top left corner 

### Older firmware releases

If required, older firmware releases and details can be found at [Firmware_History](/en/Firmware_History "wikilink")

### Verifying Firmware

The firmware is now loaded onto your board and you are now able to move onto [Connecting to TunerStudio](/en/Connecting_to_TunerStudio "wikilink").

Optionally, you may perform a manual verification of the firmware by using the Arduino IDE's Serial Monitor. This can be started by selecting 'Serial Monitor' from the Tools menu.

In the window that appears, enter a capital "S" (no quotes) and press *Enter*. The Mega should respond with the year and month of the code version installed (xxxx.xx):

    Speeduino 2017.03

**NOTE**: Ensure the baud rate is set to 115200

You can also enter "?" for a list of queries from your Mega.

### Troubleshooting

#### Incorrect Arduino board selected

If you see the following (or similar) errors when trying to compile the firmware and the solutions:

    scheduler.ino:317:7: error: ‘OCR4A’ was not declared in this scope
    scheduler.ino:323:8: error: ‘TIMSK5’ was not declared in this scope
    scheduler.ino:323:25: error: ‘OCIE4A’ was not declared in this scope

You may have the wrong kind of Arduino board selected. Set the board type by selecting *Tools &gt; Board &gt; Arduino Mega 2560* or Mega ADK

#### Entire Speeduino project is not opened

The following can occur if you have only opened the speeduino.ino file rather than the whole project.

`speeduino.ino:27:21: fatal error: globals.h: No such file or directory`

Make sure all the files are contained within the same directory, then select File-&gt;Open and find the speeduino.ino file. If you have opened the project correctly, you should have multiple tabs along the top:

![speeduinoIDE.png](/img/TunerStudio/speeduinoIDE.png){.align-center width=500}

If you see only a single file or a small number of files then you haven't opened the entire project.

## Installation - Manually Compiling using Platform IO & VSCode

The recommended way of manually compiling the Speeduino firmware is to use Platform IO & Visual Studio Code. Using platform IO is usually easier than Arduino IDE, because everything is already configured in the platformio.ini file and PIO automatically downloads missing components. Platform IO can also be used to easily build for other MCU types (Teensy, STM32).

### Requirements

-   A Windows, Mac or Linux PC
-   Visual Studio Code. Can be downloaded from [here](https://code.visualstudio.com/)
-  [PlatformIO](http://platformio.org/) Add-on in VS Code. To install, open VS Code and search for "Platform IO IDE" -extension (Ctrl+Shift+X) and click install.
-   A copy of the latest Speeduino code base. See below.
-   A copy of [TunerStudio](http://www.tunerstudio.com/index.php/downloads) to test that the firmware has uploaded successfully

### Downloading the firmware

There are two methods for obtaining the Speeduino firmware:

1.  Regular, stable code drops are produced and made as releases on Github. These can be found at: [Releases](https://github.com/noisymime/speeduino/releases)
2.  If you want the latest and greatest (And occasionally flakiest) code, the git repository can be cloned and updated. 
See [here](https://github.com/noisymime/speeduino)

### Compiling and installing the firmware

-   Start the VS Code and let it open/update PlatformIO -extension, select *Explorer &gt; Open Folder* and navigate to the location you downloaded Speeduino
-   The speeduino folder should now look like this on the workspace (platformio.ini is visible). Click on the PIO logo on the left panel:
![pio_1.png](/img/TunerStudio/pio_1.png){.align-center}
-   On the opened *project tasks* open the *megaatmega2560* and click *Build* to compile the FW:
![pio_2.png](/img/TunerStudio/pio_2.png){.align-center}
-   PIO should now download all the needed components to compile the firmware and compile it.
![pio_3.png](/img/TunerStudio/pio_3.png){.align-center width=500}
-   Once the compiling is done, you can click *Upload* and PIO will upload the speeduino code to the Arduino MEGA.
![pio_4.png](/img/TunerStudio/pio_4.png){.align-center width=500}

Platform IO can be used to compile Firmware for other platforms too by selecting correct MCU option from the *project tasks*. Currently Teensy 3.5, Teensy 3.6 and STM32F407 are supported to run the Firmware on car.
