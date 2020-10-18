---
title: MX5 PNP
description: MX5 PNP
published: true
date: 2020-10-18T11:24:04.877Z
tags: 
editor: markdown
dateCreated: 2020-10-18T11:24:04.877Z
---

Introduction
------------

Le module Speeduino Miata / MX5 Plug N Play (PNP) est conçu pour une installation simple sur tous les véhicules 1.6L NA6 qui utilisent un bornier d'ordinateur à 48-pin. Ceci inclus tous les 1.6L de 1989 jusqu'à 1993 et quelques 1.6 jusqu'à 1995.

L'ordinateur d'origine pour ces véhicules contient deux connecteurs qui ressemble à ce qui suit:

![OEM_ECU.png](/img/MX5/OEM_ECU.png){.align-center width=500}

> **ATTENTION:** Notez que quelques changements au matériel sont requis avec cette unité. En particulier, bien vouloir regarder la section sur la pompe à essence avant de débuter.
{.is-danger}



Requis matériel
---------------------

Le boitier PNP se branche directement avec le câblage d'origine, par contre quelques changements matériel sont recommandés ou sont désirable pour la plupart des installations.

Plus particulièrement, Speeduino n'opère pas avec le débitmètre (AFM) d'origine du moteur du NA6. Ce module peut être retiré ou bien laissé en place. Si il est laissé en place, le connecteur devra être débranché.

### Pression du manifold

Pour une référence sur la charge du moteur, il est fortement recommandé de mettre une ligne de pression au boitier PNP Speeduino. Ceci permet au Speeduino de fonctionner en mode Speed-Density ce qui permet une installation aisée. Le module arrive avec un capteur déjà installé qui supporte jusqu'à 1 Bar de pression, il est par contre aussi compatible avec les capteurs externes si plus de pression est nécessaire.

Les voitures avec le 1.6L arrivent avec une sortie compatible près du papillon des gaz qui est bloquée quand la voiture est d'origine et est généralement l'endroit le plus simple pour installer la ligne de référence de pression.

![MAP_orig.png](/img/MX5/MAP_orig.png){.align-center width=500}

Un tube de vaccum 5mm ou 6mm doit être utilisé et il y a une multitude de trous dans le firewall pour passer le tube dans l'habitacle.

### Capteur du papillon des gaz

Les voitures manuelles NA6 arrivent d'origine avec un capteur du type on/off qui fournit des infos assez limitées à l'ordinateur. Il est vivement recommandé de le remplacer par un capteur de type variable a trois fils qui permet d'indiquer la position du papillon. Le câblage d'origine peut être utilisé à cet effet.
![TPS_wiring.png](/img/MX5/TPS_wiring.png){.align-center width=500}

> **Note:** Si un capteur de type variable à 3 fils n'est **PAS** installé, le capteur d'origine devrait être débranché et une résistance de 1k installée entre la borne de signal et la mise à la terre pour prévenir un enrichissement erratique à pleins gaz.
{.is-warning}


### Capteur de la température d'admission

Dans la configuration d'origine, la température d'admission est fournie par le capteur débitmètre (AFM). Si le capteur AFM est gardée en place, ce capteur (température) fonctionnera si l'on passe des câble au connecteur débranché du capteur (Voir l'image plus bas), par contre puisque la plupart des installations retireront le capteur, l'ajout d'un capteur additionnel est essentiel. Le capteur recommandé est un capteur 'GM open air IAT' qui est très commun pour les véhicules GM. Le numéro de pièce est le \#25036751 et il se trouve très facilement sur plusieurs revendeurs en ligne, incluant le 'Speeduino store' (https://speeduino.com/shop/index.php?id_product=23&controller=product)

Les deux fils de ce capteur peuvent être directement installé sur le connecteur aux bornes 1 et 6. (L'orientation n'a aucun importance):

![IAT_connector.png](/img/MX5/IAT_connector.png){.align-center width=500}

### Capteur O2 large bande (Wideband)

Même si ce n'est pas obligatoire, l'installation d'un capteur à large bande est fortement reccomandé. N'importe quel controlleur à large bande qui fournit un signal de 0-5V est supporté et leur calibrations peut être trouvée dans: la boîte de dialogue Tools-&gt;Calibrate AFR.

Le signal de sortie à large bande devrait être connecté à l'entrée d'origine du signal O2. Il y a justement un connecteur pour cela dans le compartiment moteur tout près des bobines. On peut suivre le fil en trouvant le câblage du capteur O2 d'origine. Si on ne réutilise pas le signal du capteur d'origine, le connecteur peut être coupé et attaché au capteur à large bande.

### Controle de la pompe à essence

L'ordinateur d'origine ne contrôle d'aucune façon la pompe a essence. Ceci est fait par le capteur débitmètre (AFM). Le Speeduino peut par contre controller la pompe à essence avec le câble d'origine, mais il requiert le retrait du fusible ST_SIG. L'oublie de retirer le fusible avant d'allumer l'unité fera disjoncter le 'smart FET' qui est sur le même ligne, ceci ne devrait pas causer de dommages permanents si cela arrive seulement une ou deux fois.

Le fusible que l'on doit retirer est dans le boitier de fusible du compartiment moteur:

![ST_SIG_fuse.png](/img/MX5/ST_SIG_fuse.png){.align-center width=500}

#### Méthodes de contrôle alternatives

Si la façon de faire inscrite plus haut n'est pas désirable ou pas disponible, une façon alternative est de câbler la borne 20 sur le connecteur principal. La borne 20 amène originalement le signal du débitmètre, étant donné que le Speeduino n'utilise pas ce signal, il peut être utilisé pour le contrôle de la pompe à essence.
Pour faire cela, utilisez un fil sur le connecteur du débitmètre comme sur la photo ci-dessous:

![AFM_fuel_pump.png](/img/MX5/AFM_fuel_pump.png){.align-center width=500}


Une fois le câble en place la borne de pompe à essence devra être changé pour A9 dans TunerStudio.

### Installation sur les moteurs 1.8

Le câblage sur le connecteur 48-pin du 1.8 (NA8) est largement identique à celui du 1.6 (NA6) par contre il y a certaines différences mineures. En plus des points apportés sur cette page, les points suivants devraient être observés pour les installation 1.8:

-   Le contrôle de la pompe à essence doit être changé pour A9
-   Si le tachymètre ne fonctionne pas, faire un pont de la borne 49 à la borne inscrite TACH sur la plaque (juste à coté de R56) 
-   Si le capteur de papillon des gaz garde une donnée fixe et que vous avez un dé-embueur arrière, vous devez couper le câble 2L. Ceci doit seulement être fait si nécessaire et ne devrait pas affecté la plupart des véhicules.

## Configuration et démarrage
Il est vivement recommandé d'utilise le 'NA6 tune base' pour le démarrage; il est disponible par le  SpeedyLoader. 

### Calibration des capteurs

Les capteurs d'origine utilisent une calibration pré étable dans TunerStudio. Les valeurs suivantes doivent être utilisées si les capteurs d'origine sont utilisés:
**Stock Coolant Sensor (CLT)** - RX-7_CLT(S4 & S5)
**Stock inlet air sensor (IAT)** - RX-7_AFM(S5 in AFM)

![sensor_calibrations.PNG](/img/MX5/sensor_calibrations.PNG){.align-center width=420}
