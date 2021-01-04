---
title: GPIO_for_Speeduino
description: 
published: true
date: 2021-01-04T15:47:47.591Z
tags: 
editor: markdown
dateCreated: 2021-01-04T15:47:47.591Z
---

GPIO for Speeduino
==================

By Darren Siepka

### What is it?

GPIO for Speeduino are a family of multipurpose general programmable input and output modules that can be used both in conjunction with the Speeduino engine ECU or standalone. The modules are programmed via Tunerstudio either via the serial port or over the integrated CanBus network(certain variants only)

The modules can use several different processor board types, including different arduino, teensy and stm32.

Io operations are programmed with logic, &lt; ,&gt;,= and bitwise AND . some variants offer 2 or even 3 connecting logic conditions.

### Versions

### GPIO MINI V0.001

This firmware supports up to 16 output channels , 16 input channels and 16 analog channels from local sources subject to MCU capability. MCU supported are currently Arduino Pro-Mini , Arduino Uno and Arduino Mega2560. The Output channels can be activated via one condition with logical operations of &lt; , &gt; and = Only onboard(local) io are supported in this version.

### GPIO MINI V0.002

This firmware offers the same features as V0.001 but with the ability to also access the output channel data values from a Speeduino ECU connected directly using the Speeduino Serial3 support.This firmware is currently only supported by Arduino Mega2560

### GPIO MINI V0.003

This firmware allows Speeduino to access the GPIO device's inputs(both digital and analog) to be displayed within TunerStudio or logged.Again in this version the GPIO device is still connected directly to the Speeduino via Serial3.This firmware is currently only supported by Arduino Mega2560

Software installation
---------------------

You can download the latest versions of GPIO here <https://github.com/Autohome2/Speeduino-GPIO>

If you are installing one of the versions with CANBUS you will need to install the libraries to your Arduino IDE if you dont have a current version installed.The libraries are included in the download.

The libraries used are:

