---
title: Speeduino-järjestelmän komponentit
description: 
published: true
date: 2020-12-06T15:18:17.338Z
tags: elektroniikan komponentit
editor: markdown
dateCreated: 2020-11-13T12:11:48.259Z
---

# Yleiskatsaus Speeduino-järjestelmän komponentteihin

Tällä sivulla esitellään Speeduino-järjestelmään kuuluvat komponentit sekä näiden vaihtoehtoisia muunnelmia. Kaikkia mahdollisia vaihtoehtoja ei esitetä mutta tämä sivu tarjaa hyvän yleiskäsityksen, jonka avulla on helppo aloittaa - varsinkin jos olet ensikertalainen.

Arduino
-------
Speeduino järjestelmän aivoina käytetään Arduino Mega 2560 R3 levyä. Kaikki viralliset ja suurinosa Arduino Mega 2560 klooneista toimii mutta on suositeltavaa käyttää sellaista versiota, jossa sarjakommunikaatio on toteutettu 16u2 sirulla edullisemman CH340 sirun sijaan. Tieto siitä kumpaa sirua levyllä on käytetty löytyy yleensä levyn teknistentietojen listasta. Jos epäilet asiaa voit varmistaa asian suoraan Arduinon myyjältä.

Sisääntulot
-------

### Kampi- ja nokka-akselin anturit

Nämä anturit ovat Speeduino järjestelmän toiminnan kannalta ne kaikista tärkeimmät. Arduinolle kulkevan signaalin tulee olla 0-5V kantti-muotoista aaltoa (kuvassa alla), jonka tulee vastata triggeri-pyörän kuviota, joka pyörii kampi- tai nokka-akselin pyörintänopeudella. Useimmat Hall- ja "opto"-tyyppiset anturit pystyvät tuottamaan vaaditun kaltaisen kantti-muotoisen signaalin. Jos käytössä on ainoastaan kampiakselin anturi (ei signaalia nokka-akselilta), triggeri-pyörän kuvion tulee olla puuttuvalla hampaalla oleva kuvio, jotta moottorin asento ja sen käyntinopeus voidaan määrittää. Toistaiseksi testatut puuttuvan hampaan kuviot ovat 4-1, 12-1, 36-1 ja 60-2 kuviot.

Lisää tietoa triggeri-pyörien kuviovaihtoehdoista löydät [Trigger Patterns and Decoders](/decoders) sivulta.

Täysin sekventiaaliseen ruiskutukseen vaaditaan myös nokka-akselin anturin tuottama signaali (tällöin kampiakselilla olevan triggeri-pyörän ei välttämättä tarvitse olla kuvioltaan puuttuvahampainen). Nämä kuviot ovat merkattu "/x"-merkillä kuten 60-2/1 joka tarkoittaa, että kampiakselilla on 60 hampainen triggeri-kuvio, 2 puuttuvalla hampaalla, ja nokka-akselilla on 1 hampainen triggeri-kuvio. Nokka-akselilla oleva puuttuvahampaista kuviota voidaan käyttää semi- ja täysin seqventiaalisissa kokoonpanoissa.

