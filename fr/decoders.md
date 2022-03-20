---
title: patrons décodeurs
description: patrons décodeurs
published: true
date: 2020-10-18T02:02:38.675Z
tags: 
editor: undefined
dateCreated: 2020-10-18T02:02:32.574Z
---

Speeduino supporte un nombre grandissant de décodeurs de signaux de vilebrequin et d'arbre à cames. Ceci inclus les types les plus communs (manufacturiers, OEM) ainsi que certains préconisés par le 'aftermarket' (Tel que les roues à dents manquantes).

La liste ci-dessous inclus toutes celles qui sont présentement supportées. Elles renvoient chacunes vers une page avec les détails pour l'utilisation du décodeur (ces pages sont en cours de construction).

| Décodeur                                                 | Status           | Applications / Description                                                                                                      |
| ------------------------------------------------------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| [Dent manquante](/decoders/Missing_Tooth "wikilink")               | Complète         | Une roue de vilebrequin avec une ou plusieurs dents manquantes                                                                                    |
| [Dent manquante (cam)](/decoders/Missing_Tooth_\(cam\) "wikilink") | Complète         | Une roue d'arbre à cames avec une ou plusieurs dents manquantes qui tourne à 50% de la vitesse du vilebrequin.                                              |
| [Double roues](/decoders/Dual_Wheel "wikilink")                     | Complète         | Deux signaux combineés à partir de deux roues différentes                                                                                 |
| [Basic Distributor](/decoders/Basic_Distributor "wikilink")       | Complète         | Pulsations non comptés qui sont équivalentes à un signal de tachymètre ou de distributeur                                                        |
| [GM 7X](/decoders/GM_7X "wikilink")                               | non testé         | Pulsation multi dents                                                                                                              |
| [4G63](/decoders/4G63 "wikilink")                                 | Complète         | Tel qu'utilisé sur plusieurs 4 cylindres Mitsubishis et Miata NA/NB / MX-5. Supporte aussi les variations 6 cylindres de ce patron (Ex 6g72) |
| [GM 24X](/decoders/GM_24X "wikilink")                             | Non testé         | Utilisé communément sur les LS1 V8 de GM                                                                                                      |
| [Jeep 2000](/decoders/Jeep_2000 "wikilink")                       | Complète         | Moteurs 6 Cylindres Jeep de '91 à 2000                                                                                     |
| [Harley EVO](/decoders/Harley_EVO "wikilink")                     | Complète         | Moteurs Harley EVO V-Twin jusqu'à '99                                                                                              |
| [Honda D17](/decoders/Honda_D17 "wikilink")                       | Complète         | Moteur Honda 4 cylindres D17                                                                                                     |
| [Miata 99](/decoders/Miata_99 "wikilink")                         | Complète         | 1.8L Miata/MX5 de '99 à '00                                                                                                  |
| [Non-360](/decoders/Non-360 "wikilink")                           | Complète         | Une variation du décodeur double roues qui peut être utilisé avec un nombre de dents qui ne se divise pas par 360.                     |
| [Nissan 360](/decoders/Nissan_360 "wikilink")                     | En cours      | roues arbre à cames 360 dents utilisé dans plusieurs moteurs 4 and 6 cylindres.                                                                      |
| [Subaru 6/7](/decoders/Subaru_6/7 "wikilink")                     | Tests en cours | Moteurs Subaru utilisants le roue de vilebrequin a 6 dents et la roues d'arbre à cam de 7 dents                                            |
| [Daihatsu +1](/decoders/Daihatsu_+1 "wikilink")                   | Complète         | Patrons 3+1 et 4+1 utulisés sur les moteurs 3 et 4 cylindres Daihatsu                                                                  |
| [Subaru 36-2-2-2](/decoders/Subaru_36-2-2-2 "wikilink")           | Complète         | Une roue avec 30 dents avec des gros espacements placés stratégiquement                                                                   |

Tous les signaux doivent être conditionnés à 3.3v- 5v et ondes carrées avant d'être utilisés par le micrologiciel.