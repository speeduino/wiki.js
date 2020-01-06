Overview
--------

Speeduino has an on board closed loop boost controller than can be used to regulate standard single turbo setups.

Most 3 or 4 port boost solenoids can be used, with frequencies between 15Hz and 500Hz supported. Any of the on board high current outputs can be directly connected to the solenoid and is controlled via a boost target table and PID tuning. Over boost limiting is also available.

Settings
--------

Speeduino's boost control uses a PID algorithm with 2 modes of operation, Simple and Full. Each has their own advantages and disadvantages, as outlined below

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/accessories/boost_settings.PNG" width="500" />

</center>
In Simple mode, the PID values themselves are controlled by the ECU itself and a sensitivity slider is used to adjust how aggressive the output duty cycle will be set. The simple mode can be easy and fast to setup, however has the downside that to avoid overboost, the sensitivity may need to be set low, which can increase lag.

### Target table

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/accessories/boost_map.png" width="500" />

</center>
