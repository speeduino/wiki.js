---
title: Interface Protocols
description: 
published: true
date: 2021-07-29T23:09:00.579Z
tags: 
editor: undefined
dateCreated: 2021-07-29T18:45:18.652Z
---

# Interface Protocols
> This information is intended for Advanced users ,a typical user does not need to have an understanding of the protocols used by the Interfaces in order to use Speeduino.
{.is-warning}


Speeduino can be interfaced to via  several ways.
1. USB
2. Secondary Serial
3. Canbus (MCU dependent)

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
The data value list speeduino replies with can be seen below , along with their function.ONLY the data value is sent NOT its order number or description.

The format to send is 
'a' , '0' , '6'

Speeduino replies with 

1. highByte(currentStatus.secl)

2. lowByte(currentStatus.secl)

3. highByte(currentStatus.PW1)

4. lowByte(currentStatus.PW1)

5. highByte(currentStatus.PW2)

6. lowByte(currentStatus.PW2)

7. highByte(currentStatus.RPM)

8. lowByte(currentStatus.RPM)

9. highByte(currentStatus.advance * 10)

10. lowByte(currentStatus.advance * 10)

11. currentStatus.nSquirts);

12. currentStatus.engine);

13. currentStatus.afrTarget);

14. currentStatus.afrTarget); // send twice so afrtgt1 == afrtgt2

15. (99)
// send dummy data as we don't have wbo2_en1

16. (99)
// send dummy data as we don't have wbo2_en2

17. highByte(currentStatus.baro * 10)

18. lowByte(currentStatus.baro * 10)

19. highByte(currentStatus.MAP * 10)

20. lowByte(currentStatus.MAP * 10)

21. highByte(currentStatus.IAT * 10)

22. lowByte(currentStatus.IAT * 10)

23. highByte(currentStatus.coolant * 10)

24. lowByte(currentStatus.coolant * 10)

25. highByte(currentStatus.TPS * 10)

26. lowByte(currentStatus.TPS * 10)

27. highByte(currentStatus.battery10)

28. lowByte(currentStatus.battery10)

29. highByte(currentStatus.O2)

30. lowByte(currentStatus.O2)

31. highByte(currentStatus.O2_2)

32. lowByte(currentStatus.O2_2)

33. (99)
// blank data for knock

34. (99)
// blank data for knock

35. highByte(currentStatus.egoCorrection * 10)
// egocor1

36. lowByte(currentStatus.egoCorrection * 10)
  // egocor1
  
37. highByte(currentStatus.egoCorrection * 10)
// egocor2

38. lowByte(currentStatus.egoCorrection * 10)
// egocor2
  
39. highByte(currentStatus.iatCorrection * 10)
// aircor

40. lowByte(currentStatus.iatCorrection * 10)
// aircor
  
41. highByte(currentStatus.wueCorrection * 10)
// warmcor

42. lowByte(currentStatus.wueCorrection * 10)
// warmcor

43. (99)
// blank data for accelEnrich

44. (99)
// blank data for accelEnrich

45. (99)
// blank data for tpsFuelCut

46. (99)
// blank data for tpsFuelCut

47. (99)
// blank data for baroCorrection

48. (99)
// blank data for baroCorrection

49. highByte(currentStatus.corrections * 10)
// gammaEnrich

50. lowByte(currentStatus.corrections * 10)
// gammaEnrich

51. highByte(currentStatus.VE * 10)
// ve1

52. lowByte(currentStatus.VE * 10)
// ve1

53. highByte(currentStatus.VE2 * 10)
// ve2

54. lowByte(currentStatus.VE2 * 10)
// ve2

55. (99) 
// blank data for iacstep

56. (99)
// blank data for iacstep

57. (99)
// blank data for cold_adv_deg

58. (99)
// blank data for cold_adv_deg

59.  highByte(currentStatus.tpsDOT * 10)
// TPSdot

60.  lowByte(currentStatus.tpsDOT * 10)
// TPSdot

61.  highByte(currentStatus.mapDOT * 10) 
// MAPdot

62.  lowByte(currentStatus.mapDOT * 10)
// MAPdot

63.  highByte(currentStatus.dwell * 10) 
// dwell

64.  lowByte(currentStatus.dwell * 10)
// dwell

65. (99)
// blank data for MAF

66. (99)
// blank data for MAF

67. (currentStatus.fuelLoad*10) 
// fuelload

68. (99) 
// blank data for fuelcor

69. (99)
// blank data for fuelcor

70. (99)
// blank data for portStatus

71. highByte(currentStatus.advance1 * 10)

72. lowByte(currentStatus.advance1 * 10)
  
73. highByte(currentStatus.advance2 * 10)

74. lowByte(currentStatus.advance2 * 10)

75. to 114.  (99)
// bytes 75 to 114 blank data to fill buffer

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

95. currentStatus.vvt1TargetAngle

96. (byte)(currentStatus.vvt1Duty)

