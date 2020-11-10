---
title: Speeduino käyttöohje
description: Speeduino moottorinohjausjärjestelmän käyttöohje.
published: false
date: 2020-11-10T08:58:02.532Z
tags: home
editor: markdown
dateCreated: 2020-11-10T08:18:27.466Z
---

# Esittely - Speeduino ECU
Tämä käyttöohje kattaa Speeduino moottorinohjausjärjestelmään (myöhemmin ECU) liittyvän ohjeistuksen elektroniikan (anturit, johdotus jne.), ohjelmiston asetusten ja moottorin säädön osalta. Ohje auttaa ymmärtämään miten Speeduino toimii elektroniikan ja säätöohjelman/firmwaren osalta, mitkä ovat sen ominaisuudet ja miten Speeduino asennetaan.

Vaikka tämä ohje tarjoaa paljon perustason tietoa liittyen Speeduinon säätöön ei se ota kantaa syvällisemmin moottorin säätöön liittyviin edistyneempiin asioihin. On syytä huomioida, että mitkä tahansa virheelliset muutokset Speeduinon asetuksiin saattavat aiheuttaa merkittäviä vahinkoja. On siis hyvin tärkeää tietää mitä tekee ja ottaa asioista ja niiden vaikutuksista selvää etukäteen.

### Kuinka päästä alkuun?

On hyvä tietää mistä peruskomponenteista järjestelmä koostuu:

1. **Speeduino piirilevy** - Tämä piirilevy on koko järjestelmän selkäranka. Se sisältää kaikki ajurit sekä IO-piirit. Piirilevy voi olla joko yksi geneerisistä levyistä (kuten v0.4) tai ns. Plug'n'Play piirilevy joka on tarkoitettu sopimaan suoraan auton alkuperäisen johtosarjan ECU-liittimeen.

2. **Arduino** - Tämä levy on Speeduinon aivoit. Se sisältää prosessorin sekä käyttö- ja tallennusmuistin. Piirilevy kytketään Speeduino piirilevylle ja tätä kautta Arduino yhdistyy ajoneuvon johtosarjaan. Tyypillisesti käytetty versio on Arduino Mega 2560.

3. **Firmware** - Firmware on ohjelma, jota suoritetaan Arduino/Teensy -piirilevyllä. Tämä ohjelmisto määrittää koko Speeduinon toiminnan. Uusi firmware-ohjemisto julkaistaan säännöllisesti. Tyypillisesti julkaisu sisältää päivityksiä, suorituskykyparannuksia ja bugi korjauksia.

Uuden Speeduino-järjestelmän kohdalla on suositeltavaa aloittaa Arduinon firmwaren lataamisesta sekä Arduinon yhdistämisestä säätöohjelmaan (Tuner Studio). Vasta tämän jälkeen suositellaan siirtymistä elektroniikan kokoonpanoon, johtosarjan tekoon ym. muihin asioihin. Speeduinon perussäädöt ja parametrien asetukset voidaan suorittaa ilman, että Arduinoon on kytkettynä muita elektroniikan komponentteja (kuten Speeduino piirilevyä). Tämä mahdollistaa säätöohjelmaan tutustumisen jo ennen kuin projektiin on käytetty yhtään sen enempää aikaa tai rahaa.

Lisää tietoa vaatimuksista elektroniikan osalta sekä versiokohtaista tietoa löytyy *Kuinka päästä alkuun?* -sivulla -- https://wiki.speeduino.com/fi/kuinka_paasta_alkuun

### Tietoa käyttöohjeista

Open Source -projektin luonteesta johtuen nämä käyttöohjeet kehittyvät jatkuvasti ja tämä tarkoittaa myös sitä, että saatat törmätä aukkoihin kohdissa, joissa on vasta vain vähän tietoa tarjolla. Älä epäröi kirjoittaa keskustelufoorumille, jos koet että käyttöohjeista puuttuu jokin kriittinen tieto (tai ei kriittinen).

Lisäksi, mikäli haluat osallistua Speeduino dokumentaation luomiseen haluaisimme ehdottomasti kuulla sinusta lisää. Toivottu tapa edetä on pyytää Wikin käyttöoikeuksia Slack-keskustelualustan kautta -- https://speeduino.com/forum/app.php/page/slack