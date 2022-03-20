---
title: Tuning
description: 
published: true
date: 2020-04-08T02:10:01.823Z
tags: 
editor: undefined
dateCreated: 2020-01-06T01:54:35.115Z
---

Fuel, Ignition, and AFR Tables
------------------------------

Speeduino determines the correct amount of fuel to inject during each engine cycle and when to fire the ignition with calculations. The formula basis for these calculations is known as Speed Density (SD), which uses engine *speed* and air *density* to calculate the appropriate fuel to inject. Speeduino equates intake manifold absolute pressure (MAP) to both air density (mass) for fuel calculations and engine load for ignition calculations. Speeduino then multiplies this air density factor by the Volumetric Efficiency factor at the current engine speed to estimate appropriate fuel flow to match the load and airflow. These calculations are modified by additional factors such as air temperature, fuel vaporization (coolant temperature), acceleration enrichment, target air:fuel ratio (AFR), etc.

The lookup tables Speeduino uses to calculate these primary factors of MAP and rpm are called the VE Table (for fuel), Spark Table (for ignition timing), or AFR Table (for Air:Fuel Ratio targets). While each table is based on speed and density, the functions are separated for tuning purposes. The tables are arranged with low pressure and low rpm at the bottom-left of the table, increasing upward for pressure, and to the right for rpm. A typical production automotive engine could have perhaps 30kPa MAP at idle and roughly 100kPa (atmospheric pressure) at wide-open throttle, showing as idle in the lower-left of the table, and high-load at redline in the upper-right section.

### The VE Table

As engine efficiency varies by load and rpm, each of the 256 bins (cells) on the 16x16 table has an efficiency number based on the engine's ability to flow air into the cylinders at that MAP and rpm. This is known as the volumetric efficiency or simply VE. The greater the air pumping efficiency, the higher this relative VE number. Greater air flow efficiency requires greater fuel flow to maintain the same target AFR. Increases or decreases in VE may be caused by factors inherent in the engine design, or variable efficiency factors such as throttle position, camshaft timing, harmonic tuning, AFR, ignition timing, etc.

<img src="http://i.imgur.com/QsBeFjQ.jpg?1" title="Fig.1: VE Table" />

Just like standard horsepower or kilowatt and torque calculations, note the generally greater VE at peak torque. Although the VE (and therefore torque) generally decreases above the peak torque area, the multiplier of rpm causes the HP or KW to increase as rpm increase, until the rate of torque reduction exceeds the increase in rpm. Typically, the maximum naturally-aspirated VE is 100%, and is located at the peak torque rpm and maximum manifold pressure (near atmospheric pressure ~101kPa). VE can be greater than 100 on the table, and is most commonly higher when increased for boost, which provides more than 100% VE. However, those numbers may be altered for any reason the tuner sees fit.

### How is a beginning fuel VE table created?