97. lowByte(currentStatus.flexBoostCorrection)

98. highByte(currentStatus.flexBoostCorrection)

99. currentStatus.baroCorrection

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

#### 'c' Command
Send the current loops/sec value

The Format to send is 
'c'

Speeduino response
lowByte(currentStatus.loopsPerSecond) , highByte(currentStatus.loopsPerSecond)

#### 'C' Command
Test communications. This is used by Tunerstudio to see whether there is an ECU on a given serial port
The Format to send is 
'B'

Speeduino response

#### 'd' Command
Send a CRC32 hash of a given page
 The Format to send is 
'd' , '0' , '*'
where * is the value to calc the hash of.

The response is 3 bytes calculated as follows.
CRC32_val = calculateCRC32( * )
((CRC32_val >> 24) & 255) )
 byte 1 = ( ((CRC32_val >> 16) & 255) )
 byte 2 = ( ((CRC32_val >> 8) & 255) )
 byte 3 = ( (CRC32_val & 255) )
 
Speeduino response
byte 1 , byte 2 , byte 3

#### 'E' Command
Command button commands.
Commands are built as cmdCombined = word(cmdGroup, cmdValue).
this is the current(29/07/2021) list of valid cmdCombined command values.

TS_CMD_TEST_DSBL  256
TS_CMD_TEST_ENBL  257

TS_CMD_INJ1_ON    513
TS_CMD_INJ1_OFF   514
TS_CMD_INJ1_50PC  515
TS_CMD_INJ2_ON    516
TS_CMD_INJ2_OFF   517
TS_CMD_INJ2_50PC  518
TS_CMD_INJ3_ON    519
TS_CMD_INJ3_OFF   520
TS_CMD_INJ3_50PC  521
TS_CMD_INJ4_ON    522
TS_CMD_INJ4_OFF   523
TS_CMD_INJ4_50PC  524
TS_CMD_INJ5_ON    525
TS_CMD_INJ5_OFF   526
TS_CMD_INJ5_50PC  527
TS_CMD_INJ6_ON    528
TS_CMD_INJ6_OFF   529
TS_CMD_INJ6_50PC  530
TS_CMD_INJ7_ON    531
TS_CMD_INJ7_OFF   532
TS_CMD_INJ7_50PC  533
TS_CMD_INJ8_ON    534
TS_CMD_INJ8_OFF   535
TS_CMD_INJ8_50PC  536
TS_CMD_IGN1_ON    769
TS_CMD_IGN1_OFF   770
TS_CMD_IGN1_50PC  771
TS_CMD_IGN2_ON    772
TS_CMD_IGN2_OFF   773
TS_CMD_IGN2_50PC  774
TS_CMD_IGN3_ON    775
TS_CMD_IGN3_OFF   776
TS_CMD_IGN3_50PC  777
TS_CMD_IGN4_ON    778
TS_CMD_IGN4_OFF   779
TS_CMD_IGN4_50PC  780
TS_CMD_IGN5_ON    781
TS_CMD_IGN5_OFF   782
TS_CMD_IGN5_50PC  783
TS_CMD_IGN6_ON    784
TS_CMD_IGN6_OFF   785
TS_CMD_IGN6_50PC  786
TS_CMD_IGN7_ON    787
TS_CMD_IGN7_OFF   788
TS_CMD_IGN7_50PC  789
TS_CMD_IGN8_ON    790
TS_CMD_IGN8_OFF   791
TS_CMD_IGN8_50PC  792

TS_CMD_STM32_REBOOT     12800
TS_CMD_STM32_BOOTLOADER 12801

TS_CMD_VSS_60KMH  39168 //0x99x00
TS_CMD_VSS_RATIO1 39169
TS_CMD_VSS_RATIO2 39170
 
TS_CMD_VSS_RATIO3 39171
TS_CMD_VSS_RATIO4 39172
TS_CMD_VSS_RATIO5 39173
TS_CMD_VSS_RATIO6 39174

 The Format to send is 
'E' , cmdGroup , cmdValue   
eg for cmdtestspk1on  send  'E' , '0x03' , '0x01' 

Speeduino response
(none , hardware action only)

#### 'F' Command
send serial protocol version
The Format to send is 
'F'

Speeduino response
'0' , '0' , '1'
NOTE these values are sent in ASCII.

#### 'h' Command
Stop the tooth logger
This reconnects the crank and cam input interrupts back to the normal input trigger code.

The Format to send is 
'h'

Speeduino response
(none)

#### 'H' Command
Start the tooth logger
This disconnects the crank and cam input interrupts from their normal input trigger code and routes them to the tooth logger code.An acknowledge reply is made by speeduino.

The Format to send is 
'H'

Speeduino response
'1'

#### 'j' Command
Stop the composite logger
This reconnects the crank and cam input interrupts back to the normal input trigger code.

The Format to send is 
'j'

Speeduino response


#### 'J' Command
Start the composite logger
This disconnects the crank and cam input interrupts from their normal input trigger code and routes them to the composite logger code.An acknowledge reply is made by speeduino.

