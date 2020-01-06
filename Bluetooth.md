Bluetooth Wireless Option
-------------------------

<center>
<img src="http://i.imgur.com/KgmM8nL.png" height="100" /><img src="http://i.imgur.com/NjmX3qu.png" height="100" /><img src="https://raw.githubusercontent.com/speeduino/wiki/master/Speeduino%20logo_sml.png" height="100" />

</center>
### Minimum-Money Hardware

The Mega 2560 communicates via a USB-to-serial connection for downloading of the Speeduino firmware, and also for communication during operation with monitoring, tuning, and logging programs such as TunerStudio and MegaLogViewer. Once the Speeduino firmware is loaded, Speeduino can also communicate via a properly re-programmed Bluetooth module serial connection, known as serial port profile (SPP). There are a number of ways to accomplish this, and the following demonstrates using an inexpensive [HC-series bluetooth module](http://www.ebay.com/sch/i.html?_odkw=hc+bluetooth+-%28interface%2Cbase%2Cbare%29&_sop=15&LH_BIN=1&_osacat=0&_from=R40&_trksid=p2045573.m570.l1313.TR0.TRC0.H0.Xhc+bluetooth+-%28interface%2Cbase%2Cbare%29+backplane.TRS0&_nkw=hc+bluetooth+-%28interface%2Cbase%2Cbare%29+backplane&_sacat=0) for a direct connection to the Mega board.

------------------------------------------------------------------------

''Note: Speeduino and TunerStudio communicate at 115200 bps baud rate. Most any wireless serial device from Bluetooth to Satphone will work if programmed to the proper communications speed. Some slower systems (e.g., cheap short-range 433MHz radio) can work, but may not transmit or receive quickly enough for high-speed data logging.

*Note: Loading firmware by Bluetooth is possible, but requires specific and somewhat involved procedure, or a more expensive and [specific type of Bluetooth module](https://www.adafruit.com/products/1588) that can accomplish resetting for upload — neither of which is within the scope of this basic overview. Additional information is on the Speeduino Forums.*

*Note: Using bluetooth bypasses the USB serial converter, allowing Arduino Mega versions with non-FTDI UART serial chips to connect to TunerStudio and other serial programs cross-platform without special drivers or setup. The Mega demonstrated here is a CH340 version.*

------------------------------------------------------------------------

### Bluetooth Types

This method of using Bluetooth (BT) communications only requires an HC-series BT module, and a wiring connection. The BT module in this case is an HC-05, HC-06, HC-07 or HC-09, mounted on an interface board (“backplane”, “backboard”, "breakout", etc) operating in Slave mode. As slave-only modules are simpler to re-program, the example described here is an **HC-06** slave-only module on a **JY-MCU v1.02** board:

<center>
<img src="http://i.imgur.com/siuxlXg.png" height="200" />

</center>
### The Board

The purpose of the interface board is to allow operation from any voltage of 3.6 to over 6 volts, permitting powering from the Mega's 5V pins, as well as regulated voltage on the Tx (transmit) and Rx (receive) lines. While an HC BT without interface board may be used, the power must be 3.3 volts, and divider or regulation circuits must also be made and used on the TX and RX lines to drop voltage from 5-volt TTL to a safe level for the bare BT. Using a module with the interface board solves these problems, and also provides an LED indicator and connection pins.

### Connections

#### Pin Connections

The BT module connects to the Mega through the TX0 and RX0 pins, and the 5V and GND (ground) pins. The Mega connects to the BT module as follows:

**`Mega_______BT`**
`TX0------>RXD`
`RX0<------TXD`
`5V--------VCC`
`GND-------GND`

<center>
<img src="http://i.imgur.com/AJooEMu.png" height="200" />

</center>
While the HC interface module can connect and functions when connected to the Mega's 3.3V pin, the module specifies 3.6V minimum for proper regulator operation, and therefore the 5V connection is suggested. There are several locations on the Mega board to source 5V and ground, and the most obvious are the standard marked power pins in this example. The connector shown was scavenged from an old desktop computer, and re-purposed for connecting the BT. The wire colors do not matter, and must only make the proper connections:

<center>
<img src="http://i.imgur.com/tviZHpy.png" height="200" />

</center>
### Board Attachment

The connector wires are soldered directly to the Mega's pins on the bottom of the board. It is imperative that a strain relief be used to prevent pulling on the soldered connections, as they are relatively weak. In this example a 'zip tie' is used though one of the Mega holes and around the wires as a strain relief:

<center>
<img src="http://i.imgur.com/FghgQsE.png" height="200" />

</center>
The wires are left long enough to allow the antenna end of the BT to protrude from the case end plate for good signal range and better BT speeds, and also allow easy disconnection and reconnection for Speeduino access in the enclosure.

After proper [reprogramming](Bluetooth#Reprogramming_the_Bluetooth_Module "wikilink"); the BT module LED glowing continuously indicates connection, and the glowing Mega TX and RX lights are active, sending and receiving info to TunerStudio:

<center>
<img src="http://i.imgur.com/4XLIyA6.png" height="200" />

</center>
### Phones / Tablets

With an active Bluetooth connection, smart phones and tablets can talk to Speeduino. Android phones and the free [MSDroid](https://play.google.com/store/apps/details?id=com.msdroid) dash and logging app are one example, as is the [Shadow Dash](http://www.tunerstudio.com/index.php/shadowdashmsmenu) app from the makers of TunerStudio.

Once the [BT module reprogramming](http://speeduino.com/wiki/index.php/Connecting_to_TunerStudio#Reprogramming_the_Bluetooth_Module) is completed in the following section; a scan by your phone or tablet should have your Speeduino appear as an available device with the new name you assigned it. In the Android example below, there is one Speeduino already paired by Bluetooth, and it has found a second Speeduino, called "Speeduino-v0.4":

<center>
<img src="http://i.imgur.com/uKQptUV.png" height="200" />

</center>
When Speeduino-v0.4 is selected, the system prompts for the security PIN to be entered:

<center>
<img src="http://i.imgur.com/qy104pQ.png" height="200" />

</center>
When validated, the new Speeduino-v0.4 appears in the list of paired devices:

<center>
<img src="http://i.imgur.com/qFHzdg6.png" height="200" />

</center>
In this example using MSDroid; after loading the *speeduino.ini* file into MSDroid's ini folder, and "Connect to ECU" is selected in Settings, monitoring, tuning, or logging is available:

<center>
<img src="http://i.imgur.com/za7wptB.png" height="200" />

</center>
### Reprogramming the Bluetooth Module

The module is usually supplied with generic settings. The name it broadcasts is non-descriptive, the PIN security code is commonly 0000 or 1234 with obvious low security, and unusable 9600 bps speed is typical. These settings should be changed for proper operation and security. The module can be reprogrammed to “Speeduino”, change the PIN number to 9876 (or any other) for security, and set the speed to the required 115200 bps in the following example.

<center>
<img src="http://i.imgur.com/1taXGO8.png" height="200" />

</center>
#### Interface

There are two common terminal emulators used to accomplish this. Both use a serial interface, such as the Arduino [IDE serial monitor](https://www.arduino.cc/en/Guide/Environment#toc12), or programs appropriate for your PC's OS, such as [HTerm](http://www.der-hammer.info/terminal/), [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/), [TeraTerm](http://ttssh2.osdn.jp/index.html.en), etc.).

#### UARTs

The first type of terminal emulator is an inexpensive UART module acting as a [USB-to-TTL serial converter](http://www.ebay.com/sch/i.html?_from=R40&_sacat=0&_sop=15&LH_ItemCondition=1000&_nkw=usb%20ttl&rt=nc&LH_BIN=1&_trksid=p2045573.m1684). This module connects to the BT module in the same way as the Mega:

<center>
<img src="http://i.imgur.com/xZ3eKx2.png" height="200" />

</center>
The second type tested to work properly is by using the UART on-board an [Arduino](http://www.princetronics.com/arduino-uno-as-usb-to-serial-ttl-converter/) as a terminal emulator. [This method](http://alselectro.wordpress.com/2014/10/21/bluetooth-hc05-how-to-pair-two-modules/) uses either a blank sketch, or a jumper from the RESET pin to a GND pin to hold the Arduino in reset mode, allowing straight-through serial communications to pins TX0 and RX0. Note this method uses different connections to the BT, using TX-to-TX and RX-to-RX, only for programming with AT commands. Normal BT operation still requires the connections shown earlier. The module type may also require an additional jumper.

#### Commands

Once the USB-to-TTL communication is established to the BT module, the HC-06 commands to re-program are:

**`Send_________________Response`**
`AT`<enter>`---------------OK`
`AT+NAMESpeeduino-----OKSetname`
`AT+PIN9876-----------OKSetPIN`
`AT+BAUD8-------------OK115200`

Other module types may require different commands to perform the reprogramming. For example some newer HC-06 will accept "AT" by itself but give errors for the other commands. In those cases try the these variations: AT+NAME=Speeduino, AT+PSWD="9876", AT+UART=115200,0,0.

The module should now be ready to connect to Speeduino and communicate with the new name, PIN, and baud rate.

------------------------------------------------------------------------

------------------------------------------------------------------------

#### Bluetooth Range and Speed

Even with the antenna exposed, placement under the dash or behind vehicle structure may block the signal excessively, and an extension can be used to expose the BT module:

<center>
<img src="http://i.imgur.com/jmcByIf.png" height="200" /><img src="http://i.imgur.com/XT7HH7c.png" height="200" />

</center>
An extension is easily made with common stranded-wire (never solid wire!) 4-conductor cable and simple connectors. If shielded cable is used, only ground the shielding to the GND wire at the Mega-end of the cable.

The extension can also be securely and quickly connected at the enclosure by using a common 4-pin connector or similar:

<center>
<img src="http://i.imgur.com/XSD7Ror.png" height="200" />

</center>

------------------------------------------------------------------------

------------------------------------------------------------------------