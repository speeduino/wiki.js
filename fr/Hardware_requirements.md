---
title: Hardware requirements
description: 
published: true
date: 2020-10-16T01:39:46.664Z
tags: 
editor: undefined
dateCreated: 2020-10-16T01:25:24.544Z
---

# Survol des requis matériel

Cette page présente les requis de base du system Speeduino ainsi qu'un nombre d'options de certaines variations de celles-ci. Cette liste ne représente pas une liste complète des toutes les situations matérielles supportées, mais elle donne une bonne vue d'ensemble si vous commencez.

Arduino
-------

Speeduino utilise le Arduino Mega 2560 R3 comme contrôleur. Toutes les versions officielles ainsi que les autres devraient fonctionner correctement, mais il est recommandé d'utiliser un Arduino contenant l'interface série 16u2 plutôt que la version CH340. La jeu de puce utilisé est habituellement inscrit sur la liste des spécifications techniques fournies par le constructeur. En cas de doutes, demandez au fournisseur matériel.

# Signaux d'entré

Capteur du vilebrequin / arbre à cames
-------
C'est sans aucun doute le capteur le plus important pour que Speeduino fonctionne correctement. Le signal entrant dans le Arduino doit être de 0v-5v de type d'onde carrée (pulsée) (démontré ci-dessous) représentant les dents sur une roue tournant a la vitesse du vilebrequin ou de l'arbre à cames. Plusieurs capteurs de type 'Hall' et 'optique' rencontrent cette spécification d'onde carré digitale. Si seulement un signal de vilebrequin est utilisé (pas de capteur d'arbre à cames), la roue du vilebrequin doit être du type de dent manquante pour pouvoir donner la position ainsi que la vitesse de rotation de celui-ci.  Les roues de type 'dent manquante' qui sont présentement testées sont 4-1, 12-1, 36-1 et 60-2.

Pour tout les types de décodage de signaux de roues, bien vouloir utiliser la page 'Trigger Patterns et Decoders'.

Alternativement (et nécessaire pour un mode d'injection séquentiel complet) un signal d'arbre à cames avec ou sans un capteur de vilebrequin à dent manquante. Ces types d'installations sont indiqués par la lettre "/x", tel que 60-2/1, pour un type 60-dents pour le vilebrequin, avec 2 dents manquantes, et un signal d'arbre à cames à 1-dent par cycle. Les signaux des arbres à cames à dents manquantes peuvent aussi supporter l'injection semi et complètement séquentielle.

Les capteurs VR (variable reluctance)
-------
Les capteurs VR (variable reluctance) peuvent aussi être utilisés, par contre étant donné que la plaque ne contient aucun conditionneur de signaux pour convertir le signal (ici-bas) en onde carrées, un module additionnel est nécessaire. Une embase '8-pin DIP' est située sur les plaques officielles de type v0.3.x et v0.4.x à cet effet (nommé IC3). Le circuit MAX9926 a été testé fonctionnel pour la plupart des signaux d'entré et est disponible dans le 'Speeduino Store', par contre plusieurs modules similaires (LM1815, LM358, SSC/DSC, many OEM modules, etc.) qui fournissent une onde de sortie de type 'onde carrée' de 0V-5V devraient aussi bien fonctionner avec les capteurs  VR sensor.

![vr_wave.gif](/img/vr/vr_wave.gif =400x){.align-center}

Il est recommandé de prendre des précautions pour les interférences électro-magnétiques lors du choix et de la dépose du câblage pour les signaux du vilebrequin et de l'arbre à cames. Garder les câbles loin des composantes électrique tel l'alternateur, les câbles à bougies aide à diminuer les interférences. L'utilisation d'un câble blindé (mise à la terre sur le ECU) aide aussi. Il est possible d'utiliser la filtration logicielle, mais rien n'équivaut à un bon signal 'propre'.

Si les signaux de vilebrequin et d'arbre à cames est perdu et que les options de filtration ont été épuisés, valider que les connexions 12 volts et de masse sont 'propre' aussi, il est possible que le bruit provienne de l'alimentation.

TPS (capteur de position du papillon des gaz)
-------
Le capteur TPS doit être du type de potentiomètre à trois fil.Un capteur de type ouvert ou fermé a 2 fils ne fonctionneras pas. La plupart des capteurs à 3 fils devrait fonctionner mais vous devrez valider que c'est un type variable 'potentiomètre'.

Le capteur TPS fonctionne en envoyant un signal variable analogue au Speeduino en rapportant la position actuel du papillon des gaz. il est habituellement branché sur le V+ (5V), la masse et une sortie. Le fonctionnement donne une valeur en volt basse lorsque le papillon est fermé est un voltage plsu élevé quand le papillon est ouvert au maximum.

If using a TPS with unknown connections; it is recommended to test the TPS with an ohm meter in order to determine the connection of each pin without risking damage by applying sensor power randomly. This can be accomplished on the bench or with the engine off and TPS disconnected:

Assign a letter to each pin.
Attach the ohm meter to two pins, and operate the throttle from closed (idle) to wide-open (WOT), recording the results.
Find the pair of pins where the resistance does not change significantly from idle to WOT. These are your two power pins.
The remaining pin is your Signal pin.
In order to determine which power pin is V+ and which is GND, test ohms between the Signal pin and one power pin.
In idle position; if ohms are low that power pin is GND. If ohms are high that power pin is V+.
Most usable TPS sensors have 3 pins. If your TPS has a different number of pins, referring to the original engine wiring diagram may show the function, and whether it is usable or which pins to use for Speeduino. For TP sensors that work 'backwards', and wiring cannot be changed, a simple code modification is available on the Forums to make use of this type of TPS.

MAP (Manifold Pressure)
-------
Recommended MAP sensor is the MPX4250 from Freescale, however many MAP sensors are supported. If you want to use one that is not included in the list (Under Tools->Map Calibration in TunerStudio) then please make a new thread in the forum requesting this. Other sensors can and will work just fine, but you will need to calibrate these within TunerStudio against a different set of values.

Temperature Sensors (CLT and IAT)
-------
Any standard 2-wire thermistor sensor can be used for these temperature functions. The sensors have 1 side connected to a ground (Preferably from the ECU) and the other running to the signal line. These sensors have no polarity, so the orientation of these wires does not matter.

For full details, please see the Sensor Calibration page

Exhaust Gas Oxygen Sensors (O2 and WBO2)
-------
The type of O2 sensor (narrow or wide-band) must be selected in TunerStudio under Tools > Calibrate AFR Table.

Narrow-band
NBO2 sensor signals are read directly by Speeduino. TunerStudio applies the standard non-linear 0-volt to 1-volt values for all standard NBO2 sensors automatically under calibration. Once set in calibration, Speeduino will use the designated NBO2 to adjust fueling according to the entries you make in the AFR table (Tuning > AFR Table), and the sensor is selected for type and parameters (or disabled) under Tuning > AFR/O2. Note that narrow-band sensors were originally designed to target stoichiometric AFR (Lambda 1.0) for efficient catalytic emissions control, and are generally not sufficiently accurate or suitable for tuning efficient lean economy or rich power fueling. While not recommended; involved tuning methods are available to allow limited and approximate tuning for lean and rich AFRs using a NBO2 sensor.

Wide-band
Wide-band oxygen (WBO2) sensors can detect and report a wider range of lambda (ƛ) or AFRs than narrow-band, and with greater accuracy, from approximately 10:1 to 20:1 (about 0.7 to 1.3 lambda), depending on specific sensor version and controller. Speeduino cannot use WBO2 sensors directly, requiring an external controller to process the signal and to apply sensor heating control. Enter the controller brand and model from the list displayed. If the controller signal is generic linear or custom, select and enter the required information, or an option to install a custom INC file is available in the menu list.

Once set in Tools > Calibrate AFR Sensor, Speeduino can use the designated WBO2 to report lambda/AFR to TunerStudio for gauge display. After the sensor is selected for type and parameters under Tuning > AFR/O2 it can adjust corrective fueling on-the-fly according to the entries you make in the AFR table (Tuning > AFR Table), and for auto-tuning in TunerStudio, or MegaLogViewer in real-time or from logs. Settings also include the option to disable. Although Speeduino can use the WBO2 information to correct fueling; it is strongly suggested it not be used to compensate for poor tuning.

Application-Specific Inputs
Circuits and techniques Speeduino users have found useful for adapting or implementing certain inputs or functions.

Flex Fuel Sensor
-------
See the Flex Fuel section for details on hardware and configuration of flex fuel setups.

12V Input Signal
-------
Some position sensors output a 12v signal. To correct this, and avoid damaging the Arduino, a circuit like the one in the diagram can be constructed. The resistor R1 is not always required, but will make sure that any output that is not high is pulled low. Along with this circuit use the pull-up jumper on the Speeduino. This will effectively change a 0v/12v into a 0v/5v signal.

Many thanks to PSIG for the info and diagram.

GM 7 / 8 pin Distributor Module
The GM 7 /8 pin modules have been used in a wide variety of GM engines from 4 cylinder to V8s (small and big block). The 8 pin distributor was also widely used in marine applications by Indmar, Mercruiser, and others.

GM 7-Pin Module   
GM 8-Pin Ignition Module   
The 7 and 8 pin modules are functionally equivalent and largely share the same wiring. The 7 pin is used in the large coil-in-cap distributors while the 8 pin is used in the small cap distributors with remote mounted coils. The 8 pin has one additional terminal that provides a sensor ground. Both modules provide coil ground via the metal grommets used to secure them to the distributor.

These modules provide an simple means for computer controlled timing while retaining the distributor. They were designed to be used with throttle body injection and port injection motors and provide automatic coil current limiting (7.5 amps was the GM specification) and automatic dwell control. The can be adapted to other distributor applications that use either variable reluctor or hall type sensors.

Pin Descriptions and connections
• "+" : Battery voltage from a switched ignition source. Provides the power to operate the module.

• "C-" : Ignition coil negative connection.

• "P & N" : Positive and Negative of the distributor reluctor. Polarity is important. GM distributor connectors can only be connected one way. For use with other distributors, verify polarity of the reluctor leads.

• "B" : Ignition bypass. When cranking, grounding this line bypasses computer control of timing. The timing iscontrolled by the module only. This can be done using the Speeduino Cranking Bypass pin function (see below).

• "R" : Reference or tach signal. This outputs a 5 volt square wave that serves as the RPM1 input for the Speeduino. To use this, connect it to RPM1 and set JP2 to Hall and JP4 connected (ie, 5 volt pull up).

• "E" : Timing control signal. When pin B has 5 volts on it, the module allows Speeduino to control the timing using this pin. The output of Ign1 should be connected to this pin.

• "G": (8 pin only) Signal ground. Should be connected to the Speeduino sensor ground. (Module ground is provided through the metal mounting grommets)

A timing bypass circuit must be constructed to utilize the Speeduino ignition timing control. The small circuit below should be built in the proto area.


In addition, the cranking bypass should be turned on and the bypass pin should be set to pin 3 in the Cranking Settings dialog (under Starting / Idle in TunerStudio):

Trigger settings (under Starting / Trigger Setup in TunerStudio) should be as shown below. You will need to adjust the trigger angle to get correct timing. Instructions for this are in the wiki.

Timing control is set in the Spark / Spark Settings dialog:

The module works well, however, some applications result in a noisy trigger signal. This shows as an unstable RPM (either at idle, or more frequently, at higher speeds). Trigger filtering may help, but a modification may be necessary to clean up the signal. The circuit below effectively cleans/filters the signal, allowing use with no trigger filtering by the Speeduino. It has been tested with single and 8-pole reluctors and modules from GM, Transpo and a no-name generic.

*Many thanks to apollard for this outline information.*
# Outputs
Injectors
-------
Speeduino injector drivers use on/off (not PWM) control and are designed to work with "High-Z" injectors. This type of injectors are also known as "saturated" or "high-impedance" that use full battery voltage to control the injector open cycle, and generally the impedance is greater than about 8 Ohms. If you are running "Low-Z" ("peak and hold" or PWM-controlled) injectors that are lower impedance, you will need to install series resistors on these to avoid damaging the board with excessive current. The resistor ohms and watt rating can be calculated by Ohm's Law, or use an Internet calculator page such as the Speeduino Injector Resistor Calculator.

Speeduino can drive up to 2 High-Z injectors per output channel.

The 0.4v boards have 2 pins per injector channel allowing each injector to be directly connected to the board without splicing in the harness. If the application has less than 4 injectors using any pin connected to the proper channel will work.

Coils
-------
Current versions of the Speeduino use low-power output signals, designed to work with external small-signal ignition coil drivers, whether a separate type (module or ICM, igniter, IGBT, etc.), or built into the coil assembly ('smart' coils). This method permits Speeduino to have great flexibility to control most types of ignition systems. Attaching the Speeduino outputs directly to a traditional high current passive ("dumb" or 2-pin) ignition coil without an ignition coil driver WILL cause damage to your Arduino.

How Speeduino controls ignition circuit power In prior history, the coil driver was a set of mechanical contact points ("points"), simply replaced today by an electronic version. The added coil driver can be anywhere from inside the Speeduino to inside the coil assembly; though near or in the coil reduces electrical noise.

In the example animated image below, the Speeduino ignition signal is normally low (near ground or 0V) while Speeduino calculates the time to the next coil firing. At the proper time, Speeduino switches the ignition output to high (near 5V or 12V selectable) in order to switch the coil driver (example IGBT) on, allowing current to flow through the coil to ground. This is called the 'dwell' period. During dwell an increasing energy field is generated around the ignition coil core and wire windings.

At the end of the dwell period and therefore at the proper time for spark; Speeduino switches the coil driver off, stopping current flow, which collapses the energy field to create high voltage and the resulting spark:


In TunerStudio, the setting for this example would be to fire the spark "going low". The dwell setting is highly variable depending on coil type, voltage levels, etc. Too little dwell will give weak or no spark and excess dwell will rapidly increase heat, possibly damaging any of the ignition components, but usually the ignition coil or coil driver.

The wasted-spark version is below to show how it is identical in operation, but with the high-voltage spark returning through the second spark plug to complete the circuit:


A good run down of 'smart' coil types can be found at: http://www.megamanual.com/seq/coils.htm. There are many ignition modules available that Speeduino can use to control standard coils, or for smart coils you can generally use 4 or 5-pin types as these will always be logic level, although some 3-pin coils are also of this variety. GM LS1/2 coils are an example of powerful smart coils that are commonly used and can usually be obtained easily and cheaply.

(Note: In the past, some ignition control modules with current limiting or dwell control features (e.g., 1970s GM HEI, Bosch '024' types, and Ford DS1) were referred-to as "smart" modules. While still true, common terminology of individual ignition coils with at least a driver integrated, or newer technology with greater controls (e.g., controlled spark duration or multi-spark) are all considered "smart" coils. You must know the control requirements of the specific drivers, control modules, or coils you intend to use in order to operate them properly with Speeduino.)

# Aux Outputs
Low Current
-------
Most Speeduino versions have low-current (LC) signal outputs directly from the MEGA processor to (usually) the prototyping (proto) area of the board. These outputs are generally not suited to control power devices directly in this form, and need suitable output circuits built on the proto area to enable their use. Alternatively, the output functions such as Fuel Pump or Fan are re-assignable to other pins and components, such as the existing high-current (HC) output MOSFETs - see "Medium Current" section below for more.

Some Speeduino versions include an 8-channel ULN2803A Darlington transistor array IC that is capable of switching up to 1/2 amp per channel. These auxiliary outputs are sufficient to switch small devices directly, or to switch power-handling devices, such as power MOSFETs or automotive relays. Configuration and settings of these outputs is described in the Configuration section. Additional information for using a ULN2803A on v0.4-series boards may be found here. Similar output options and pin assignments may be used on other board designs.

Medium Current
-------
v0.3x and later boards include medium-power MOSFET auxiliary outputs to switch up to 3 amps directly. These are labeled "HC" in schematics and some references. These outputs are commonly used to operate idle valves, boost-control valves, VVT solenoids, etc., or to control relays for handling much larger loads, such as electric radiator fans. Configuration and settings of these outputs is described in the Configuration section.

# Auxilary IO
On Arduino Mega2560 based Speeduino boards (official or just running current firmware) git commit 13f80e7 support is available for the external connection of 8 16bit analog inputs via Serial3

# CanBus
As the Arduino mega2560 has no CanBus interface a seperate "co-processor" interface has been designed. More information about this unit can be found here https://github.com/Autohome2/Speeduino-can-interface. This uses the functionality provided by the Serial3 port and connects via that port.

On the upcoming Teensy3.5 variant of Speeduino the CanBus code will be incorporated into the main system firmware as the Teensy3.5 has integrated CanBus and only requires a transceiver module added.

# Third Party Addon's
In This section you will find information about third party designed hardware designed to be used in conjunction with the Speeduino ECU

# GPIO for Speeduino
There are several variants of the GPIO , The firmware can be downloaded here https://github.com/Autohome2/Speeduino-GPIO

More information GPIO_for_Speeduino