***NOTE:** Tuning and table creation must be made from an existing tune file which contains valid or default values. The provided basic tune file (Speeduino base tune.msq) was created for this purpose and is located in the **reference** folder of the [Stable Firmware](http://speeduino.com/wiki/index.php/Compiling_and_Installing_Firmware#Latest_Stable_Firmware%7CLatest) you downloaded; when the TunerStudio project is created and Speeduino is first connected, the basic tune file should be loaded into TS by pressing **CTRL+O** and navigating to the file, or by clicking **File &gt; Open Tune (msq)** and selecting the file. Attempting to create tables or tune without loading a tune file will usually result in frustration and probable file corruption.*

The fuel table should be roughly based upon the engine's torque curve as outlined above. The rpm and MAP values (Table X and Y) and relative bin VE values that create these curves can be estimated for various MAP and rpm by manual estimation, or by tools such as the Table Generator in the registered version of [TunerStudio](http://www.tunerstudio.com/index.php/tuner-studio). The use of the Table Generator function is covered in the TunerStudio section.

<img src="http://i.imgur.com/UrSMeIs.png" title="Fig. 2 Table Generator" />

### Manual VE Tables

Often, a table generator is not available, or is not suited for estimating tables for certain engine types. This is where knowledge and experience can help in creating a set of tables to begin tuning. While in-depth knowledge of engine theory is very helpful for specific tuning; general guidelines can assist in creating tables that will usually allow engine start and initial running, when coupled with assistance from the operator.

Notice the areas of interest in Figure 3. These are general areas, and can be very different sizes and shapes for various engine types, but are areas found in most automotive general, performance, and racing tables.

<img src="http://i.imgur.com/Cim526L.jpg?1" title="Fig. 3 Table areas" />

Along the left side are MAP pressures in kilopascals (kPa), from less than idle at the bottom, to approximately maximum manifold pressure. These [absolute pressures](https://en.wikipedia.org/wiki/Pressure_measurement#Absolute.2C_gauge_and_differential_pressures_-_zero_reference) should generally be selected to cover the entire operating range, and expanded if appropriate for expected severe weather or altitudes, supercharged (including turbocharged) "boost" applications, etc. Dedicating a row to pressures below idle permits idle stabilization or recovery schemes if desired, whereas an additional row above atmospheric is generally considered unnecessary, except as listed above.

Similarly, along the bottom of the table are increasing rpm values, from less than idle to beyond the engine's peak power rpm. The maximum normal rpm or established shift points are below this redline rpm. It is unnecessary to include rpm above the engine's redline, as it should never be operated above that rpm, although it can still rev beyond this point. Over-revving (excessive and damaging rpm) can be limited by rpm limit settings known as rev limiters. See [Rev Limits](Rev_Limits "wikilink").

### Building the VE Table

In both MAP and rpm headers, attention should be paid to include more divisions where the pressures or rpm change rapidly or frequently, and greater resolution is therefore desired or required. This tends to be the lower MAP and lower rpm areas, primarily including areas 1, 2, and 5. Note in the example above that rpm divisions are in 200 rpm increases near idle, up to roughly peak torque, and larger divisions above that area. The example above ensures higher resolution and more accurate fuel, spark, and AFRs in those highly used and constantly changing areas. In this example a more linear but still bottom-weighted scheme is used for the MAP divisions.

While VE is normally considered a percentage, Speeduino calculations simply use them as relative references, that are sized to allow a logical reference and room to adjust (0 to 255). For normally-aspirated (NA) engines, it is generally suggested to use 100 in the maximum MAP row (atmospheric) at peak torque rpm, with all other entries on the table of lower pressure being lower VE. Supercharged and other systems will simply have rows above 100 kPa (atmospheric), where VE numbers will be relatively higher.

Don't forget that all aspects of the tuning tables are adjustable in TS, usually by clicking on the object in question, as below:

<img src="http://i.imgur.com/q6LnLb2.png?1" title="Table mods" />

### Alternative table-building techniques

Another method used to create a basic table to tune from is called a "wedge" table. It is simply a table outlined with appropriate MAP and rpm values, and filled with a simple graduating set of cells, as below. While this method is initially simple and requires less estimation, it also requires more follow-up tuning and map smoothing for good running in all ranges of operation, as there is no torque curve estimation or 'shape' to work from.

<img src="http://i.imgur.com/1kRVjCW.png?1" title="Wedge Table" />

Using the 3D viewing feature in TS, the example wedge table appears like this before tuning is begun:

<img src="http://i.imgur.com/B6DJI5K.png?1" title="Wedge table 3D view" />

------------------------------------------------------------------------

[PSIG](User:PSIG "wikilink") ([talk](User_talk:PSIG "wikilink")) 13:10, 27 September 2016 (CDT)

------------------------------------------------------------------------

<img src="http://i.imgur.com/C4aONuj.png" title="Fig. 0 Under Construction" />

------------------------------------------------------------------------

*Liability Disclaimer*

*Information provided by the Speeduino Wiki and it's authors is general in nature and is not intended to be a substitute for professional advice, including but not limited to, mechanical, electrical, theoretical, and safety advice.*

*All information is provided "as is." This **is** the Internet. While we try to provide accurate information, we make no claims, promises, or guarantees about the accuracy or completeness of the information provided. Information provided may be altered at any time, by anyone with access, without notice. The Speeduino Wiki and its various authors disclaim any responsibility associated with the general information provided on any of its pages.*

*Visitors use the Speeduino Wiki content solely at their own risk. There is no requirement to use any information in any way. If you are not sure about anything, obtain professional assistance. The responsibility of any interpretation, use, or consideration and any resulting effects is strictly yours. In no event shall the Speeduino Wiki or its authors be liable to any third party for damages related to using or not using its content whether claims are advanced on contract, tort, or other legal theories.*

*The Speeduino Wiki and its authors do not endorse any product, service, method, technique, seller, or provider mentioned in any of its articles or associated advertisements.*