---
title: Se connecter à Tuner Studio
description: Se connecter à Tuner Studio
published: true
date: 2020-10-19T00:45:49.558Z
tags: 
editor: undefined
dateCreated: 2020-10-19T00:45:43.506Z
---

# Se connecter à Tuner Studio

Tuner Studio est l'interface de tuning utilisé par Speeduino. Il fonctionne sous Windows, Mac et linux et fournit la configuration, le tuning et des capacités de 'logging'. 

une fois le micrologiciel compilé et chargé sur votre Arduino, vous êtes fins prêts pour faire l'ajustement de Tuner Studio pour le configurer et faire le monitoring. Si cela n'est toujours pas fait, vous devez compiler et charger le micrologiciel. référez vous à la page [Installing Firmware](/Installing_Firmware).

## Télécharger Tuner Studio

Si cela n'est toujours pas fait, téléchargez une copie de Tuner Studio [ici](http://www.tunerstudio.com/index.php/downloads)
Tuner Studio est disponible pour  Windows, Mac et linux et il fonctionne avec la plupart des PC étant donné que les requis pour le fonctionnement sont très bas.

La version minimum de TunerStudio requise est la 3.0.7, mais l'utilisations des versions plus récentes sont recommandées. 

Si vous pensez que Tuner Studio est utile, considérez payer pour une license. C'est un programme fantastique qui est fait par une simple dévelopeur qui rivalise les meilleurs logiciels de tuning dans le monde. Il en vaut le prix.

## Mise en place de votre projet

### Création de votre projet

Quand vous démarrez TunerStudio pour la première fois, vous devrez faire une mise en place d'un nouveau projet qui contient la tune, les ajustements et les 'logs'. À l'écran de départ sélectionnez 'Create new project'

![TS_1.png](/img/TunerStudio/TS_1.png){.align-center width=450}

Donnez un nom à votre projet et sélectionnez un dossier où vous voulez que votre projet soit sauvegarder. Tuner Studio nécessite une définition de micrologiciel pour communiquer avec le Arduino. Cliquez le bouton 'Other / Browse'.

![TS_2.png](/img/TunerStudio/TS_2.png){.align-center width=400}

Ensuite allez vers le répertoire source de Speeduino source, entrez le sous-dossier référence et choisissez le fichier speeduino.ini 

![TS_3.png](/img/TunerStudio/TS_3.png){.align-center width=400}

### Configuration des options

Référez vous à la page [Configuring TunerStudio project options](/Configuring_TunerStudio) pour ceci.

### Ajustement des Comms.

Sélectionnez vos options de comms. Le nom exacte du port dépendra sur votre système d'opération et il sera le même que dans le Arduino IDE. La vitesse doit être de 115200.
![Comms Settings](/img/TunerStudio/TS_comms_settings.png){.align-center width=400}

> **Note:** Les options `Detect` et `Test port` nécessitent les versions options 3.0.60 ou supérieur pour fonctionner correctement.
{.is-info}


### Chargement de la 'base tune'

Une fois le projet créer, vous devrez charger une base tune pour vous assurer que les données font un peu de sens. Le fait d'omettre cette étape peut donner des résultats assez étranges dans votre tune.

![TS_6.png](/img/TunerStudio/TS_6.png){.align-center width=400}

Dans le dossier de référence Speeduino, vous trouverez le base tune que vous devez ouvrir:

![TS_7.png](/img/TunerStudio/TS_7.png){.align-center width=400}

Et voilà! C'est fait! Tuner Studio devrait maintenant essayer de se connecter à l'Arduino et vous montrer un écran en temps réel de l'ordinateur.