The Format to send is 
'J'

Speeduino response
'1'

#### 'L' Command
List the contents of current page in human readable form
You must set the current page prior to issuing this command to set the required page to be generated.
the data structure is as follows.

currentPage veMapPage:
      Serial.println(F("\nVE Map"));
      serial_print_3dtable(fuelTable);


currentPage veSetPage:
      Serial.println(F("\nPg 2 Cfg"));
      // The following loop displays in human readable form of all byte values in config page 1 up to but not including the first array.
      serial_println_range((byte *)&configPage2, configPage2.wueValues);
      serial_print_space_delimited_array(configPage2.wueValues);
      // This displays all the byte values between the last array up to but not including the first unsigned int on config page 1
      serial_println_range(_end_range_byte_address(configPage2.wueValues), (byte*)&configPage2.injAng);
      // The following loop displays four unsigned ints
      serial_println_range(configPage2.injAng, configPage2.injAng + _countof(configPage2.injAng));
      // Following loop displays byte values between the unsigned ints
      serial_println_range(_end_range_byte_address(configPage2.injAng), (byte*)&configPage2.mapMax);
      Serial.println(configPage2.mapMax);
      // Following loop displays remaining byte values of the page
      serial_println_range(&configPage2.fpPrime, (byte *)&configPage2 + sizeof(configPage2));
      break;

currentPage ignMapPage:
      Serial.println(F("\nIgnition Map"));
      serial_print_3dtable(ignitionTable);

currentPage ignSetPage:
      Serial.println(F("\nPg 4 Cfg"));
      Serial.println(configPage4.triggerAngle);// configPage4.triggerAngle is an int so just display it without complication
      // Following loop displays byte values after that first int up to but not including the first array in config page 2
      serial_println_range((byte*)&configPage4.FixAng, configPage4.taeBins);
      serial_print_space_delimited_array(configPage4.taeBins);
      serial_print_space_delimited_array(configPage4.taeValues);
      serial_print_space_delimited_array(configPage4.wueBins);
      Serial.println(configPage4.dwellLimit);// Little lonely byte stuck between two arrays. No complications just display it.
      serial_print_space_delimited_array(configPage4.dwellCorrectionValues);
      serial_println_range(_end_range_byte_address(configPage4.dwellCorrectionValues), (byte *)&configPage4 + sizeof(configPage4));

currentPage afrMapPage:
      Serial.println(F("\nAFR Map"));
      serial_print_3dtable(afrTable);
      break;

currentPage afrSetPage:
      Serial.println(F("\nPg 6 Config"));
      serial_println_range((byte *)&configPage6, configPage6.voltageCorrectionBins);
      serial_print_space_delimited_array(configPage6.voltageCorrectionBins);
      serial_print_space_delimited_array(configPage6.injVoltageCorrectionValues);
      serial_print_space_delimited_array(configPage6.airDenBins);
      serial_print_space_delimited_array(configPage6.airDenRates);
      serial_println_range(_end_range_byte_address(configPage6.airDenRates), configPage6.iacCLValues);
      serial_print_space_delimited_array(configPage6.iacCLValues);
      serial_print_space_delimited_array(configPage6.iacOLStepVal);
      serial_print_space_delimited_array(configPage6.iacOLPWMVal);
      serial_print_space_delimited_array(configPage6.iacBins);
      serial_print_space_delimited_array(configPage6.iacCrankSteps);
      serial_print_space_delimited_array(configPage6.iacCrankDuty);
      serial_print_space_delimited_array(configPage6.iacCrankBins);
      // Following loop is for remaining byte value of page
      serial_println_range(_end_range_byte_address(configPage6.iacCrankBins), (byte *)&configPage6 + sizeof(configPage6));
      break;

currentPage boostvvtPage:
      Serial.println(F("\nBoost Map"));
      serial_print_3dtable(boostTable);
      Serial.println(F("\nVVT Map"));
      serial_print_3dtable(vvtTable);
      break;

currentPage seqFuelPage:
      Serial.println(F("\nTrim 1 Table"));
      serial_print_3dtable(trim1Table);
      break;

currentPage canbusPage:
      Serial.println(F("\nPage 9 Cfg"));
      serial_println_range((byte *)&configPage9, (byte *)&configPage9 + sizeof(configPage9));
      break;

currentPage fuelMap2Page:
      Serial.println(F("\n2nd Fuel Map"));
      serial_print_3dtable(fuelTable2);
      break;
   
currentPage ignMap2Page:
      Serial.println(F("\n2nd Ignition Map"));
      serial_print_3dtable(ignitionTable2);
      break;

currentPage warmupPage:
N/A
currentPage progOutsPage:
N/A

#### 'm' Command
Send the current free memory
The Format to send is 
'm'

Speeduino response
'lowByte(currentStatus.freeRAM)' , 'highByte(currentStatus.freeRAM)'

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