---
title: Speeduino käyttöohje
description: Speeduino moottorinohjausjärjestelmän käyttöohje.
published: false
date: 2020-11-10T08:41:32.503Z
tags: esittely speeduino
editor: markdown
dateCreated: 2020-11-10T08:18:27.466Z
---

# Esittely - Speeduino ECU
Tämä käyttöohje kattaa Speeduino moottorinohjausjärjestelmään (myöhemmin ECU) liittyvän ohjeistuksen elektroniikan (anturit, johdotus jne.), ohjelmiston asetusten ja moottorin säädön osalta. Tämä ohje auttaa ymmärtämään miten Speeduino toimii elektroniikan ja säätöohjelman/firmwaren osalta, mitkä ovat sen ominaisuudet ja miten Speeduino asennetaan oikeaoppisesti.

Vaikka tämä ohje tarjoaa paljon perustason tietoa liittyen Speeduinon säätöön ei se ota kantaa syvällisemmin säätöön liittyviin edistyneempiin asioihin. On syytä huomioida, että mitkä tahansa virheelliset muutokset Speeduinon asetuksiin saattavat aiheuttaa vakavia vahinkoja. On siis hyvin tärkeää tietää mitä tekee ja ottaa asioista ja niiden vaikutuksista selvää etukäteen.

### Kuinka päästä alkuun?

Päästäksesti alkuun Speeduinon kanssa  on hyvä tietää mistä peruskomponenteista järjestelmä koostuu:

1. **Speeduino piirilevy** - Tämä piirilevy on koko järjestelmän selkäranka. Se sisältää kaikki ajurit sekä IO-piirit. Piirilevy voi olla joko yksi geneerisistä levyistä (kuten v0.4) tai ns. Plug'n'Play piirilevy joka on tarkoitettu sopimaan suoraan auton alkuperäisen johtosarjan ECU-liittimeen.

2. **Arduino/Teensy** - Tämä levy on Speeduinon aivoit. Se sisältää prosessorin sekä käyttö- ja tallennusmuistin. Piirilevy kytketään Speeduino piirilevylle ja tätä kautta Arduino/Teensy yhdistyy ajoneuvon johtosarjaan. Tyypillisesti käytetty versio on Arduino Mega 2560.

3. **Firmware** - Firmware on ohjelma, jota suoritetaan Arduino/Teensy -piirilevyllä. Tämä ohjelmisto määrittää koko Speeduinon toiminnan. Uusi firmware-ohjemisto julkaistaan säännöllisesti. Tyypillisesti julkaisu sisältää päivityksiä, suorituskykyparannuksia ja bugi korjauksia.

Uuden Speeduino-järjestelmän kohdalla on suositeltavaa aloittaa Arduinon firmwaren lataamisesta sekä Arduinon yhdistämisestä säätöohjelmaan (Tuner Studio) ja vasta tämän jälkeen suositellaan siirtymistä elektroniikan kokoonpanoon, johtosarjan tekoon ym. muihin asioihin. Speeduinon perussäädöt ja parametrien asetukset voidaan suorittaa ilman, että Arduinoon on kytkettynä muita elektroniikan komponentteja (kuten Speeduino piirilevyä). Tämä mahdollistaa säätöohjelmaan tutustumisen jo ennen kuin projektiin on käytetty yhtään sen enempää aikaa tai rahaa.

Lisää tietoa vaatimuksista elektroniikan osalta sekä versiokohtaista tietoa löytyy _Kuinka päästä alkuun?_ -sivulla (https://wiki.speeduino.com/fi/kuinka_paasta_alkuun)