VR (variable reluctance) antureita voidaan myös käyttää. Tällöin on huomioitav, että viralliset Speeduino piirilevy versiot eivät suoraan tue VR-anturin tuottaman sini-aallon (alla) muuttamista vaadituksi kantti-muotoiseksi aalloksi. Tätä muunnosta varten tarvitaan erillinen VR-moduuli. Virallisilta piirilevyiltä (v0.3.x ja v0.4.x) löytyy VR-modulia varten 8-pinninen DIP-kanta (IC3). MAX9926 sirun on testattu toimivan suurimman osan tarjolla olevista sisääntulosignaaleista kanssa. Kyseistä sirua voi osaa täälä: [Speeduino Store](https://speeduino.com/shop/index.php?id_product=17&controller=product). Minkä tahansa 0-5V kantti-muotoista signaalia tuottavan moduulin pitäisi toimia myös (LM1815, LM358, SSC/DSC, monet OEM-modulit jne.)

![vr_wave.gif](/img/vr/vr_wave.gif =400x){.align-center}

Rakennettaessa johtosarjaa kampiakselin ja nokka-akselin anturoinneille on syytä kiinnittää huomiota EMI-asioihin (elektromagneettiset häiriöt). Näihin voi vaikuttaa oikeanlaisella kaapelivalinnalla sekä kaapelin viennillä. Auttaa jos kaapeloinnin pystyy asentamaan mahdollisimman kauaksi suurista häiriölähteistä (esim. laturi, sytytystulpat, -johdot ja -puolat). Suojatun kaapelin käyttö on suositeltaavaa (liitä suoja-vaippa ainoastaan ECUn päähän). Signaalia voidaan suodattaa ohjelmallisesti mutta mikään ei voita puhdasta, suoraan anturilta tulevaa, signaalia.

Jos EMI-/suodatus-asetukset ovat maksimissaan ja kampi-/nokka-akselin signaali on kadoksissa, varmista että Speeduino piirilevyn +12V ja GND liitännät ovat vapaita häiriöistä. On mahdollista, että päävirtojen kautta aiheutuu häiriöitä toisaalle järjestelmään.

### TPS (Throttle Position Sensor, kaasuläpän asentoanturi)

TPS-anturin on oltava mielummin 3-johtoinen, potentiometri-tyyppinen.2-johtoinen on/off-tyyppistä antruia ei suositella käytettävän. Jos TPS-anturisi on 3-johtoinen se todennäköisesti toimii mutta on varmistettava, että anturi on potentiometri-tyyppinen.

TPS-anturi toimii lähettämällä muuttuvan analogisen signaalisn Speeduinolle ja välittää näin kaasuläpän asennon. Tyypillisesti anturille johdettu +5V ja maadoitus (GND, signaali maa tai paluusignaali) kulkee sisäisen potentiometrin kautta, joka tuottaa anturin ulostuloon matalan jännitteen pienellä kaasuläpän avaumalla ja vastaavasti suuren jännitteen suurella kaasuläpän avaumalla.

Jos TPS-anturia joudutaan käyttämään tuntemattomien liitäntöjen kanssa on suositeltavaa mitata TPS-anturi yleismittarilla, jotta voidaan määrittää anturin pinnijärjestys ilman, että anturi mahdollisesti vahingoittuu kytkentäkokeiluista. Mittaus voidaan suorittaa moottori sammutettuna ja TPS-anturin liitin irrallaan seuraavasti:

- Merkkaa jokainen anturin pinni omalla kirjaimella.
-	Kaasuläpän ollessa kiinni liitä yleismittari (ohm-asetus) kahteen anturin pinneistä ja käännä kaasuläppä auki-asentoon, kirjaa mittauksen tulokset ylös.
- Etsi pinnipari, joiden resistanssi ei muutu merkittävästi kaasuläpän suljetun ja avoinaisen asennon välillä. Nämä ovat kaksi käyttöjännite-pinniä.
- Jäljelle jäävä pinni on **Signaali**-pinni
- Määrittääksesi kumpi käyttöjännite-pinneistä on **V+** ja kumpi **GND** testaa resistanssi (ohm) **Signaali**-pinnin ja jommankumman käyttöjännitepinnin välillä.
- Kaasuläpän ollessa kiinni - jos resistanssi pinnien välillä on pieni on kyseinen pinni **GND**. Jos resistanssi on suuri on pinni **V+**.

Suurin osa käyttökelpoisista TPS-anturiesta on 3 pinnisiä. Jos TPS-anturissasi on poikkeava määrä pinnejä voi auton alkuperäinen piirikaavio kertoa pinnien merkityksen ja sen onko kyseinen anturi käytettävissä Speeduinon kanssa. TPS-antureille, jotka toimivat "takaperin" (tapauksissa, joissa johdotusta ei voida muuttaa), on saatavilla yksinkertainen muutos ohjelman koodiin, joka on saatavilla täältä: [Forums](https://speeduino.com/forum/viewtopic.php?f=19&t=1159#p18146)

### MAP (Manifold Pressure, imusarjan paine -anturi)

Suositeltu MAP-anturi on Freescalen valmistama MPX4250-anturi. Tästä huolimatta myös monet muut MAP-anturit ovat käyttökelpoisia. Jos haluat käyttää anturia listan (*Tools > MAP Calibration*, TunerStudiossa) ulkopuolelta ole hyvä ja kirjoita tästä Speeduino keskustelufoorumille. Muut anturit toimivat kyllä mutta niille on asetettava anturikohtaiset kalibrointitiedot TunerStudiossa.

### Lämpötila-anturit (CLT ja IAT)

- CLT = Coolant Temperature = Jäähdytysveden lämpötila
- IAT = Intake Air Temperature = Imuilman lämpötila

Mikä tahansa 2-johtoinen termistori-tyyppinen anturi on käyttökelpoinen lämpötilan mittaamiseen. Anturin toinen johdin kytketään maahan (suositeltavaa on kytkeä maa ECU:n päähän) ja toinen johdin toimii signaalijohtimena. Näillä anturiella ei ole polariteettia, joten johtojen järjestyksellä ei ole merkitystä.

Enemmän tietoa aiheesta löydät [Sensor Calibration](/configuration/Sensor_Calibration) sivulta.

### Lambda-anturit (O2)

O2 = Oxygen = Happi

O2-anturin malli (kapea- tai laajakaistainen) on valittava TunerStudion valikosta: *Tools > Calibrate AFR Table.*

#### Kapeakaistainen Lambda-anturi (NBO2)

NB = Narrow Band = Kapeakaistainen

Speeduino voi lukea NBO2 anturin signaali suoraan sellaisenaan. TunerStudio käyttää standardia epälineaarista 0-1 voltin asteikkoa kaikkien standardi NB02 antureiden kalibroinnin osalta. Kun NB02-anturi on valittu käyttöön, Speeduino käyttää Lambda-anturin signaalia säätääkseen polttoaineensyöttöä AFR-taulukkoon asetettujen arvojen mukaan (*Tuning > AFR Table*). Itse anturin tyyppi ja sen parametrit valitaan TunerStudion valikosta *Tuning > AFR/O2*. On syytä huomioida, että kapeakaistaiset Lambda-anturit on suunniteltu alunperin tarkkailemaan stoikiometristä polttoaineseosta (Lambda 1.0) katalysaattorilla varustetuissa autoissa. Yleisestiottaen kapeakaistaiset Lambda-anturit eivät sovellu tarkkuutensa puolesta säätöön, jossa tavoitteena on laihan tai rikkaan polttoaineseoksen havaitseminen. Vaikka tätä ei suositella, on kapeakaistaisella anturimallilla mahdollisuus säätää moottorin seossuhteet rajallisesti.

#### Laajakaistainen Lambda-anturi (WBO2)

WB = Wide Band = Laajakaistainen
AFR = Air/Fuel Ratio = Ilma/Polttoaine -suhde

Laajakaistaiset Lambda-anturit pystyvät mittaamaan nimensä mukaisesti Lambdan tai polttoaine/ilma-seoksen arvoja laajemmalla skaalalla verrattuna kapeakaistaisiin antureihin (10:1 - 20:1 AFR / 0.7 - 1.3 Lambda. Asteikot riippuvat anturin ja ohjainelektroniikan mallista). Lisäksi WB-anturit ovat tarkempia verrattuna NB-antureihin. WB-anturia ei sellaisenaan voi kytkeä suoraan Speeduinoon vaan tarvitaan erillinen ohjain prosessoimaan anturin signaali sekä ohjaamaan anturin lämmitystä. Ohjaimen merkki ja malli valitaan TunerStudion valikosta. Oli ohjaimen lähettämä signaali sitten geneerinen lineaarisignaali tai räätälöity, valitse ja täytä vaaditut tiedot suoraan TunerStudion valikosta. Vaihtoehtoisesti voidaan valikosta valita mahdollisuus asentaa räätälöity INC-tiedosto, joka sisältää räätälöidyt kalibrointitiedot valitsemaasi Lambda-anturiohjainta varten.

Kun *Tools > Calibrate AFT Sensor* -valikosta on valittu anturivaihtoehto (EGO Sensor), Speeduino käyttää valittua anturivaihtoehtoa näyttääkseen lambda/AFR -lukeman TunerStudion mittaristossa. Kun *Tuning &gt; AFR/O2* -valikosta  

Once set in *Tools &gt; Calibrate AFR Sensor*, Speeduino can use the designated WBO2 to report lambda/AFR to TunerStudio for gauge display. After the sensor is selected for type and parameters under *Tuning &gt; AFR/O2* it can adjust corrective fueling on-the-fly according to the entries you make in the AFR table (*Tuning &gt; AFR Table*), and for auto-tuning in TunerStudio, or MegaLogViewer in real-time or from logs. Settings also include the option to disable. Although Speeduino can use the WBO2 information to correct fueling; it is strongly suggested it not be used to compensate for poor tuning.

### Application-Specific Inputs

Circuits and techniques Speeduino users have found useful for adapting or implementing certain inputs or functions.

#### Flex Fuel Sensor

See the [Flex Fuel](/configuration/Flex_Fuel) section for details on hardware and configuration of flex fuel setups.


#### 12V Input Signal

Some position sensors output a 12v signal. To correct this, and avoid damaging the Arduino, a circuit like the one in the diagram can be constructed. The resistor R1 is not always required, but will make sure that any output that is not high is pulled low. Along with this circuit use the pull-up jumper on the Speeduino. This will effectively change a 0v/12v into a 0v/5v signal.

*Many thanks to PSIG for the info and diagram.*

#### GM 7 / 8 pin Distributor Module

The GM 7 /8 pin modules have been used in a wide variety of GM engines from 4 cylinder to V8s (small and big block). The 8 pin distributor was also widely used in marine applications by Indmar, Mercruiser, and others.

<center>
GM 7-Pin Module   <img src="https://raw.githubusercontent.com/speeduino/wiki/master/hardware/GM_7-pin.png" title="Fig. 1 GM 7-pin module" width="400"/>

</center>

<center>
GM 8-Pin Ignition Module   <img src="https://raw.githubusercontent.com/speeduino/wiki/master/hardware/GM_8-pin.png" title="Fig. 2 GM 8-pin module" width="370"/>

</center>

The 7 and 8 pin modules are functionally equivalent and largely share the same wiring. The 7 pin is used in the large coil-in-cap distributors while the 8 pin is used in the small cap distributors with remote mounted coils. The 8 pin has one additional terminal that provides a sensor ground. Both modules provide coil ground via the metal grommets used to secure them to the distributor.

These modules provide an simple means for computer controlled timing while retaining the distributor. They were designed to be used with throttle body injection and port injection motors and provide automatic coil current limiting (7.5 amps was the GM specification) and automatic dwell control. The can be adapted to other distributor applications that use either variable reluctor or hall type sensors.

##### Pin Descriptions and connections

• "**+**" : Battery voltage from a switched ignition source. Provides the power to operate the module.

• "**C-**" : Ignition coil negative connection.

• "**P & N**" : Positive and Negative of the distributor reluctor. Polarity is important. GM distributor connectors can only be connected one way. For use with other distributors, verify polarity of the reluctor leads.

• "**B**" : Ignition bypass. When cranking, grounding this line bypasses computer control of timing. The timing iscontrolled by the module only. This can be done using the Speeduino Cranking Bypass pin function (see below).

• "**R**" : Reference or tach signal. This outputs a 5 volt square wave that serves as the RPM1 input for the Speeduino. To use this, connect it to RPM1 and set JP2 to Hall and JP4 connected (ie, 5 volt pull up).

• "**E**" : Timing control signal. When pin B has 5 volts on it, the module allows Speeduino to control the timing using this pin. The output of Ign1 should be connected to this pin.

• "**G**": *(8 pin only)* Signal ground. Should be connected to the Speeduino sensor ground. (Module ground is provided through the metal mounting grommets)

A timing bypass circuit must be constructed to utilize the Speeduino ignition timing control. The small circuit below should be built in the proto area.

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/ignition/GM7_pin_bypass.png" title="Fig. 3 Bypass circuit" width="40%"/>

</center>
In addition, the cranking bypass should be turned on and the bypass pin should be set to pin 3 in the Cranking Settings dialog (under Starting / Idle in TunerStudio):

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/warmup/cranking_bypass.png" title="Fig. 4 Bypass settings" width="40%"/>

</center>
Trigger settings (under Starting / Trigger Setup in TunerStudio) should be as shown below. You will need to adjust the trigger angle to get correct timing. Instructions for this are in the wiki.

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/ignition/GM7_pin_triggerSettings.PNG" title="Fig. 5 Trigger settings" width="35%"/>

</center>
Timing control is set in the Spark / Spark Settings dialog:

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/ignition/GM7_pin_sparkSettings.png" title="Fig. 6 Spark settings" width="30%"/>

</center>
The module works well, however, some applications result in a noisy trigger signal. This shows as an unstable RPM (either at idle, or more frequently, at higher speeds). Trigger filtering may help, but a modification may be necessary to clean up the signal. The circuit below effectively cleans/filters the signal, allowing use with no trigger filtering by the Speeduino. It has been tested with single and 8-pole reluctors and modules from GM, Transpo and a no-name generic.

<center>
<img src="https://raw.githubusercontent.com/speeduino/wiki/master/ignition/GM7_pin_filter.png" title="Fig. 7 Filter circuit" width="40%"/>

</center>
*Many thanks to apollard for this outline information.*

Outputs
-------

### Injectors

Speeduino injector drivers use on/off (not PWM) control and are designed to work with "High-Z" injectors. This type of injectors are also known as "saturated" or "high-impedance" that use full battery voltage to control the injector open cycle, and generally the impedance is greater than about 8 Ohms. If you are running "Low-Z" ("peak and hold" or PWM-controlled) injectors that are lower impedance, you will need to install series resistors on these to avoid damaging the board with excessive current. The resistor ohms and watt rating can be calculated by Ohm's Law, or use an Internet calculator page such as the [Speeduino Injector Resistor Calculator](http://efistuff.orgfree.com/InjectorResistorCalculator.html).

Speeduino can drive up to 2 High-Z injectors per output channel.

The 0.4v boards have 2 pins per injector channel allowing each injector to be directly connected to the board without splicing in the harness. If the application has less than 4 injectors using any pin connected to the proper channel will work. 

### Coils

Current versions of the Speeduino use low-power output signals, designed to work with external small-signal ignition coil drivers, whether a separate type (module or ICM, igniter, IGBT, etc.), or built into the coil assembly ('smart' coils). This method permits Speeduino to have great flexibility to control most types of ignition systems. Attaching the Speeduino outputs directly to a traditional high current passive ("dumb" or 2-pin) ignition coil without an ignition coil driver WILL cause damage to your Arduino.

***How Speeduino controls ignition circuit power*** In prior history, the coil driver was a set of mechanical contact points ("points"), simply replaced today by an electronic version. The added coil driver can be anywhere from inside the Speeduino to inside the coil assembly; though near or in the coil reduces electrical noise.

In the example animated image below, the Speeduino ignition signal is normally low (near ground or 0V) while Speeduino calculates the time to the next coil firing. At the proper time, Speeduino switches the ignition output to high (near 5V or 12V selectable) in order to switch the coil driver (example IGBT) on, allowing current to flow through the coil to ground. This is called the 'dwell' period. During dwell an increasing energy field is generated around the ignition coil core and wire windings.

At the end of the dwell period and therefore at the proper time for spark; Speeduino switches the coil driver off, stopping current flow, which collapses the energy field to create high voltage and the resulting spark:

<img src="http://efistuff.orgfree.com/images/Speedy_Ignition_Sequence.gif" title="Fig. 1 Typical IDI Ignition" />

In TunerStudio, the setting for this example would be to fire the spark "*going low*". The dwell setting is highly variable depending on coil type, voltage levels, etc. Too little dwell will give weak or no spark and excess dwell will rapidly increase heat, possibly damaging any of the ignition components, but usually the ignition coil or coil driver.

The wasted-spark version is below to show how it is identical in operation, but with the high-voltage spark returning through the second spark plug to complete the circuit:

<img src="http://efistuff.orgfree.com/images/SpeedyIgnitionDiagramWASTED.jpg" title="Fig. 2 Typical ISI-WS Ignition" />

A good run down of 'smart' coil types can be found at: [<http://www.megamanual.com/seq/coils.htm>](http://www.megamanual.com/seq/coils.htm). There are many ignition modules available that Speeduino can use to control standard coils, or for smart coils you can generally use 4 or 5-pin types as these will always be logic level, although some 3-pin coils are also of this variety. GM LS1/2 coils are an example of powerful smart coils that are commonly used and can usually be obtained easily and cheaply.

*(Note: In the past, some ignition control modules with current limiting or dwell control features (e.g., 1970s GM HEI, Bosch '024' types, and Ford DS1) were referred-to as "smart" modules. While still true, common terminology of individual ignition coils with at least a driver integrated, or newer technology with greater controls (e.g., controlled spark duration or multi-spark) are all considered "smart" coils. You must know the control requirements of the specific drivers, control modules, or coils you intend to use in order to operate them properly with Speeduino.)*

### Aux Outputs

#### Low Current

Most Speeduino versions have low-current (LC) signal outputs directly from the MEGA processor to (usually) the prototyping (proto) area of the board. These outputs are generally not suited to control power devices directly in this form, and need suitable output circuits built on the proto area to enable their use. Alternatively, the output functions such as Fuel Pump or Fan are re-assignable to other pins and components, such as the existing high-current (HC) output MOSFETs - see "Medium Current" section below for more.

Some Speeduino versions include an 8-channel ULN2803A Darlington transistor array IC that is capable of switching up to 1/2 amp per channel. These auxiliary outputs are sufficient to switch small devices directly, or to switch power-handling devices, such as power MOSFETs or automotive relays. Configuration and settings of these outputs is described in the [Configuration](/Configuration_Index) section. Additional information for using a ULN2803A on v0.4-series boards may be found [here](https://speeduino.com/forum/viewtopic.php?f=19&t=1023&p=16588#p16588). Similar output options and pin assignments may be used on other board designs.

#### Medium Current

v0.3x and later boards include medium-power MOSFET auxiliary outputs to switch up to 3 amps directly. These are labeled "HC" in schematics and some references. These outputs are commonly used to operate idle valves, boost-control valves, VVT solenoids, etc., or to control relays for handling much larger loads, such as electric radiator fans. Configuration and settings of these outputs is described in the [Configuration](/Configuration_Index) section.

Auxilary IO
-----------

On Arduino Mega2560 based Speeduino boards (official or just running current firmware) git commit 13f80e7 support is available for the external connection of 8 16bit analog inputs via [Serial3](/Secondary_Serial_IO_interface)

CanBus
------

As the Arduino mega2560 has no CanBus interface a seperate "co-processor" interface has been designed. More information about this unit can be found here <https://github.com/Autohome2/Speeduino-can-interface>. This uses the functionality provided by the Serial3 port and connects via that port.

On the upcoming Teensy3.5 variant of Speeduino the CanBus code will be incorporated into the main system firmware as the Teensy3.5 has integrated CanBus and only requires a transceiver module added.

Third Party Addon's
-------------------

In This section you will find information about third party designed hardware designed to be used in conjunction with the Speeduino ECU

GPIO for Speeduino
------------------

There are several variants of the GPIO , The firmware can be downloaded here <https://github.com/Autohome2/Speeduino-GPIO>

More information [GPIO_for_Speeduino](/GPIO_for_Speeduino "wikilink")