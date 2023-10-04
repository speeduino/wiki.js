---
title: Suzuki K6A
description: Decoder supporting the Suzuki K6A
published: true
date: 2023-10-04T21:31:54.229Z
tags: decoder, trigger
editor: markdown
dateCreated: 2023-10-01T11:48:30.583Z
---

# Suzuki K6A Decoder

## Availability

Decoder has completed development and is now awaiting inclusion in future release.

## Background
This decoder is based on the K6a decoder on a 3 cylinder engine with a trigger pattern on the camshaft consisting on 6+1 teeth. The teeth are not equally spaced on the decoder. 70 degrees prior to TDC on a cylinder their is a tooth.

## Limitations
This decoder is designed around the 3 cylinder K6A engine, although the decoder does not hard code the number of cylinders. This should work for other K6 engines with the same trigger pattern but is unproven. Due to the spacing of the teeth on the cam, it is unlikely to work reliably on 4 cylinder engines. 

Due to the pattern being cam based and with a low tooth count its essential that tooth base ingition is used.

## Setup

### Trigger Settings

Select the Trigger Pattern “K6A”.

Set the trigger angle to 0 degrees then use a timing light with locked ignition to establish the exact angle to use. If you change the trigger edge ensure you re-check the trigger angle.

NB you can only setup the “Trigger Angle (deg)” once you have completed all of the setup actions. 

### Spark Settings (Ignition)

“Enable per tooth timing” should be set to “yes”.