Overview
--------

The Warm Up Enrichment (WUE) dialog contains settings related to the period after start (ie not cranking) but before the engine has reached normal operating temperature. It allows for modifications to fueling during this time to

Settings
--------

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/warmup/warmup.png" height="500" />

</center>
### Warmup curve

This curve represents the additional fuel amount to be added whilst the engine is coming up to temperature (Based on the coolant sensor). The final value in this curve should represent the normal running temperature of the engine and have a value of 100% (Representing no modification of the fuel from that point onwards).

### Afterstart Enrichment

Afterstart Enrichment (ASE) is a seperate fuel modifier that operates over and above the WUE for a fixed period of time after the engine first starts. Typically this is a 3 - 10 second period where a small enrichment can help the engine transition smoothly from cranking to idling.