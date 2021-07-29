---
title: Interface Protocols
description: 
published: true
date: 2021-07-29T21:17:41.433Z
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
This returns all the current realtime data(120 bytes 29/07/2021).
The data value list speeduino replies with can be seen below , along with their function.ONLY the data value is sent NOT its order number or description.
The Format to send is 
'A'

Speeduino replies with 

0.  currentStatus.secl 
//secl is simply a counter that increments each second. Used to track unexpected resets (Which will reset this count to 0)

1. currentStatus.status1 
//status1 Bitfield

2. currentStatus.engine  
//Engine Status Bitfield

3. currentStatus.syncLossCounter

4. lowByte(currentStatus.MAP) 

5. highByte(currentStatus.MAP)

6. (byte)(currentStatus.IAT + CALIBRATION_TEMPERATURE_OFFSET)
//mat

7. (byte)(currentStatus.coolant + CALIBRATION_TEMPERATURE_OFFSET)
//Coolant ADC

8. currentStatus.batCorrection
//Battery voltage correction (%)

9. currentStatus.battery10
//battery voltage

10. currentStatus.O2
//O2

11. currentStatus.egoCorrection
//Exhaust gas correction (%)

12. currentStatus.iatCorrection
//Air temperature Correction (%)

13. currentStatus.wueCorrection
//Warmup enrichment (%)

14. lowByte(currentStatus.RPM) 
//rpm HB

15. highByte(currentStatus.RPM)
//rpm LB

16. (byte)(currentStatus.AEamount >> 1) 
//TPS acceleration enrichment (%) divided by 2 (Can exceed 255)

17. lowByte(currentStatus.corrections) 
//Total GammaE (%)

18. highByte(currentStatus.corrections) 
//Total GammaE (%)

19. currentStatus.VE1
//VE 1 (%)

20. currentStatus.VE2
//VE 2 (%)

21. currentStatus.afrTarget

22. currentStatus.tpsDOT
//TPS DOT

23. currentStatus.advance

24. currentStatus.TPS
// TPS (0% to 100%)
    
25. lowByte(currentStatus.loopsPerSecond)

26. highByte(currentStatus.loopsPerSecond)

27. lowByte(currentStatus.freeRAM)

28. highByte(currentStatus.freeRAM) 

