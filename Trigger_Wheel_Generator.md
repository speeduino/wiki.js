---
title: Trigger Wheel Generator
description: 
published: true
date: 2021-03-02T01:35:53.510Z
tags: 
editor: markdown
dateCreated: 2020-01-06T01:37:21.158Z
---

The below trigger wheel generator is provided and maintained by [Bad Apple Machine & Fab](http://www.badappleproducts.com/) for the benefit of the Speeduino community.

https://www.badappleproducts.com/trigger-wheel	

<svg id="svg" xmlns="http://www.w3.org/2000/svg"></svg>
<div id="tip">Hover mouse over input options</div>
<div id="form-div">

<div id="toolbar">
  <label class="switch"><input type="checkbox" id="inch_mm_toggle"><div class="slider round"><span class="on">MM</span><span class="off">Inch</span></div></label>
  <button id="Export" class="button">Export</button>
  <button id="SubmitOrder" class="button">Order</button>
  <div id="EstimatedCostDiv">
  <label><b>Estimated Cost: $</b>
  <input type="text" id="EstimatedCost" value="" readonly>
  </label>
  </div>
</div>

<form class="myForm" method="get" enctype="application/x-www-form-urlencoded" action="/html/codes/html_form_handler.cfm">
<p>
<label>Major Diameter
<input type="text" id="MajorDiameter" value="7" required>
<input type="range" min="200" max="1200" value="700" id="MajorDiameter-Slider">
</label>
</p>


<p>
<label>Arbor Hole Diamter
<input type="text" id="ArborHoleDiameter" value="2">
<input type="range" min="25" max="800" value="200" id="ArborHoleDiameter-Slider">
</label>
</p>

<p>
<label>Tooth Depth
<input type="text" id="ToothDepth" value="0.200">
<input type="range" min="20" max="100" value="20" id="ToothDepth-Slider">
</label>
</p>

<p>
<label>Tooth Width
<input type="text" id="ToothWidth" value="0.200" readonly>
</label>
</p>

<input type="checkbox" id="EqualGap" checked="checked"> Equal Gap/Width

<p>
<label>Tooth Offset
<input type="text" id="ToothOffset" value="0">
<input type="range" min="0" max="360" value="0" id="ToothOffset-Slider">
</label>
</p>

<fieldset id="WheelType">
<legend>Wheel Type</legend>
<p><label class="choice"> <input type="radio" name="WheelType" required id="TwentyFour"> 24-1 </label></p>
<p><label class="choice"> <input type="radio" name="WheelType" checked="checked" required id="ThirtySix"> 36-1 </label></p>
<p><label class="choice"> <input type="radio" name="WheelType" required id="Sixty"> 60-2 </label></p>
<p><label class="choice"> <input type="radio" name="WheelType" required id="CustomWheel"> Custom </label></p>
<p><input type="text" id="CustomWheelSize" value="45-2"></input></p>
</fieldset>

<fieldset id="MaterialThickness">
<legend>Material Thickness</legend>
<p><label class="choice"> <input type="radio" name="Thickness" required id="Eight"> 1/8 (0.125") or 3.17mm </label></p>
<p><label class="choice"> <input type="radio" name="Thickness" required id="ThreeSixTeeths"> 3/16 (0.1875" ) or 4.76mm</label></p>
<p><label class="choice"> <input type="radio" name="Thickness" checked="checked" required id="Quarter"> 1/4 (0.250") or 6.35mm </label></p>
</fieldset>

<p>
<label>Number of Bolt Holes
<input type="text" id="BoltHoles" value="3">
</label>
</p>
  
<p>
<label>Bolt Hole Diameter
<input type="text" id="BoltHoleDiameter" value="0.250">
</label>
</p>

<p>
<label>Bolt Hole Circle
<input type="text" id="BoltCircle" value="3.250">
<input type="range" min="50" max="1100" value="325" id="BoltCircle-Slider">
</label>
</p>

</form>
</div>


