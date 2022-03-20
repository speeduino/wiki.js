---
title: Интерфейсы ввода/вывода общего назначения
description: 
published: true
date: 2021-01-02T07:53:42.547Z
tags: 
editor: undefined
dateCreated: 2021-01-02T07:53:42.547Z
---

dxControl-GPIO, A GPIO Controller for Speeduino
===============================================

By Darren Siepka

### What is it?

dxControl-GPIO are a family of multipurpose general programmable input and output modules that can be used both in conjunction with the Speeduino engine ECU or standalone. The modules are programmed via Tunerstudio either via the serial port or over the integrated CanBus network(certain variants only)

The modules can use several different processor board types, including different arduino, teensy and stm32.

Io operations are programmed with logic, &lt; ,&gt;,= and bitwise AND . some variants offer 2 or even 3 connecting logic conditions.

### Versions

### GPIO MINI V0.001

This firmware supports up to 16 output channels , 16 input channels and 16 analog channels from local sources subject to MCU capability. MCU supported are currently Arduino Pro-Mini , Arduino Uno and Arduino Mega2560. The Output channels can be activated via one condition with logical operations of &lt; , &gt; and = Only onboard(local) io are supported in this version.

### GPIO MINI V0.002

This firmware offers the same features as V0.001 but with the ability to also access the output channel data values from a Speeduino ECU connected directly using the Speeduino Serial3 support.This firmware is currently only supported by Arduino Mega2560

### GPIO MINI V0.003

This firmware allows Speeduino to access the GPIO device's inputs(both digital and analog) to be displayed within TunerStudio or logged.Again in this version the GPIO device is still connected directly to the Speeduino via Serial3.This firmware is currently only supported by Arduino Mega2560

### GPIO MINI V3.001

This firmware has substantial improvements to the speed and stability of the Serial3 link with Speeduino. It also introduced the Display code module, which gives support for two displays of either I2C or SPI type. There are a few dispaly types pre configured and the list is growing. Current support

1.  SSD1306 , Hardware I2C
2.  SSH1106 , Hardware I2C
3.  SSH1106 , Hardware SPI
4.  SSH1106 , Hardware SPI

The display section offer users the ability to easily integrate a custom display solution without worrying about timing or the serial protocols itself. All GPIO system realtime variables are available to use withon the display routine.

### GPIO STD V1.000

This firmware offer the first of a range of BCU or "body control unit" features.

Max number of input pins supported is 32 (subject to mcu limitations)

Max number of output pins supported is 32 (subject to mcu limitations)

Max number of analog inputs supported is 16 (subject to mcu limitations)

The firmware supports up to 2 canbus modules via spi(mcp2515) specified as CAN0 and CAN1

CAN0 is used for broadcast and other general use

CAN1 is for OBD2 use. The port offers a wide range of data to any STD code reader. In this firmware only realtime data is available.If the Speeduino ECU is connected to GPIO then all the supported realtime from The Speeduino will be available to the OBD2 reader.

Inputs can be linked to canbus addresses and have their status periodically broadcast at a selectable rate on CAN0.

Outputs can be linked to a Canbus address and have their status changed upon reciept of a valid value on CAN0.They can also broadcast on a selectable can address, at a selectable rate the status of the output including and error or fault detection that the output stage may support.

This Firmware also offers Generic 11bit broadcasting of any outchannel data.

Software installation
---------------------

You can download the latest versions of GPIO here <https://github.com/Autohome2/Speeduino-GPIO>

If you are installing one of the versions with CANBUS you will need to install the libraries to your Arduino IDE if you dont have a current version installed.The libraries are included in the download.

The libraries used are:

Canbus .This is for the mcp2515 can modules if used. This library is included in the libraries folder in the GPIO git download.

U8g2. This is the display library used.This library is included in the libraries folder in the GPIO git download.

