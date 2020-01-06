Overview
--------

The Spark settings dialog contains the options for how the ignition outputs will function, including which of the 4 IGN outputs are used and how. They are critical and incorrect values will result in an engine not starting and in some cases damage to hardware is possible. This dialog also contains a number of options for fixing the ignition timing for testing and diagnosis.

Please ensure you have reviewed these settings prior to attempting to start your engine.

Settings
--------

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/ignition/spark_settings.png" width="550" />

</center>
-   **Spark Output mode** - Determines how the ignition pulses will be outputted and is very specific to your ignition wiring. **Note that no matter which option is selected here, ignition signals ALWAYS fire in numerical order (ie 1-&gt;2-&gt;3-&gt;4) up to the maximum number of outputs**. The firing order of the engine is accounted for in the wiring order.
    -   **Wasted Spark** - Number of ignition outputs is equal to half the number of cylinders and each output will fire once every crank revolution. One spark will therefore take place during the compression stroke and the other on the exhaust stroke (aka the 'wasted' spark). This method is common on many 80s and 90s vehicles that came with specific wasted spark coils, but can also be used with individual coils that are wired in pairs. Wasted spark will function with only a crank angle reference (Eg a missing tooth crank wheel with no cam signal)
    -   **Single Channel** - This mode sends all ignition pulses to IGN1 output and is used when the engine contains a distributor (Typically with a single coil). The number of output pulses per (crank) revolution is equal to half the number of cylinders.
    -   **Wasted COP** - This is a convenience mode that uses the same timing as the 'Wasted Spark' option, however each pulse is sent to 2 ignition outputs rather than one. These are paired IGN1/IGN3 and IGN2/IGN4 (ie When IGN1 is high, IGN3 will also be high). As this is still a wasted spark timing mode, only crank position is required and there will be 1 pulse per pair, per crank revolution. This mode can be useful in cases where there are 4 individual coils, but running full sequential is either not desired or not possible (Eg when no cam reference is available).
    -   **Sequential** - This mode is only functional on engines with 4 or fewer cylinders.
    -   **Rotary** - See below for full detail
-   **Cranking advance** - The number of absolute degrees (BTDC) that the timing will be set to when cranking. This overrides all other timing advance modifiers during cranking.
-   **Spark output triggers** - <font color='red'>**THIS IS A CRITICAL SETTING!**</font>. Selecting the incorrect option here can cause damage to your igniters or coils. Specifies whether the coil will fire when the ignition output from Speeduino goes HIGH or goes LOW. The VAST majority of ignition setups will require this to be set **GOING LOW** (ie the coil charges/dwells when the signal is high and will **fire** when that signal goes low). Whilst GOING LOW is required for most ignition setups, there are some configurations that perform the dwell timing on the ignition module and fire the coil only when they receive a HIGH signal from the ECU.
-   **Fixed Angle** - This is used to lock the ignition timing to a specific angle for testing. Setting this to any value other than 0 will result in that exact angle being used (ie overriding any other settings) at all RPMs/load points, except during cranking (Cranking always uses the above Cranking Advance setting). This setting should be set to 0 for normal operation.

### Rotary modes

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/ignition/rotary_settings.png" width="550" />

</center>
Speeduino currently only supports the ignition configuration used on FC RX7 engines. Support for FD and RX8 ignition setups is in development. The leading / trailing split angle can be set as a function of the current engine load.

-   **FC** - Outputs are configured for the Leading/Trailing setup that was used on FC RX7s. Wiring is:

<!-- -->

-   **IGN1** - Leading (wasted) sparks
-   **IGN2** - Trailing spark
-   **IGN3** - Trailing select
-   **IGN4** - Not used

<li>
**FD** - Uses the same wasted spark signal for both leading sparks as FC, but individual signals for the trailing sparks. Wiring is:

</li>
-   **IGN1** - Leading (wasted) sparks
-   **IGN2** - Front rotor trailing
-   **IGN3** - Rear rotor trailing
-   **IGN4** - Not used

<li>
**RX8** - Individual outputs are used for each spark signal. Wiring is:

</li>
-   **IGN1** - Front rotor leading
-   **IGN2** - Rear rotor leading
-   **IGN3** - Front rotor trailing
-   **IGN4** - Rear rotor trailing

</ul>