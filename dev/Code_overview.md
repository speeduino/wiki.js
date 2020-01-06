<h2>
Description of source files

</h2>
<h3>
speeduino.ino

</h3>
speeudino.ino is the main project file, including both the setup() and loop() functions that are common to all Arduino sketches. Additionally, it also includes the callback functions to turn the injectors and ignition pulses 'on' and 'off' As at April 2015, it also includes the crank sensor trigger function. This will change in the future when the modular wheel decoder is written

<h4>
Main loop

</h4>
The main loop runs continually, and has 2 primary functions, determining the engine requirements and setting the ignition/injection schedules according to these requirements.

A high level description of the functions performed in the main loop is below:

-   Check whether there is a request in the serial buffer to be processed
-   See whether the engine is turning by looking at the last time a crank tooth was seen
-   Read values from all analog sensors (TPS, IAT, CLT, MAP, O2, Battery voltage). Not all sensors are read every loop as they do not change frequently enough to warrant this
-   The following functions only occur if the engine has 'sync':
    -   Check whether the RPM is above or below the cranking threshold (Both fuel and ignition values are adjusted when the engine is cranking)
    -   Run all corrections functions (See corrections.ino section below). The outcome of this is a % that the pulsewidth will be adjusted by (100% = no adjustment, 110% = 10% more fuel, 90% = 10% less fuel)
    -   Lookup VE from the the main fuel table
    -   Convert VE into a pulsewidth value in uS
    -   Lookup the desired advance from the ignition table
    -   Calculate the current crank angle
    -   Calculate the crank angle that each injector should open at based on the current engine speed
    -   Calculate the dwell angle based on the desired dwell time and current engine speed
    -   Calculate the ignition start angle for each cylinder by subtracting the advance angle and the dwell angle from the TDC angle
    -   Set a 'schedule' for each injector by converting the above calculated start angles into a number of uS in the future (Eg if injector should start opening at 45\* ATDC and the crank angle is currently 10\*BTDC, how long will it take to travel those 55\*)
-   Perform the same schedule setting for each ignition output

<h4>
Trigger

</h4>
This function is called whenever the crank sensor 'sees' a tooth. It performs the following functions whenever it is called:

-   How long has it been since the last tooth was seen ('Tooth Gap')
-   If this time was too short, consider it to be noise and filter it out
-   Add the latest tooth gap time to the Tooth History array
-   Check for a missing tooth
-   Store the tooth gap time so that RPM can be calculated in the main loop

<h3>
comms.ino

</h3>
<h3>
corrections.ino

</h3>
<h3>
display.ino

</h3>
<h3>
math.h

</h3>
This file contains some utility functions that are all aimed at improving performance. A brief description of each is given below

-   fastMap - A faster version of arduinos Map function. Not currently in use
-   fastMap1023toX - An even faster version of the Map function, used specifically when the original values are in the range 0 to 1023. This is common because this range is what the arduino analog inputs are in.
-   divu10 - A high performance divide by 10 function for unsigned ints (Eg x / 10)
-   divs10 - A high performance divide by 10 function for signed ints (Eg -x / 10)
-   divs100 - A high performance divide by 100 function for signed ints

<h3>
scheduler.ino

</h3>
<h3>
storage.ino

</h3>
The storage file deals with storing and loading the ECU configuration onto the arduino's EEPROM. This is broken into 2 parts:

-   The load and save functions for the configuration pages
-   The load and save functions for the sensor calibration values

For the layout of the EEPROM address space, see the commented table in storage.h

<h3>
table.ino

</h3>
<h3>
timers.ino

</h3>
<h3>
utils.ino

</h3>
