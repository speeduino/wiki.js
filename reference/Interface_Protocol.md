---
title: Interface Protocols
description: 
published: true
date: 2021-07-29T20:02:53.848Z
tags: 
editor: markdown
dateCreated: 2021-07-29T18:45:18.652Z
---

# Interface Protocols
> This information is intended for Advanced users ,a typical user does not need to have an understanding of the protocols used by the Interfaces in order to use Speeduino.
{.is-warning}


Speeduino can be interfaced to via  several ways.
1. USB
2. Secondary Serial
3. Canbus (MCU dependant)

## 1. USB
This is the primary interface and the way in which TunerStudio connects to Speeduino in order to program/configure its settings.
Only a single device can communicate with Speeduino via the USB at a time, this is usually a laptop or other computer running the TunerStudio Application software.
It is also possible to use this interface with other devices if the correct communication protocol is used. Great care must be taken as it is possible to corrupt the configuration of your Speeduino MCU such that it no longer functions correctly or at all!
> It is highly recommended to connect Dashes,Dataloggers and other Third party devices via the Secondary Serial interface or Canbus(if available)
{.is-warning}


### The Primary Protocol
The Speeduino Primary serial protocol uses a request/response method, in that untill it recieves the correct set of commands it will not transmit data out.You must not send additional commands until the current one has been actioned.
All data is little-endian. (Low byte first.) Data is sent in binary format and there is no conversion to text.Commands are case sensitive.

### The Commands

#### 'a' Command
This Command is for legacy use only. It returns the current realtime data.

The format to send is 
'a' , '0' , '6'

- Speeduino replies with 
xxxx

#### 'A' Command
This returns the current realtime data.

The Format to send is 
'A'

- Speeduino replies with 
xxxx

#### 'b' Command
New EEPROM burn command to only burn a single page at a time
The Format to send is 
'b' , '0' , '*'
Where * is the config page number

Speeduino response
(none)

#### 'B' Command
This Burns the current configuration from RAM into EEPROM/non-volatile storage.
The Format to send is 
'B'

Speeduino response
(none)

#### 'C' Command
Test communications. This is used by Tunerstudio to see whether there is an ECU on a given serial port
The Format to send is 
'B'

Speeduino response

#### 'd' Command
Send a CRC32 hash of a given page

#### 'E' Command
receive command button commands

#### 'F' Command
send serial protocol version
The Format to send is 
'F'

Speeduino response
'0' , '0' , '1'
NOTE these values are sent in ASCII.

#### 'h' Command
Stop the tooth logger

#### 'H' Command
Start the tooth logger

#### 'j' Command
Stop the composite logger

#### 'J' Command
Start the composite logger

#### 'L' Command
List the contents of current page in human readable form

#### 'm' Command
Send the current free memory

#### 'M' Command

#### 'N' Command
 Displays a new line.  Like pushing enter in a text editor
 The Format to send is 
'N'

Speeduino response
' '
NOTE this is sent as plain text NOT ASCII


#### 'p' Command
Sets the current Page.This is the new foramt used by TunerStudio.
6 bytes are required:
-         2 byte - Page identifier
-         2 byte - offset
-         2 byte - Length

      
#### 'P' Command
Sets the current page. This is a legacy function and is no longer used by TunerStudio. It is maintained for compatibility with other systems.
 The Format to send is 
'P' , '*'
Where * is the Page number to be selected. this MUST be sent in ASCII format

Speeduino response
(none)

#### 'Q' Command
Send the code version. The response is a 20 byte long ASCII converted string
 The Format to send is 
'Q'

Speeduino response
'speeduino 202104-dev'
Above is an example reply, the actual reply will depend on what firmware is installed.
      
#### 'r' Command
This command has multiple functions, It requests specific data.This data may be realtime values or from RTC or SD card.

#### 'S' Command
send the code version. The response is a 20 byte long ASCII converted string
 The Format to send is 
'S'

Speeduino response
'Speeduino 2021.04-dev'
Above is an example reply, the actual reply will depend on what firmware is installed.

#### 't' Command
receive new Calibration info. 
Command structure: "t", tble_idx , data array.

#### 'T' Command
Send 256 tooth log entries to Tuner Studios tooth logger
      6 bytes required:
      2 - Page identifier
      2 - offset
      2 - Length

#### 'U' Command
User wants to reset the Arduino (probably for FW update)

#### 'V'Command
send VE table and constants in binary

#### 'w' Command
  
#### 'W'Command
receive new VE or constant 
'W' , offset , newbyte  

#### 'z' Command
Send the 256 tooth log entries to a terminal emulator

#### '?' Command
"===Command Help==="
"All commands are single character and are concatenated with their parameters"
"without spaces."
"Syntax:  command , parameter1 , parameter2 , parameterN , "    "===List of Commands==="
"A - Displays 31 bytes of currentStatus values in binary (live data)\n"
"B - Burn current map and configPage values to eeprom\n"
"C - Test COM port.  Used by Tunerstudio to see whether an ECU is on a given serial "
"    port. Returns a binary number."
         "N - Print new line."
         "P - Set current page.  Syntax:  P , pageNumber "
         "R - Same as A command"
         "S - Display signature number"
         "Q - Same as S command"
         "V - Display map or configPage values in binary"
         "W - Set one byte in map or configPage.  Expects binary parameters. "
         "    Syntax:  W+<offset , newbyte "
         "t - Set calibration values.  Expects binary parameters.  Table index is either 0, \n"
         "    1, or 2.  Syntax:  t+ , tble_idx , newValue1 , newValue2 , newValueN \n"
         "Z - Display calibration values\n"
         "T - Displays 256 tooth log entries in binary\n"
         "r - Displays 256 tooth log entries\n"
         "U - Prepare for firmware update. The next byte received will cause the Arduino to reset.\n"
         "? - Displays this help page"
## 2. Secondary Serial
The Secondary Serial interface enables an external device to access data from Speeduino or to expand the io of the Speeduino ECU. 
A full explanation of the features and operation of secondary serial can be found here. [Secondary_Serial_IO_interface](/en/Secondary_Serial_IO_interface)

## 3. CanBus
Canbus is only available directly on Teensy and STM32 MCU based Speeduino. Mega2560 based units need additional hardware such as DxControl GPIO .  
A full explanation of the features and operation of secondary serial can be found here.
[Canbus_Support](/en/Canbus_Support2)