Canbus from CoryJFowler (for spi canbus modules)[1](https://github.com/coryjfowler/MCP_CAN_lib)

Flexcan from Pawelsky( for Teensy onboard Can)[2](https://github.com/pawelsky/FlexCAN_Library)

The flexcan library is included in the installation of Teensyduino into the Arduino IDE[3](https://www.pjrc.com/teensy/td_download.html)

The Tunerstudio INI file and base tune can be found in the reference folder for the specific variant you wish to install in the download . NOTE it is very important to install the correct ini and base msq for the selected firmware.

Realtime Data Organisation
--------------------------

Some versions of GPIO support the ability to access the realtime data from the GPIO I/O ports remotely via Either the Serial3 port or Canbus (see model versions). The data is stuctured as an offset address to the GPIO device real canID.

1 - 32

The digital inputs 1 through 32. These send a value of 1023 if ON and 0 when OFF.

33 - 64

The Digital Outputs 1 through 32. These have an ON value of 1023 and an Off value of 0.

65 - 81

The analog inputs 0 through 15. These Send a value ranging from 0 to 1024.

example: if the GPIO real canID == 0x105 to request analog 0 you would request data from 261dec + 65dec == 326dec == 0x146

The data is located in bytes 0 and 1 of the 8 transmitted , 0 being lsb 1 being msb.

Configuration
-------------

### Device Configuration

Device configuration can be found in the Tunerstudio Tab "Settings" then select "device configuration"

![](Gpio_config.jpg "Gpio_config.jpg")

-   **Device Real CanID** - The HEX 11bit Can address of the GPIO device
-   **Board Pin Layout** - The Mcu and board layout the GPIO is using

<img src="Board_pin_layout.jpg" title="Board_pin_layout.jpg" alt="Board_pin_layout.jpg" width="400" />

Select the appropriate mcu and board type for your GPIO unit.The firmware download has several board configurations pre setup in the code. Depending on which MCU you compile the firmware with will depend if that configuration is available to use.

-   **Speeduino Connection Type**
    -   **Not used** - This setting if the GPIO is a standalone device
    -   **Via Serial3** - This setting if the GPIO connects directly using its serial connection to the secondary serial port on the Speeduino(usually Serial3).
    -   **Via CanBus** - This setting if the GPIO is connected using its CanBus .This is pre-set at 11bit 250kbps.

<img src="Speeduino_connection.jpg" title="Speeduino_connection.jpg" alt="Speeduino_connection.jpg" width="400" />

-   **Speeduino Base CanBus Address** - The HEX 11bit Can address of the Speeduino ECU

### Programmable I/O and Output config

From the Programmable Outputs Tab you can select to configure the Universal outputs or the External IO

<img src="Prog_outputs1.jpg" title="Prog_outputs1.jpg" alt="Prog_outputs1.jpg" width="400" />

### Configuring Outputs

This page enables the configuration of the Universal Outputs.

<img src="Universal_outputs.jpg" title="Universal_outputs.jpg" alt="Universal_outputs.jpg" width="500" />

-   *' Output port*' - This is the output port on the GPIO device . To use first select a port from the output port list ,configure the setting for that port and then click "burn" to burn the changes to your GPIO device(if online)

<!-- -->

-   *' Port settings*'
    -   -   *' Enabled*' - Enables this output port
        -   *' Power on value*' - The active state of the port when the GPIO device starts up
        -   *' Active value*' - The active output state(Active High or Active Low)

<!-- -->

-   *' Active conditions*'
    -   -   *' Controller*' - This is fixed as the name of the GPIO device in use
        -   *' Output channel*' - This is either the realtime output data from the local GPIO device or data from External devices[(see external data configuration)]((see_external_data_configuration) "wikilink")).
        -   *' Logic option*' - The logical operation on the source value compared to the threshold , select &lt;,&gt;, or =
        -   *' Threshold*' - The Trigger threshold for the output vs the source data.
        -   ''' Hysteresis ''' - The threshold used with the threshold value

### Configuring external data sources

This page enable the configuration of the external data sources.

<img src="Externalio_config.jpg" title="Externalio_config.jpg" alt="Externalio_config.jpg" width="800" />

-   **External Input Channel Selection** - Enable/disable the external input channel

<!-- -->

-   **Source Base CanID** - The 11bit HEX CanID of the device the data is to be sourced from.

EG: In the picture this is set to 0x200 which was the Speeduino Base Can address set in "device configuration"

-   **Data from outchannel** - The outchannel number (from realtime outchannels) the data BEGINS at.

If the device is being accessed via CANBUS then this is the offset added to the base address +1 EG: in the picture it is 7 this would give a Can address of 0x208 or if a direct connection with Speeduino collect data from outchannel 7 (tpsADC)

-   **no: of bytes** - The number of bytes the data has , select 1 or 2 (a 1 byte value has a range 0-254 , a 2 byte from 0 - 1024).

EG: In the picture it shows 1. This is due to outchannel 7(tpsADC) being only 1 byte long with a value of 0 - 254.

### Hardware Test Page

To see this option you must enable it in project properties

<img src="Project_properties_select.jpg" title="Project_properties_select.jpg" alt="Project_properties_select.jpg" width="800" />

<img src="Project_properties_gpio.jpg" title="Project_properties_gpio.jpg" alt="Project_properties_gpio.jpg" width="800" />

Then a new Tab will appear on the main dash

<img src="Hardware_test_tab_gpio.jpg" title="Hardware_test_tab_gpio.jpg" alt="Hardware_test_tab_gpio.jpg" width="800" />

#### Test Output Hardware

This will allow you to individually turn on/off output ports that are available . The availability depends on the board you have selected and pin configuration.To start testing click on "Enable test mode" . The output ports that can be tested will then be unGreyed and can be clicked on/off. After testing either click "Stop test mode" or just close the window. Any outputs still activated will be switched off.

<img src="Hardware_output_test.jpg" title="Hardware_output_test.jpg" alt="Hardware_output_test.jpg" width="800" />

### Creating new board layouts/pin configurations

New board types can be easily added to GPIO. It requires changes to be made to two files , "Utils.ino" and the Tunerstudio ini file.

#### Utils.ino

In the utils.ino file is the indiivual configurations for each board option EG:

`     #if defined(CORE_AVR)`
`     case 1: // mega2560 demo V0.001`
`     pinOut[1] = 2; //`
`     pinOut[2] = 3; //`
`     pinOut[3] = 4; //`
`     pinOut[4] = 5; //`
`     pinOut[5] = 255; //`
`     pinOut[6] = 255; //`
`     pinOut[7] = 255; //`
`     pinOut[8] = 255; //`
`     pinOut[9] = 255; //`
`     pinOut[10] = 255; //`
`     pinOut[11] = 255; //`
`     pinOut[12] = 255; //`
`     pinOut[13] = 13; //`
`     pinOut[14] = 255; //`
`     pinOut[15] = 255; //`
`     pinOut[16] = 255; //`

`     pinIn[1] = 6;`
`     pinIn[2] = 7;`
`     pinIn[3] = 8;`
`     pinIn[4] = 9;`
`     pinIn[5] = 255;`
`     pinIn[6] = 255;`
`     pinIn[7] = 255;`
`     pinIn[8] = 255;`
`     pinIn[9] = 255;`
`     pinIn[10] = 255;`
`     pinIn[11] = 255;`
`     pinIn[12] = 255;`
`     pinIn[13] = 255;`
`     pinIn[14] = 255;`
`     pinIn[15] = 255;`
`     pinIn[16] = 255;`
`            `
`     pinAin[1] = A0;`
`     pinAin[2] = A1;`
`     pinAin[3] = A2;`
`     pinAin[4] = A3;`
`     pinAin[5] = A4;`
`     pinAin[6] = A5;`
`     pinAin[7] = A6;`
`     pinAin[8] = A7;`
`     pinAin[9] = A8;`
`     pinAin[10] = A9;`
`     pinAin[11] = A10;`
`     pinAin[12] = A11;`
`     pinAin[13] = A12;`
`     pinAin[14] = A13;`
`     pinAin[15] = A14;`
`     pinAin[16] = A15;`
`     `
`     break;`
`     #endif `

This is the entry for position 1 the STD mega2560 board.

To add a new board create a new case with all the above pins. Ensure you change the MCU define if it is not a mega2560 to that of the MCU you are compiling with(only mega2560 is currently supported in). Any pins that are not used must be set to 255. EG: adding a new entry called"mynewboard" in position 6.

`     #if defined(CORE_AVR)`
`     case 6: // mynewboard`
`     pinOut[1] = 2; //`
`     pinOut[2] = 3; //`
`     pinOut[3] = 255; //`
`     pinOut[4] = 5; //`
`     pinOut[5] = 255; //`
`     pinOut[6] = 255; //`
`     pinOut[7] = 255; //`
`     pinOut[8] = 255; //`
`     pinOut[9] = 255; //`
`     pinOut[10] = 4; //`
`     pinOut[11] = 255; //`
`     pinOut[12] = 255; //`
`     pinOut[13] = 13; //`
`     pinOut[14] = 255; //`
`     pinOut[15] = 255; //`
`     pinOut[16] = 255; //`

`     pinIn[1] = 6;`
`     pinIn[2] = 7;`
`     pinIn[3] = 8;`
`     pinIn[4] = 255;`
`     pinIn[5] = 255;`
`     pinIn[6] = 255;`
`     pinIn[7] = 255;`
`     pinIn[8] = 255;`
`     pinIn[9] = 255;`
`     pinIn[10] = 9;`
`     pinIn[11] = 255;`
`     pinIn[12] = 255;`
`     pinIn[13] = 255;`
`     pinIn[14] = 255;`
`     pinIn[15] = 255;`
`     pinIn[16] = 255;`
`            `
`     pinAin[1] = A0;`
`     pinAin[2] = A1;`
`     pinAin[3] = A2;`
`     pinAin[4] = A11;`
`     pinAin[5] = A4;`
`     pinAin[6] = A7;`
`     pinAin[7] = A6;`
`     pinAin[8] = 255;`
`     pinAin[9] = A8;`
`     pinAin[10] = 255;`
`     pinAin[11] = A10;`
`     pinAin[12] = 255;`
`     pinAin[13] = 255;`
`     pinAin[14] = 255;`
`     pinAin[15] = A14;`
`     pinAin[16] = A15;`
`     `
`     break;`
`     #endif `

`Add that in in the appropriate space ie between 5 and 7 (in they exist or at the end of the options if not).`

Saving and rcomplie the file and upload to your GPIO. Ensure the position used matches that in the ini file mods see next.

#### The Tunerstudio ini

This is located in the "reference" folder in the firmware download. Do not use MS notepad to edit this file!! A good editor is Notepad++ a few software download. The line rquiring editing is line 140

`#define PIN_LAYOUT = "ProMini GPIO v0.002", "Mega2560 GPIO v0.003", "STM32 BluePill GPIO V0.003", "Speeduino v0.3", "Speeduino v0.4", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID"  `

To add a new entry simply remove one of the "INVALID" and replace with your board name EG: the changed file adding a new board called "mynewboard"

`#define PIN_LAYOUT = "ProMini GPIO v0.002", "Mega2560 GPIO v0.003", "STM32 BluePill GPIO V0.003", "Speeduino v0.3", "Speeduino v0.4", "INVALID", "mynewboard", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID", "INVALID" `

This shows the new entry being a position 6(promini is position 0). The board config must be at position 6 in the utils.ino too. When you save the changed file and reload it into Tunerstudio your new board will appear as an option.