29. (byte)(currentStatus.boostTarget >> 1 
//Divide boost target by 2 to fit in a byte

30. (byte)(currentStatus.boostDuty / 100)

31. currentStatus.spark
//Spark related bitfield

32. lowByte(currentStatus.rpmDOT)
// rpmDOT must be sent as a signed integer

33. highByte(currentStatus.rpmDOT)

34. currentStatus.ethanolPct
// Flex sensor value (or 0 if not used)

35. currentStatus.flexCorrection
// Flex fuel correction (% above or below 100)

36. currentStatus.flexIgnCorrection
//Ignition correction (Increased degrees of advance) for flex fuel

37. currentStatus.idleLoad

38. currentStatus.testOutputs

39. currentStatus.O2_2 
//O2

40. currentStatus.baro 
//Barometer value

41. lowByte(currentStatus.canin[0])

42. highByte(currentStatus.canin[0])

43. lowByte(currentStatus.canin[1])

44. highByte(currentStatus.canin[1])

45. lowByte(currentStatus.canin[2])

46. highByte(currentStatus.canin[2])

47. lowByte(currentStatus.canin[3])

48. highByte(currentStatus.canin[3])

49. lowByte(currentStatus.canin[4])

50. highByte(currentStatus.canin[4])

51. lowByte(currentStatus.canin[5])

52. highByte(currentStatus.canin[5])

53. lowByte(currentStatus.canin[6])

54. highByte(currentStatus.canin[6])

55. lowByte(currentStatus.canin[7])

56. highByte(currentStatus.canin[7])

57. lowByte(currentStatus.canin[8])

58. highByte(currentStatus.canin[8])

59. lowByte(currentStatus.canin[9])

60. highByte(currentStatus.canin[9])

61. lowByte(currentStatus.canin[10])

62. highByte(currentStatus.canin[10])

63. lowByte(currentStatus.canin[11])

64. highByte(currentStatus.canin[11])

65. lowByte(currentStatus.canin[12])

66. highByte(currentStatus.canin[12])

67. lowByte(currentStatus.canin[13])

68. highByte(currentStatus.canin[13])

69. lowByte(currentStatus.canin[14])

70. highByte(currentStatus.canin[14])

71. lowByte(currentStatus.canin[15])

72. highByte(currentStatus.canin[15])

73. currentStatus.tpsADC

74. getNextError()

75. lowByte(currentStatus.PW1)
//Pulsewidth 1 multiplied by 10 in ms. Have to convert from uS to mS.

76. highByte(currentStatus.PW1)
//Pulsewidth 1 multiplied by 10 in ms. Have to convert from uS to mS.

77. lowByte(currentStatus.PW2)
//Pulsewidth 2 multiplied by 10 in ms. Have to convert from uS to mS.

78. highByte(currentStatus.PW2)
//Pulsewidth 2 multiplied by 10 in ms. Have to convert from uS to mS.

79. lowByte(currentStatus.PW3)
//Pulsewidth 3 multiplied by 10 in ms. Have to convert from uS to mS.

80. highByte(currentStatus.PW3)
//Pulsewidth 3 multiplied by 10 in ms. Have to convert from uS to mS.

81. lowByte(currentStatus.PW4)
//Pulsewidth 4 multiplied by 10 in ms. Have to convert from uS to mS.

82. highByte(currentStatus.PW4)
//Pulsewidth 4 multiplied by 10 in ms. Have to convert from uS to mS.

83. currentStatus.status3

84. currentStatus.engineProtectStatus

85. lowByte(currentStatus.fuelLoad)

86. highByte(currentStatus.fuelLoad)

87. lowByte(currentStatus.ignLoad)

88. highByte(currentStatus.ignLoad)

89. lowByte(currentStatus.dwell)

90. highByte(currentStatus.dwell)

91. currentStatus.CLIdleTarget

92. currentStatus.mapDOT

93. lowByte(currentStatus.vvt1Angle)
//2 bytes for vvt1Angle

94. highByte(currentStatus.vvt1Angle)

95. currentStatus.vvt1TargetAngle; break;

96. (byte)(currentStatus.vvt1Duty); break;

97. lowByte(currentStatus.flexBoostCorrection)

98. highByte(currentStatus.flexBoostCorrection)

99. currentStatus.baroCorrection; break;

100. currentStatus.VE
//Current VE (%). Can be equal to VE1 or VE2 or a calculated value from both of them

101. currentStatus.ASEValue
//Current ASE (%)

102. lowByte(currentStatus.vss)

103. highByte(currentStatus.vss)

104. currentStatus.gear

105. currentStatus.fuelPressure

106. currentStatus.oilPressure

107. currentStatus.wmiPW

108. currentStatus.status4

109. lowByte(currentStatus.vvt2Angle)

110. highByte(currentStatus.vvt2Angle)

111. currentStatus.vvt2TargetAngle

112. (byte)(currentStatus.vvt2Duty)

113. currentStatus.outputsStatus

114. (byte)(currentStatus.fuelTemp + CALIBRATION_TEMPERATURE_OFFSET)
//Fuel temperature from flex sensor

115. currentStatus.fuelTempCorrection
//Fuel temperature Correction (%)

116. currentStatus.advance1
//advance 1 (%)

117. currentStatus.advance2
//advance 2 (%)

118. currentStatus.TS_SD_Status
//SD card status

119. lowByte(currentStatus.EMAP)

120. highByte(currentStatus.EMAP)

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
 The Format to send is 
'd'

Speeduino response
#### 'E' Command
receive command button commands
 The Format to send is 
'E'

Speeduino response

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
This will send out a human text readable string with details of the command characters and their functions.
 The Format to send is 
'?'

Speeduino response

===Command Help===
All commands are single character and are concatenated with their parameters without spaces.
Syntax:  command , parameter1 , parameter2 , parameterN 
===List of Commands===
A - Displays 31 bytes of currentStatus values in binary (live data)
B - Burn current map and configPage values to eeprom
C - Test COM port.  Used by Tunerstudio to see whether an ECU is on a given serial port. Returns a binary number.
N - Print new line.
P - Set current page.  Syntax:  P , pageNumber 
R - Same as A command
S - Display signature number
Q - Same as S command
V - Display map or configPage values in binary
W - Set one byte in map or configPage.  Expects binary parameters. 
Syntax:  W+<offset , newbyte 
t - Set calibration values.  Expects binary parameters.  Table index is either 0, 1, or 2.  
Syntax:  t+ , tble_idx , newValue1 , newValue2 , newValueN
Z - Display calibration values
T - Displays 256 tooth log entries in binary
r - Displays 256 tooth log entries
U - Prepare for firmware update. The next byte received will cause the Arduino to reset.
? - Displays this help page

## 2. Secondary Serial
The Secondary Serial interface enables an external device to access data from Speeduino or to expand the io of the Speeduino ECU. 
A full explanation of the features and operation of secondary serial can be found here. [Secondary_Serial_IO_interface](/en/Secondary_Serial_IO_interface)

## 3. CanBus
Canbus is only available directly on Teensy and STM32 MCU based Speeduino. Mega2560 based units need additional hardware such as DxControl GPIO .  
A full explanation of the features and operation of secondary serial can be found here.
[Canbus_Support](/en/Canbus_Support2)