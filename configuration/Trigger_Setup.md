Overview
--------

One of the most critical components of an EFI setup is the Crank Angle Sensor (CAS) and how it is used by the ECU. The Trigger settings dialog is where the trigger configuration is defined and it is vitally important to have this correct before trying to start your engine.

With incorrect settings, you may have issues getting sync or see erratic RPM readings.

Note that many of the settings on this dialog are dependant on your configuration and it is therefore normal that some options maybe greyed out.

Trigger Settings
----------------

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/constants/triggerSettings.png" width="40%" />

</center>
-   **Trigger Pattern** - The pattern used by the crank/cam sensor setup on your engine. For a full list of the supported patterns, see: <https://speeduino.com/wiki/index.php/Decoders>
-   **Primary Base teeth** - For patterns where the number of teeth are variable (missing tooth, dual wheel etc), this number represents the number of teeth on the primary wheel. For missing tooth type wheels, this number should be the count as if there were no teeth missing.
-   **Primary trigger speed** - The speed at which the primary input spins. It is closely related to the Primary Base teeth setting and indicates whether that number of teeth passes the sensor once every crank revolution or every cam revolution.
-   **Missing teeth** - If using the missing tooth pattern, this is the size of the gap, given in 'missing teeth'. Eg 36-1 has 1 missing tooth. 60-2 has 2 missing teeth etc. The missing teeth **MUST** be all located in a single block, there cannot be multiple missing tooth gaps around the wheel.
-   **Secondary teeth** - As above, but for the secondary input. This input is always assumed to run at cam speed.
-   **Trigger angle multiplier** -
-   **Trigger angle** - The angle of the crank, **After Top Dead Centre (ATDC)**, when tooth \#1 passes the sensor on the primary (crank) input. This setting is critical for Speeduino to accurately know the current crank angle. See section below ('Finding tooth \#1 and trigger angle') for further information on how to determine this value

### Trigger options

-   **Skip revolutions** -
-   **Trigger edge** -
-   **Secondary trigger edge** -
-   **Trigger filter** -
-   **Re-sync every cycle** -

Finding tooth \#1 and trigger angle
-----------------------------------