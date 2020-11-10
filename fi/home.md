---
title: Speeduino käyttöohje
description: Speeduino moottorinohjausjärjestelmän käyttöohje.
published: false
date: 2020-11-10T08:30:05.589Z
tags: esittely speeduino
editor: markdown
dateCreated: 2020-11-10T08:18:27.466Z
---

# Esittely - Speeduino ECU
Käyttöohje kattaa Speeduino moottorinohjausjärjestelmään (myöhemmin ECU) liittyvän ohjeistuksen elektroniikan (anturit, johdotus jne.), ohjelmiston asetusten ja moottorin säädön osalta. Tämä ohje auttaa ymmärtämään miten Speeduino toimii elektroniikan ja säätöohjelman/firmwaren osalta, mitkä ovat sen ominaisuudet ja miten Speeduino asennetaan oikeaoppisesti.

Vaikka tämä ohje tarjoaa paljon tietoa liittyen Speeduinon säätöön ei se ota kantaa sen syvällisemmin  moottorin säätöön liittyviin edistyneempiin asioihin. On syytä huomioida, että mitkä tahansa virheelliset muutokset Speeduinon asetuksiin saattavat aiheuttaa vakavia vahinkoja. On siis hyvin tärkeää tietää mitä tekee ja ottaa asioista ja niiden vaikutuksista selvää etukäteen.

### Kuinka päästä alkuun?

Päästäksesti alkuun Speeduinon kanssa  on hyvä tietää mistä peruskomponenteista järjestelmä koostuu:

1. **Speeduino piirilevy** - Tämä piirilevy on koko järjestelmän selkäranka. Se sisältää kaikki ajurit sekä IO-piirit. Piirilevy voi olla joko yksi geneerisistä levyistä (kuten v0.4) tai ns. Plug'n'Play piirilevy joka on tarkoitettu sopimaan suoraan auton alkuperäisen johtosarjan ECU-liittimeen.

2. **Arduino/Teensy** - Tämä levy on Speeduinon aivoit. Se sisältää prosessorin sekä käyttö- ja tallennusmuistin. Piirilevy kytketään Speeduino piirilevylle ja tätä kautta Arduino/Teensy yhdistyy ajoneuvon johtosarjaan. Tyypillisesti käytetty versio on Arduino Mega 2560.

3. **Firmware** - Firmware on ohjelma, jota suoritetaan Arduino/Teensy -piirilevyllä. Tämä ohjelmisto määrittää koko Speeduinon toiminnan. Uusi firmware-ohjemisto julkaistaan säännöllisesti. Tyypillisesti julkaisu sisältää päivityksiä, suorituskykyparannuksia ja bugi korjauksia.

As a starting point, it is generally recommended to first upload the firmware to your Arduino and get it connecting to the tuning software (Tuner Studio) before moving on to hardware assembly or wiring etc. Software setup and configuration on Speeduino can be completed without the need for any additional hardware to be present (Beyond the arduino itself) and this allows exploration of the software and options available before either an outlay of significant funds or a significant investment of time.

More details on hardware requirments and verson specific features can be found on the Getting Started page. (https://wiki.speeduino.com/en/Getting_Started)