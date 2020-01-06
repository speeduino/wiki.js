Overview
--------

The Arduino Mega2560 version of Speeduino supports the use of Serial3 for supplemetry IO.The proposed STM32 and Teensy3.5 versions use Serial2 . On a Mega 2560 Serial3 can be found on the board at pins 14 and 15.The connection speed is 115200baud.

Settings
--------

### Enable Secondary IO interface

To enable use of the Secondary io interface it must be enabled in TunerStudio.

Dependant on if CAN_COMMANDS have been enabled will vary the type of dropdown menu you will see

![](Auxindrop_nocan.jpg "fig:Auxindrop_nocan.jpg") ![](Auxindrop_withcan.jpg "fig:Auxindrop_withcan.jpg")

select option "Secondary Serial IO Interface" or "CanBus/Secondary Serial IO Interface" as appropriate.

### Secondary IO Configuration Options

Again dependant on if CAN_COMMANDS have been enabled will vary what options you have to enable Secondary serial.

![](EnableSecondarySerial_nocan.jpg "fig:EnableSecondarySerial_nocan.jpg") <img src="EnableSecondarySerial_withcan.jpg" title="fig:EnableSecondarySerial_withcan.jpg" alt="EnableSecondarySerial_withcan.jpg" width="700" />

-   **Enable options**
-   1. Disabled
-   2. Enabled Secondary IO via Serial port
-   3. Enabled Secondary IO via canbus (this option will only be available when CAN_COMMANDS are enabled

How to use it
-------------

Depending on if the secondary port is a simple serial port or is a canbus port there are several things that the Secondary io interface is capable of.

-   1. Retreive the current realtime data in full from Speeduino just as is sent to TunerStudio.
-   2. Retrieve specific current realtime data from Speeduino.
-   2. Read in the Analog data values from 16 remote sensors as requested by Speeduino.
-   3. Acivate External Outputs(coming soon!)

Retrieve realtime data
----------------------

To get Speeduino to send out the realtime data to your device connected on a Secondary Serial IO port you must send either an "A" or an "r" to it.

-   **Send an "A"**

If you send an "A" to the port it will reply with ,

"A" confirming the received instruction (sent as 0x41 in hex),

The port will then transmit ALL the realtime data.

-   **Send an "r"**

if you send an "r" to the port you must also send 6 further bytes immediately after the "r". These are the Speeduino TS canID, the r type command 0x30(48 in decimal), a 2 byte offset and a 2 byte length. the offset is the position in he realtime list you want the data returned to start from and the 2 byte length is the number of bytes you want returned. the bytes are sent LSB first .

The port will reply with ,

"r" confirming the received instruction (send as 0x72 in hex) ,

The port will now transmit a single byte in hex ,this is the value of the "r" type command, confirming what was requested (this is typically 0x30).

The port will then transmit the realtime data requested starting at the byte position sent for the number of bytes length.

-   *' The Realtime Data List*'

As of 05/10/2017 the data list is as follows

BIT 0 - currentStatus.secl

`     secl is simply a counter that increments each second`

1 - currentStatus.squirt

`     Squirt Bitfield`

2 - currentStatus.engine

`     Engine Status Bitfield`

3 - (byte)(divu100(currentStatus.dwell))

`     Dwell in ms * 10`

4 - lowByte(currentStatus.MAP)

5 - highByte(currentStatus.MAP)

6 - (byte)(currentStatus.IAT + CALIBRATION_TEMPERATURE_OFFSET)

`     mat`

7 - (byte)(currentStatus.coolant + CALIBRATION_TEMPERATURE_OFFSET)

`     Coolant ADC`

8 - currentStatus.batCorrection

`     Battery voltage correction (%)`

9 - currentStatus.battery10

`     battery voltage`

10 - currentStatus.O2;

`     primary O2`

11 - currentStatus.egoCorrection

`     Exhaust gas correction (%)`

12 - currentStatus.iatCorrection

`     Air temperature Correction (%)`

13 - currentStatus.wueCorrection

`     Warmup enrichment (%)`

14 - lowByte(currentStatus.RPM)

`    rpm LB`

15 - highByte(currentStatus.RPM)

`     rpm HB`

16 - currentStatus.TAEamount

`     acceleration enrichment (%)`

17 - currentStatus.corrections

`     Total GammaE (%)`

18 - currentStatus.VE

`     Current VE 1 (%)`

19 - currentStatus.afrTarget

`     chosen afr target`

20 - lowByte(currentStatus.PW1);

`     Pulsewidth 1 multiplied by 10 in ms. Have to convert from uS to mS.`

21 - highByte(currentStatus.PW1);

`     Pulsewidth 1 multiplied by 10 in ms. Have to convert from uS to mS.`

22 - currentStatus.tpsDOT

`     TPS DOT`

23 - currentStatus.advance

`     Current spark advance`

24 - currentStatus.TPS

`     TPS (0% to 100%)`

25 - lowByte(currentStatus.loopsPerSecond)

`     loops per second LB`

26 - highByte(currentStatus.loopsPerSecond)

`     loops per second HB`

27 - lowByte(currentStatus.freeRAM)

`     freeRam LB`

28 - highByte(currentStatus.freeRAM)

`     freeRam HB`

29 - currentStatus.boostTarget

`     Target boost pressure`

30 - currentStatus.boostDuty

`     current pwm boost dutycycle`

31 - currentStatus.spark

`     Spark related bitfield`

32 - lowByte(currentStatus.rpmDOT)

`     rpmDOT must be sent as a signed integer`

33 - highByte(currentStatus.rpmDOT)

`     rpmDOT HB`

34 - currentStatus.ethanolPct

`     Flex sensor value (or 0 if not used)`

35 - currentStatus.flexCorrection

`     Flex fuel correction (% above or below 100)`

36 - currentStatus.flexIgnCorrection

`     Ignition correction (Increased degrees of advance) for flex fuel`

37 - currentStatus.idleLoad

`     idleload`

38 - currentStatus.testOutputs

`     testoutputs bitfield`

39 - currentStatus.O2_2

`     Second O2`

40 - currentStatus.baro

`     Barometer value`

41 - lowByte(currentStatus.canin\[0\]);

42 - highByte(currentStatus.canin\[0\]);

43 - lowByte(currentStatus.canin\[1\]);

44 - highByte(currentStatus.canin\[1\]);

45 - lowByte(currentStatus.canin\[2\]);

46 - highByte(currentStatus.canin\[2\]);

47 - lowByte(currentStatus.canin\[3\]);

48 - highByte(currentStatus.canin\[3\]);

49 - lowByte(currentStatus.canin\[4\]);

50 - highByte(currentStatus.canin\[4\]);

51 - lowByte(currentStatus.canin\[5\]);

52 - highByte(currentStatus.canin\[5\]);

53 - lowByte(currentStatus.canin\[6\]);

54 - highByte(currentStatus.canin\[6\]);

55 - lowByte(currentStatus.canin\[7\]);

56 - highByte(currentStatus.canin\[7\]);

57 - lowByte(currentStatus.canin\[8\]);

58 - highByte(currentStatus.canin\[8\]);

59 - lowByte(currentStatus.canin\[9\]);

60 - highByte(currentStatus.canin\[9\]);

61 - lowByte(currentStatus.canin\[10\]);

62 - highByte(currentStatus.canin\[10\]);

63 - lowByte(currentStatus.canin\[11\]);

64 - highByte(currentStatus.canin\[11\]);

65 - lowByte(currentStatus.canin\[12\]);

66 - highByte(currentStatus.canin\[12\]);

67 - lowByte(currentStatus.canin\[13\]);

68 - highByte(currentStatus.canin\[13\]);

69 - lowByte(currentStatus.canin\[14\]);

70 - highByte(currentStatus.canin\[14\]);

71 - lowByte(currentStatus.canin\[15\]);

72 - highByte(currentStatus.canin\[15\]);

73 - currentStatus.tpsADC

`     TPS (Raw 0-255)`

74 - getNextError()

`     Error codes`

Read external analog data from a remote device
----------------------------------------------

To get Speeduino to read analog data over Serial3 or CANBUS you must enable it. this is done in TS on an per channel basis.

<img src="Canbus_input_config_new.jpg" title="Canbus_input_config_new.jpg" alt="Canbus_input_config_new.jpg" width="800" />

You set the Source Can address(this is the address of the remote device that you wish to source the data value from.This is not used in direct Serial3 connections), input start byte number,input parameter number of bytes according to the sensor being accessed. Once enabled and configured Speeduino will periodically poll for that device on Serial3

Using Example 1 this is how to get your remote device to reply to the request from Speeduino for data.

### IF the remote device is connected directly to Serial3.

Speeduino will send an "R"

Followed by the Can input channel that the data will be placed into , and then the Can address the data is to be sourced from(this is sent in two bytes LSB first). As your remote device is connected directly to the Serial3 port then you can ignore the Can Address.

### If the remote device is connected via CANBUS.

Speeduino will issue an "R" request for the Can address selected for the Can input channel.

Speeduino will now await the response.

### IF the remote device is connected directly to Serial3.

You must first send an "G" , Then a '1' to flag the cmd is valid, Then the Can input channel (this is the channel number that Speeduino issued with the request. Then send 8 bytes of data. The Data you wish to send is placed in bytes 0 and 1 (LSB and MSB respectively)if it is two bytes long or in byte 0 if it is only a single byte long .

### If the remote device is connected via CANBUS.

The remote device upon hearing its ID requested will respond to the Speeduino(at the address that was sent in the outgoing packet) with the Can input channel and 8 bytes of data.It is recommended that the Data you wish to send is placed in bytes 0 and 1 (LSB and MSB respectively)if it is two bytes long or in byte 0 if it is only a single byte long, but the data can be placed in any of the data bytes(just ensure that Speeduino is configured to read those bytes in the config table above.

The value sent is readable in Tunerstudio using the CanIN gauges