Flexcan from Pawelsky( for Teensy onboard Can)[1](https://github.com/pawelsky/FlexCAN_Library)

The flexcan library is included in the installation of Teensyduino into the Arduino IDE[2](https://www.pjrc.com/teensy/td_download.html)

The Tunerstudio INI file and base tune can be found in the reference folder for the specific variant you wish to install in the download . NOTE it is very important to install the correct ini and base msq for the selected firmware. A demo dash fie for tunerstudio may also be provided.

Realtime Data Organisation
--------------------------

Some versions of GPIO support the ability to access the realtime data from the GPIO I/O ports remotely via Either the Serial3 port or Canbus (see model versions). The data is stuctured as an offset address to the GPIO device real canID.

-   1 - 32 The Digital Inputs 1 through 32. These Send a value of 1023 if ON and 0 when OFF.

<!-- -->

-   33 - 64 The Digital Outputs 1 through 32. These have an ON value of 1023 and an Off value of 0.

<!-- -->

-   65 - 81 The Analog Inputs 0 through 15. These Send a value ranging from 0 to 1024.

example:

`if the GPIO real canID == 0x105 (261dec)`
`to request analog 0 you would request data from 261dec + 65dec == 326dec == 0x146`

The data is located in bytes 0 and 1 of the 8 transmitted , 0 being lsb 1 being msb.

Configuration
-------------

NOTE! The following information covers many versions of the GPIO family some Configurations,Features or Options may not be available in certain firmware code versions.

### Device Configuration

Device configuration can be found in the Tunerstudio Tab "Settings" then select "device configuration"

![](Gpio_config_2.jpg "Gpio_config_2.jpg")

-   **Device Real CanID** - The HEX 11bit Can address of the GPIO device
-   **Board Pin Layout** - The Mcu and board layout the GPIO is using

<img src="Board_pin_layout_2.jpg" title="Board_pin_layout_2.jpg" alt="Board_pin_layout_2.jpg" width="400" />

Select the appropriate mcu and board type for your GPIO unit.The firmware download has several board configurations pre setup in the code. Depending on which MCU you compile the firmware with will depend if that configuration is available to use.

-   **Speeduino Connection Type**
    -   **Not used** - This setting if the GPIO is a standalone device
    -   **Via Serial3** - This setting if the GPIO connects directly using its serial connection to the secondary serial port on the Speeduino(usually Serial3).
    -   **Via CanBus** - This setting if the GPIO is connected using its CanBus .This is pre-set at 11bit 250kbps.

<img src="Speeduino_connection_2.jpg" title="Speeduino_connection_2.jpg" alt="Speeduino_connection_2.jpg" width="400" />

-   **Speeduino Realtime Base CanBus Address** - The HEX 11bit Can address of the Speeduino ECU
-   **GPIO OBD Address** - The HEX 11bit CanBus address of the GPIO OBD port

### Project Properties

In project Properties you can enable the Hardware Testpage and CAN_COMMANDS. Select "File", "Vehicle Projects", "Project Properties".

<img src="Project_properties_select.jpg" title="Project_properties_select.jpg" alt="Project_properties_select.jpg" width="800" />

Yuo can now enable/disable the appropriate options. The project will reload after you confirm the changes.

<img src="Project_properties_gpio.jpg" title="Project_properties_gpio.jpg" alt="Project_properties_gpio.jpg" width="800" />

### Programmable I/O and Output config

From the Programmable Outputs Tab you can select to configure the Universal outputs or the External IO

<img src="Prog_outputs1.jpg" title="Prog_outputs1.jpg" alt="Prog_outputs1.jpg" width="400" />

### Configuring Universal Outputs

This page enables the configuration of the Universal Outputs.

<img src="Universal_outputs1_16.jpg" title="Universal_outputs1_16.jpg" alt="Universal_outputs1_16.jpg" width="500" />

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
        -   *' Logic option*' - The logical operation on the source value compared to the threshold , select &lt;,&gt;, =, or &
        -   *' Threshold*' - The Trigger threshold for the output vs the source data.
        -   ''' Hysteresis ''' - The threshold used with the threshold value
        -   ''' Linking Logical condition ''' This is the logical operation(if applicable/available) between the first and second data source.
        -   *' Output channel(second data source)*' - This is either the realtime output data from the local GPIO device or data from External devices[(see external data configuration)]((see_external_data_configuration) "wikilink")).
        -   *' Logic option(second data source)*' - The logical operation on the source value compared to the threshold , select &lt;,&gt;, =, or &
        -   *' Threshold(second data source)*' - The Trigger threshold for the output vs the source data.
        -   ''' Hysteresis(second data source) ''' - The threshold used with the threshold value

To use the universal outputs

1.  select the appropriate output port, be sure that the port is in use and not used by other functions it may clash operstion with.
2.  select "enabled"
3.  choose the power on state of the port
4.  choose if the port is to be active high or low(on or off)
5.  select the output channel the data is to be sourced from
6.  select the logic operation the data equation is to use.If you choose "&" then the threshold and hysteresis have slightly different purposes see example in next section.
7.  input the threshold value the data formula is to use
8.  input the hysteresis value . This value will stop the output switching on/off repeatedly if the data only changes a small amount .

`If logical operation was "&" then the threshold value is the value the data is logically ANDed to. and the result of that is compared to the value input in hysteresis.If the comparison of the ANDed value == the value in hysteresis then the output is active .                       This is useful for bit operations eg the digital inputs.`

Some controller firmware offer support for a second set of input and comparison , with and additional lnking logical operation between the two. This linking operation can be OR , AND and NOT(!).

1.  OR , the output is active if EITHER or BOTH statement is true.
2.  AND , the output is active only if BOTH statement are true.
3.  NOT , the output is active if ONLY ONE of the statement are true.

The second output channel,logic operation ,threshold and hysteresis must be chosen for the second comparison input in a similar manner to the first.

### External IO Configuration

### Configuring external data input sources

This page configures the external input data sources.

<img src="Externalio_config_2.jpg" title="Externalio_config_2.jpg" alt="Externalio_config_2.jpg" width="800" />

-   **Input Alias** - This is a user defined Alias name (up to 20 characters) for the input channel.This will appear on the gauge for the channel.

<!-- -->

-   **External Input Channel Selection** - Enable/disable the external input channel

<!-- -->

-   **Source Base CanID** - The 11bit HEX CanID of the device the data is to be sourced from.

EG: In the picture this is set to 0x200 which was the Speeduino Base Can address set in "device configuration"

-   **Data from outchannel** - The outchannel number (from realtime outchannels) the data BEGINS at.

If the device is being accessed via CANBUS then this is the offset added to the base address +1 EG: in the picture it is 7 this would give a Can address of 0x208 or if a direct connection with Speeduino collect data from outchannel 7 (tpsADC)

-   **no: of bytes** - The number of bytes the data has , select 1 or 2 (a 1 byte value has a range 0-254 , a 2 byte from 0 - 1024).

EG: In the picture it shows 1. This is due to outchannel 7(tpsADC) being only 1 byte long with a value of 0 - 254.

### Hardware Test Page

To see this option you must enable it in [Project Properties](#project_properties "wikilink")

Then a new Tab will appear on the main dash

<img src="Hardware_test_tab_gpio.jpg" title="Hardware_test_tab_gpio.jpg" alt="Hardware_test_tab_gpio.jpg" width="800" />

-   Test Output Hardware
-   Test Input Hardware

#### Test Output Hardware

This will allow you to individually turn on/off output ports that are available . The availability depends on the board you have selected and pin configuration.

To start testing click on "Enable test mode" . The output ports that can be tested will then be unGreyed and can be clicked on/off. After testing either click "Stop test mode" or just close the window. Any outputs still activated will be switched off.

<img src="Hardware_output_test.jpg" title="Hardware_output_test.jpg" alt="Hardware_output_test.jpg" width="800" />

#### Test Input Hardware

This will allow you to monitor operation of the digital inputs or force the input ,overriding what GPIO sees.

The availability depends on the board you have selected and pin configuration.

Whilst test mode is NOT enabled you can observe the current state of an input pin on the "STATE" button for the appropriate input.This will be black when active(high) and grey when not(low).When test mode is enabled this feature does not work.

To start overide testing click on "Enable test mode" . The Input ports that can be tested will then be unGreyed and can be clicked on/off. After testing either click "Stop test mode" or just close the window. Any Inputs overriden will be returned to their current true input state.

<img src="Test_input_hardware.jpg" title="Test_input_hardware.jpg" alt="Test_input_hardware.jpg" width="800" />

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

### Display Configuration

GPIO(firmware versions may vary level of support) supports up to Two independant screens. They can be connected via I2C or SPI.Each display can be of either type.The display support is configured before uploading the firmware via settings in the display.h file. In the display.h file you will see the following(typical extract from file , may vary)

#### Step1 activate the display and its type

if a display is not in use then comment out the line DISP1_ACTIVE for display 1 or DISP2_ACTIVE for display 2 If display1 is I2C set DISP1_ROUTE to 0 if it is connected to the hardware I2C port or enter the mux address if a TCA9548A I2C mux is in use. The same applies to display2 Uncomment the appropriate USE option according to your display model

//display module options . only choose one of the following defines for display selection , comment out the unused ones //set display 1 type

1.  define DISP1_ACTIVE 1 // 1 if in use or comment out
2.  define DISP1_ROUTE 0 // direct i2c == 0 , remote == mux address
3.  define DISP1_USE_SSD1106_I2C

//\#define DISP1_USE_SSD1306_I2C //\#define DISP1_USE_SSD1106_SPI //\#define DISP1_USE_SSH1106_SPI

//set display 2 type //\#define DISP2_ACTIVE 1

1.  define DISP2_ROUTE 0 // direct i2c == 0 , remote == mux address
2.  define DISP2_USE_SSD1106_I2C

//\#define DISP2_USE_SSD1306_I2C //\#define DISP2_USE_SSD1106_SPI //\#define DISP2_USE_SSH1106_SPI

#### Step 2 , set display size

This feature is not currently in use as only displays of 128x64 are supported

//set display size

1.  define USE_128x64

//\#define USE_128x128

#### Step 3, set the port used by the display

Set The correct pins for your display(1 and/or 2) depending on where they are connected to. DO NOT USE PINS FOR THE DISPLAY THAT ARE CONFIGURED AS PORTS IN UTILS.ino FOR IO PURPOSES!

SPI NOTES: hardware spi on mega2560 mosi == 51, clk(sck) == 52 I2C NOTES: hardware i2c on the mega2560 sda == 20, scl == 21

//set pins for screens in spi mode //display 1

1.  define DISPLAY1_CS 7 //pin to use for CS
2.  define DISPLAY1_DC 6 //pin to use for DC
3.  define DISPLAY1_RESET 8

//display 2

1.  define DISPLAY2_CS 7 //pin to use for CS
2.  define DISPLAY2_DC 6 //pin to use for DC
3.  define DISPLAY2_RESET 8

#### Step 4 , add your display code

now in display.ino add your display code in the "driveDisplay()" function For display1 add the cide after the \#if defined DISP1_ACTIVE For display2 add the cide after the \#if defined DISP2_ACTIVE

HINT!: keep your display code as short as possible to prevent timing hangups, and DO NOT use delay or other blocking functions!

### Canbus Configuration

<img src="Canbus_broadcast_config.jpg" title="fig:Canbus_broadcast_config.jpg" alt="Canbus_broadcast_config.jpg" width="800" /> The CanBus Configuration menu tab options are only visible when CAN_COMMANDS are enabled in [Project Properties](#project_properties "wikilink").

#### CanBus Module Configuration

<img src="Canbus_broadcast_config_B.jpg" title="fig:Canbus_broadcast_config_B.jpg" alt="Canbus_broadcast_config_B.jpg" width="800" /> Here you enable the CAN0 and CAN1 Canbus modules. These modules are MCP2515 SPI modules connected to the hardware spi ports on the mcu.

#### Generic 11bit CanBus Broadcast

The 11bit CanBus Broadast feature offers the ability to periodically broadcast on a specified can address the values from any Outchannel on GPIO. This could include external data read from Speeduino for instance using the [Configuring external data sources](#Configuring_external_data_sources "wikilink") method. <img src="Canbus_broadcast_config_C.jpg" title="fig:Canbus_broadcast_config_C.jpg" alt="Canbus_broadcast_config_C.jpg" width="800" />

-   **Name Alias** - This is a user defined Alias name (up to 20 characters) for the broadcast channel .

<!-- -->

-   **CAN broadcast channel on/off** - Enable/disable the broadcast channel

<!-- -->

-   **Source OutChannel** - The OutChannel data source on GPIO.

<!-- -->

-   **Can Broadcast Adddress** - The 11bit HEX Can Address the OutChannel data will be broadcast as being assigned to.

<!-- -->

-   **Broadcast Freq** - This is the Frequency the OutChannel data is broadcast at.

### Remote CanBus Triggers

The Remote Trigger menu tab options are only visible when CAN_COMMANDS are enabled in [Project Properties](#project_properties "wikilink").

Remote CanBus triggers come in four varietys , Digtial Input, Analog Input, Digital Output, PWM Output.

They are part of the BCU or BODY CONTROL UNIT functions introduced in the GPIO STD firmwares.

The Remote inputs attach a input port on GPIO to a canbus address. The current status of the input pin is broadcast on the assigned canbus address at the frequency chosen.

The Remote Outputs attach an output port on GPIO to a canbus address. The current status of the output port can be changed by sending a valid value to GPIO on that canbus address.

<img src="Digital_remote_canbus_output_config.jpg" title="Digital_remote_canbus_output_config.jpg" alt="Digital_remote_canbus_output_config.jpg" width="800" />

#### Digital Remote Input Triggers

<img src="remote_digital_input.jpg" title="remote_digital_input.jpg" alt="remote_digital_input.jpg" width="800" />

There are two pages of these configs , channels 0 -15 and 16-31. They have both the same appearance and functions so we will just refer to 0-15 page here.

-   **Name Alias** - This is a user defined Alias name (up to 20 characters) for the Remote Input Trigger .

<!-- -->

-   **External In** - Enable/disable the remote input channel

<!-- -->

-   **Can Address** - The 11bit HEX Can Address the remote Input is linked to.

<!-- -->

-   **Input Port** - This is the physical Input port on GPIO the channel is linked to.

<!-- -->

-   **Broadcast Freq** - This is the Frequency the status of the input pin port is broadcast at.

<!-- -->

-   **Available Input Ports** - This is a list of all Input ports on GPIO. If the port is active(enabled and assigned a pin in utils.ino) then it will be black , else it will be grey.

It is important to NEVER choose a greyed out port as an Input Port selection!

##### Use of Remote Digital input port

To use this feature

1.  Enable the channel you wish to configure
2.  (optional) set a "alias" name to make remembering the data source easier.
3.  choose the Can Address you wish the data to use.
4.  select the input port you wish to broadcast the value of.
5.  select the frequency the broadcast will be made at , 4,5,10,15, and 20Hz

The broadcast will be made to the specified address at the frequency set with bit0 of Byte 0 (of the 8 can bytes) reflecting the port state.

#### Digital Remote Output Triggers

<img src="Remote_out_triggers.jpg" title="Remote_out_triggers.jpg" alt="Remote_out_triggers.jpg" width="800" />

There are two pages of these configs , channels 0 -15 and 16-31. They have both the same appearance and functions so we will just refer to 0-15 page here.

-   **Name Alias** - This is a user defined Alias name (up to 20 characters) for the Remote Output Trigger .

<!-- -->

-   **External Out** - Enable/disable the remote output channel

<!-- -->

-   **Can Address** - The 11bit HEX Can Address the remote output is linked to.

<!-- -->

-   **Output Port** - This is the physical output port on GPIO the channel is linked to.

<!-- -->

-   **Send Status?** - Enable/Disable the output status broadcast.

<!-- -->

-   **Status Can Address** - The 11bit HEX Can Address the remote output status is broadcasted on.If this option is not available then the data is broadcast on the same can address.

<!-- -->

-   **Status Broadcast Frequency** - choose the frequency that the status data is broadcast 4, 5, 10 ,15 and 20Hz.

<!-- -->

-   **Available Output Ports** - This is a list of all output ports on GPIO. If the port is active(enabled and assigned a pin in utils.ino) then it will be black , else it will be grey.

It is important to NEVER choose a greyed out port as an Output Port selection!

##### Use of remote outputs

To trigger an output GPIO must receive the following

1.  Can Address matching as configured.
2.  In byte 0 (of the 8 can bytes) the on/off bit set or reset(bit 0).

##### Status broadcast

If the status broadcast option is chosen then the following information is periodically broadcast(according to the frequency setting)

` Function                          Bit`
`REMOTE_OUT_OFF                      0`
`REMOTE_OUT_ON                       1`
`REMOTE_OUT_OPENCIRCUIT              2`
`REMOTE_OUT_SHORTCIRCUIT             3`
`REMOTE_OUT_THERMALOVERLOAD          4`
`REMOTE_OUT_CURRENTOVERLOAD          5`
`REMOTE_OUT_unused6                  6`
`REMOTE_OUT_unused7                  7`

These bit values are sent in byte 1 (of the 8 can bytes).

#### Analog Remote Input Triggers

<img src="Remote_analog_input.jpg" title="Remote_analog_input.jpg" alt="Remote_analog_input.jpg" width="800" />

-   **Name Alias** - This is a user defined Alias name (up to 20 characters) for the Remote Analog Input .

<!-- -->

-   **Enable Ain** - Enable/disable the remote analog input channel

<!-- -->

-   **Can Address** - The 11bit HEX Can Address the remote analog Input is linked to.

<!-- -->

-   **Input Port** - This is the physical analog Input port on GPIO the channel is linked to.

<!-- -->

-   **Broadcast Freq** - This is the Frequency the status of the analog input pin port is broadcast at.

<!-- -->

-   **Available Analog Input Ports** - This is a list of all Analog Input ports on GPIO. If the port is active(enabled and assigned a pin in utils.ino) then it will be black , else it will be grey.

It is important to NEVER choose a "greyed out" port as an Analog Input Port selection!

##### Use of Remote Analog input port

To use this feature

1.  Enable the channel you wish to configure
2.  (optional) set a "alias" name to make remembering the data source easier.
3.  choose the Can Address you wish the data to use.
4.  select the Analog input port you wish to broadcast the value of.
5.  select the frequency the broadcast will be made at , 4,5,10,15, and 20Hz

The broadcast will be made to the specified address at the frequency set with the lsb to Byte 0 and the msb to byte 1 (of the 8 can bytes) reflecting the port state(0-1024).

#### PWM Remote Output Triggers

under development!