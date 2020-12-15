---
title: CanBus Support2
description: 
published: true
date: 2020-12-15T23:59:31.245Z
tags: 
editor: markdown
dateCreated: 2020-12-15T21:58:51.731Z
---

Overview
--------

Speeduino is able to support Canbus in two ways.

1. Use a Mega2560 MCU with a coprocessor board
2. Use a Teensy or STM32 (with internal can module) MCU.

##### About the CanBus Interface
The Canbus Interface offers ,

  1. OBD2 formatted data of current realtime data .
  2. Broadcast selected current realtime data and function status .(coming soon)
  3. Read in Analog and Digital data values from other devices on the BUS including those from OEM devices/ECU.(coming soon)

Settings
--------

### Enable CanBus interface

To enable use of the Canbus interface it must be enabled in TunerStudio.




## OBD2 Data Support

When used with an MCU that has an Internal canbus interface Speeduino firmware is able to output data using the OBD2 std 

Speeduino does not offer “readiness monitoring” or emission testing support and should not be used for such.

### OBD Port Interface Configuration 

The Interface supports 11bit addressing @500kbps data rate.
The port will respond to the STD OBD2 protocol .
Any code reader /app /software following OBD2 standard protocol is able to access the data described below.
The Teensy3.5 uses pins xxx for connection to the can transceiver.
The STM32 uses pins xxx for connection to the can transceiver.

### OBD Port Interface Support Options

The OBD2 port Inteface offers support for ,

   1. To output the current realtime data ([see supported PID list](CanBus_Support2#PID_supported"wikilink")) . 
   
   2. Output the Analog/Digital data values from the 16 Aux inputs ([see here for info on aux data input configuration](/en/configuration/Auxillary_IO_Configuration))
   3. Activate External Outputs(coming soon!)

### Modes Supported
 There are 10 diagnostic services described in the latest OBD-II standard SAE J1979. Before 2002, J1979 referred to these services as "modes". Speeduino supports only a selected number of these modes. These are:

Mode (hex) 	Description
- 01   Show current data
- 09   Vehicle information (VIN)  (coming soon)
- 22   Manufacturer Specific data.

Mode 22 is a custom PID mode that is defined by the manufacturer.It is used to define additional services.

### PID supported

The following PIDs are supports by by the OBD port

When using Bit-Encoded-Notation, quantities like C4 means bit 4 from data byte C. Each bit is numerated from 0 to 7, so 7 is the most significant bit and 0 is the least significant bit (See below).


|
|  A   |  B  |  C  |    D

| A7 A6 A5 A4 A3 A2 A1 A0 | B7 B6 B5 B4 B3 B2 B1 B0 | 	C7 C6 C5 C4 C3 C2 C1 C0 | D7 D6 D5 D4 D3 D2 D1 D0 |
 	

#### MODE 01
 	  PID(hex)  PID(Dec) 	Data bytes <br/> ```diagram
PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjEiIHdpZHRoPSI2NDFweCIgaGVpZ2h0PSI4MXB4IiB2aWV3Qm94PSItMC41IC0wLjUgNjQxIDgxIiBjb250ZW50PSImbHQ7bXhmaWxlIGhvc3Q9JnF1b3Q7ZW1iZWQuZGlhZ3JhbXMubmV0JnF1b3Q7IG1vZGlmaWVkPSZxdW90OzIwMjAtMTItMTVUMjM6NTk6MTEuODk3WiZxdW90OyBhZ2VudD0mcXVvdDs1LjAgKFdpbmRvd3MpJnF1b3Q7IHZlcnNpb249JnF1b3Q7MTQuMC4zJnF1b3Q7IGV0YWc9JnF1b3Q7UTVKbXQ2ZmY1SkIzS3I3YVQ0Z24mcXVvdDsgdHlwZT0mcXVvdDtlbWJlZCZxdW90OyZndDsmbHQ7ZGlhZ3JhbSBpZD0mcXVvdDttSEllSVU0TDZjTjQ4Z28wMXVMMSZxdW90OyBuYW1lPSZxdW90O1BhZ2UtMSZxdW90OyZndDs3WmhOajVzd0VJWi9EZGVLenlSN1hFemFIdHBMVTZsbmIzREFrc0hJVEpha3Y3NHp3WVN3S05wSW05QkdxUlJaK1BYWXh1OHpZQWNuWU1YdWkrRlYvbDJuUWptK20rNmNJSEY4ZnhGNVdKS3diNFZ3RWJWQ1ptVGFTbDR2ck9SdllVWFhxbHVaaW5vUUNGb3JrTlZRWE91eUZHc1lhTndZM1F6RE5sb05aNjE0SmtiQ2FzM1ZXUDBsVThqdHN2eDVyMzhWTXN1N21iM1pVOXRTOEM3WXJxVE9lYXFiRXlsWU9nRXpXa043VmV5WVVPUmQ1MHZiNy9PWjF1T05HVkhDSlIyQ1dkdmpsYXV0WFp5OU1kaDNxOFY3ck9nUytBdEpjUTZGd3FxSGwwMHVRYXdxdnFiMkJsbWpWZ00zWUptNVdFY0l3R1Vwak8yejFrcnhxcGFId2RxSVhLcjBHOS9yTFhUVGRMVjRnNzJaVnBwNmw3cWsrVUhzSUpFR3dVcGRvcXdBRzJPN0RtR3crYXdaM3RGaVRFMmhDd0ZtanlGZFhsb29OaXVETHQyYW52RXN0RnArd3JmcngyMWFaY2VSZStmeHdwcC9Cc1Q4Y2hDNElwQmMvVUFIZUpsZHdtVHNlV3AwOVpPYlRJQVZLaTFMRUdiNWltYlZWdHRJcGQ2YXJ5dmJxTVNtNi91aUFYUmhLOFlhY3h6MDRFb1U0dzk5WXU2bnlJbHdOUXpyWGwvSEg0VWJoRjNXWURCaGFBekJhMmhFRFpmeWJkTjVEUGc5Z3VFMUNDNUdCSit2aXZEd0x1TTl3Zy9UMGVqbVJoMWVQN2xNVTFGZWJQUDhYWnU5MmExc2ZoclpIRCtZemJzM0ZrOWhlemZHaWUzc01XMFAvQ2x0SDJkNzhwaTJoNHNwYmZmKzc4YTMyNDMzUTFCVGJNNmhQOTZjTWQvYzV4a1ZFUlVoRlFFVkZQanNVZUZlbGZxLzg2eUZadzdDa3p4YndYZ0RKeFF4b1lnSlJVd29Za0lSVXlBbHBodmZJWW9QL0ZFNUIraXZiUDNoZU9zbllJeUFNUUxHQ0JnallJd0NHUUZqZHdqc0dtZ21QUjVFNDFOWlFtZ1NRcE1RbW9UUUpJUW1vY0NFMENSM2lPWjJ6OUl0RHhaWTdiL2xITnBPUG9nRnl6OD0mbHQ7L2RpYWdyYW0mZ3Q7Jmx0Oy9teGZpbGUmZ3Q7Ij48ZGVmcy8+PGc+PHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjY0MCIgaGVpZ2h0PSI4MCIgZmlsbD0iI2ZmZmZmZiIgc3Ryb2tlPSIjMDAwMDAwIiBwb2ludGVyLWV2ZW50cz0iYWxsIi8+PHBhdGggZD0iTSAwIDQwIEwgNjQwIDQwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxwYXRoIGQ9Ik0gMTYwIDAgTCAxNjAgODAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBwb2ludGVyLWV2ZW50cz0iYWxsIi8+PHBhdGggZD0iTSAzMjAgMCBMIDMyMCA4MCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwMDAwIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIHBvaW50ZXItZXZlbnRzPSJhbGwiLz48cGF0aCBkPSJNIDQ4MCAwIEwgNDgwIDgwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxwYXRoIGQ9Ik0gMCAwIE0gNjQwIDAgTSA2NDAgNDAgTSAwIDQwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxNjAiIGhlaWdodD0iNDAiIGZpbGw9Im5vbmUiIHN0cm9rZT0ibm9uZSIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxwYXRoIGQ9Ik0gMCAwIE0gMTYwIDAgTSAxNjAgNDAgTSAwIDQwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0wLjUgLTAuNSkiPjxzd2l0Y2g+PGZvcmVpZ25PYmplY3Qgc3R5bGU9Im92ZXJmbG93OiB2aXNpYmxlOyB0ZXh0LWFsaWduOiBsZWZ0OyIgcG9pbnRlci1ldmVudHM9Im5vbmUiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIHJlcXVpcmVkRmVhdHVyZXM9Imh0dHA6Ly93d3cudzMub3JnL1RSL1NWRzExL2ZlYXR1cmUjRXh0ZW5zaWJpbGl0eSI+PGRpdiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCIgc3R5bGU9ImRpc3BsYXk6IGZsZXg7IGFsaWduLWl0ZW1zOiB1bnNhZmUgY2VudGVyOyBqdXN0aWZ5LWNvbnRlbnQ6IHVuc2FmZSBjZW50ZXI7IHdpZHRoOiAxNThweDsgaGVpZ2h0OiAxcHg7IHBhZGRpbmctdG9wOiAyMHB4OyBtYXJnaW4tbGVmdDogMXB4OyI+PGRpdiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgZm9udC1zaXplOiAwOyB0ZXh0LWFsaWduOiBjZW50ZXI7IG1heC1oZWlnaHQ6IDM2cHg7IG92ZXJmbG93OiBoaWRkZW47ICI+PGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyBmb250LXNpemU6IDEycHg7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGNvbG9yOiAjMDAwMDAwOyBsaW5lLWhlaWdodDogMS4yOyBwb2ludGVyLWV2ZW50czogYWxsOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXdyYXA6IG5vcm1hbDsgIj5BPC9kaXY+PC9kaXY+PC9kaXY+PC9mb3JlaWduT2JqZWN0Pjx0ZXh0IHg9IjgwIiB5PSIyNCIgZmlsbD0iIzAwMDAwMCIgZm9udC1mYW1pbHk9IkhlbHZldGljYSIgZm9udC1zaXplPSIxMnB4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5BPC90ZXh0Pjwvc3dpdGNoPjwvZz48cmVjdCB4PSIxNjAiIHk9IjAiIHdpZHRoPSIxNjAiIGhlaWdodD0iNDAiIGZpbGw9Im5vbmUiIHN0cm9rZT0ibm9uZSIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxwYXRoIGQ9Ik0gMTYwIDAgTSAzMjAgMCBNIDMyMCA0MCBNIDE2MCA0MCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwMDAwIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIHBvaW50ZXItZXZlbnRzPSJhbGwiLz48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMC41IC0wLjUpIj48c3dpdGNoPjxmb3JlaWduT2JqZWN0IHN0eWxlPSJvdmVyZmxvdzogdmlzaWJsZTsgdGV4dC1hbGlnbjogbGVmdDsiIHBvaW50ZXItZXZlbnRzPSJub25lIiB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiByZXF1aXJlZEZlYXR1cmVzPSJodHRwOi8vd3d3LnczLm9yZy9UUi9TVkcxMS9mZWF0dXJlI0V4dGVuc2liaWxpdHkiPjxkaXYgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWwiIHN0eWxlPSJkaXNwbGF5OiBmbGV4OyBhbGlnbi1pdGVtczogdW5zYWZlIGNlbnRlcjsganVzdGlmeS1jb250ZW50OiB1bnNhZmUgY2VudGVyOyB3aWR0aDogMTU4cHg7IGhlaWdodDogMXB4OyBwYWRkaW5nLXRvcDogMjBweDsgbWFyZ2luLWxlZnQ6IDE2MXB4OyI+PGRpdiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgZm9udC1zaXplOiAwOyB0ZXh0LWFsaWduOiBjZW50ZXI7IG1heC1oZWlnaHQ6IDM2cHg7IG92ZXJmbG93OiBoaWRkZW47ICI+PGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyBmb250LXNpemU6IDEycHg7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGNvbG9yOiAjMDAwMDAwOyBsaW5lLWhlaWdodDogMS4yOyBwb2ludGVyLWV2ZW50czogYWxsOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXdyYXA6IG5vcm1hbDsgIj5CPC9kaXY+PC9kaXY+PC9kaXY+PC9mb3JlaWduT2JqZWN0Pjx0ZXh0IHg9IjI0MCIgeT0iMjQiIGZpbGw9IiMwMDAwMDAiIGZvbnQtZmFtaWx5PSJIZWx2ZXRpY2EiIGZvbnQtc2l6ZT0iMTJweCIgdGV4dC1hbmNob3I9Im1pZGRsZSI+QjwvdGV4dD48L3N3aXRjaD48L2c+PHJlY3QgeD0iMzIwIiB5PSIwIiB3aWR0aD0iMTYwIiBoZWlnaHQ9IjQwIiBmaWxsPSJub25lIiBzdHJva2U9Im5vbmUiIHBvaW50ZXItZXZlbnRzPSJhbGwiLz48cGF0aCBkPSJNIDMyMCAwIE0gNDgwIDAgTSA0ODAgNDAgTSAzMjAgNDAiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBwb2ludGVyLWV2ZW50cz0iYWxsIi8+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTAuNSAtMC41KSI+PHN3aXRjaD48Zm9yZWlnbk9iamVjdCBzdHlsZT0ib3ZlcmZsb3c6IHZpc2libGU7IHRleHQtYWxpZ246IGxlZnQ7IiBwb2ludGVyLWV2ZW50cz0ibm9uZSIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgcmVxdWlyZWRGZWF0dXJlcz0iaHR0cDovL3d3dy53My5vcmcvVFIvU1ZHMTEvZmVhdHVyZSNFeHRlbnNpYmlsaXR5Ij48ZGl2IHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hodG1sIiBzdHlsZT0iZGlzcGxheTogZmxleDsgYWxpZ24taXRlbXM6IHVuc2FmZSBjZW50ZXI7IGp1c3RpZnktY29udGVudDogdW5zYWZlIGNlbnRlcjsgd2lkdGg6IDE1OHB4OyBoZWlnaHQ6IDFweDsgcGFkZGluZy10b3A6IDIwcHg7IG1hcmdpbi1sZWZ0OiAzMjFweDsiPjxkaXYgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IGZvbnQtc2l6ZTogMDsgdGV4dC1hbGlnbjogY2VudGVyOyBtYXgtaGVpZ2h0OiAzNnB4OyBvdmVyZmxvdzogaGlkZGVuOyAiPjxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazsgZm9udC1zaXplOiAxMnB4OyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBjb2xvcjogIzAwMDAwMDsgbGluZS1oZWlnaHQ6IDEuMjsgcG9pbnRlci1ldmVudHM6IGFsbDsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC13cmFwOiBub3JtYWw7ICI+QzwvZGl2PjwvZGl2PjwvZGl2PjwvZm9yZWlnbk9iamVjdD48dGV4dCB4PSI0MDAiIHk9IjI0IiBmaWxsPSIjMDAwMDAwIiBmb250LWZhbWlseT0iSGVsdmV0aWNhIiBmb250LXNpemU9IjEycHgiIHRleHQtYW5jaG9yPSJtaWRkbGUiPkM8L3RleHQ+PC9zd2l0Y2g+PC9nPjxyZWN0IHg9IjQ4MCIgeT0iMCIgd2lkdGg9IjE2MCIgaGVpZ2h0PSI0MCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSJub25lIiBwb2ludGVyLWV2ZW50cz0iYWxsIi8+PHBhdGggZD0iTSA0ODAgMCBNIDY0MCAwIE0gNjQwIDQwIE0gNDgwIDQwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0wLjUgLTAuNSkiPjxzd2l0Y2g+PGZvcmVpZ25PYmplY3Qgc3R5bGU9Im92ZXJmbG93OiB2aXNpYmxlOyB0ZXh0LWFsaWduOiBsZWZ0OyIgcG9pbnRlci1ldmVudHM9Im5vbmUiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIHJlcXVpcmVkRmVhdHVyZXM9Imh0dHA6Ly93d3cudzMub3JnL1RSL1NWRzExL2ZlYXR1cmUjRXh0ZW5zaWJpbGl0eSI+PGRpdiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCIgc3R5bGU9ImRpc3BsYXk6IGZsZXg7IGFsaWduLWl0ZW1zOiB1bnNhZmUgY2VudGVyOyBqdXN0aWZ5LWNvbnRlbnQ6IHVuc2FmZSBjZW50ZXI7IHdpZHRoOiAxNThweDsgaGVpZ2h0OiAxcHg7IHBhZGRpbmctdG9wOiAyMHB4OyBtYXJnaW4tbGVmdDogNDgxcHg7Ij48ZGl2IHN0eWxlPSJib3gtc2l6aW5nOiBib3JkZXItYm94OyBmb250LXNpemU6IDA7IHRleHQtYWxpZ246IGNlbnRlcjsgbWF4LWhlaWdodDogMzZweDsgb3ZlcmZsb3c6IGhpZGRlbjsgIj48ZGl2IHN0eWxlPSJkaXNwbGF5OiBpbmxpbmUtYmxvY2s7IGZvbnQtc2l6ZTogMTJweDsgZm9udC1mYW1pbHk6IEhlbHZldGljYTsgY29sb3I6ICMwMDAwMDA7IGxpbmUtaGVpZ2h0OiAxLjI7IHBvaW50ZXItZXZlbnRzOiBhbGw7IHdoaXRlLXNwYWNlOiBub3JtYWw7IHdvcmQtd3JhcDogbm9ybWFsOyAiPkQ8L2Rpdj48L2Rpdj48L2Rpdj48L2ZvcmVpZ25PYmplY3Q+PHRleHQgeD0iNTYwIiB5PSIyNCIgZmlsbD0iIzAwMDAwMCIgZm9udC1mYW1pbHk9IkhlbHZldGljYSIgZm9udC1zaXplPSIxMnB4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5EPC90ZXh0Pjwvc3dpdGNoPjwvZz48cGF0aCBkPSJNIDAgNDAgTSA2NDAgNDAgTSA2NDAgODAgTSAwIDgwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxyZWN0IHg9IjAiIHk9IjQwIiB3aWR0aD0iMTYwIiBoZWlnaHQ9IjQwIiBmaWxsPSJub25lIiBzdHJva2U9Im5vbmUiIHBvaW50ZXItZXZlbnRzPSJhbGwiLz48cGF0aCBkPSJNIDAgNDAgTSAxNjAgNDAgTSAxNjAgODAgTSAwIDgwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0wLjUgLTAuNSkiPjxzd2l0Y2g+PGZvcmVpZ25PYmplY3Qgc3R5bGU9Im92ZXJmbG93OiB2aXNpYmxlOyB0ZXh0LWFsaWduOiBsZWZ0OyIgcG9pbnRlci1ldmVudHM9Im5vbmUiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIHJlcXVpcmVkRmVhdHVyZXM9Imh0dHA6Ly93d3cudzMub3JnL1RSL1NWRzExL2ZlYXR1cmUjRXh0ZW5zaWJpbGl0eSI+PGRpdiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCIgc3R5bGU9ImRpc3BsYXk6IGZsZXg7IGFsaWduLWl0ZW1zOiB1bnNhZmUgY2VudGVyOyBqdXN0aWZ5LWNvbnRlbnQ6IHVuc2FmZSBjZW50ZXI7IHdpZHRoOiAxNThweDsgaGVpZ2h0OiAxcHg7IHBhZGRpbmctdG9wOiA2MHB4OyBtYXJnaW4tbGVmdDogMXB4OyI+PGRpdiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgZm9udC1zaXplOiAwOyB0ZXh0LWFsaWduOiBjZW50ZXI7IG1heC1oZWlnaHQ6IDM2cHg7IG92ZXJmbG93OiBoaWRkZW47ICI+PGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyBmb250LXNpemU6IDEycHg7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGNvbG9yOiAjMDAwMDAwOyBsaW5lLWhlaWdodDogMS4yOyBwb2ludGVyLWV2ZW50czogYWxsOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXdyYXA6IG5vcm1hbDsgIj5BNyBBNiBBNSBBNCBBMyBBMiBBMSBBMDwvZGl2PjwvZGl2PjwvZGl2PjwvZm9yZWlnbk9iamVjdD48dGV4dCB4PSI4MCIgeT0iNjQiIGZpbGw9IiMwMDAwMDAiIGZvbnQtZmFtaWx5PSJIZWx2ZXRpY2EiIGZvbnQtc2l6ZT0iMTJweCIgdGV4dC1hbmNob3I9Im1pZGRsZSI+QTcgQTYgQTUgQTQgQTMgQTIgQTEgQTA8L3RleHQ+PC9zd2l0Y2g+PC9nPjxyZWN0IHg9IjE2MCIgeT0iNDAiIHdpZHRoPSIxNjAiIGhlaWdodD0iNDAiIGZpbGw9Im5vbmUiIHN0cm9rZT0ibm9uZSIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxwYXRoIGQ9Ik0gMTYwIDQwIE0gMzIwIDQwIE0gMzIwIDgwIE0gMTYwIDgwIiBmaWxsPSJub25lIiBzdHJva2U9IiMwMDAwMDAiIHN0cm9rZS1taXRlcmxpbWl0PSIxMCIgcG9pbnRlci1ldmVudHM9ImFsbCIvPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0wLjUgLTAuNSkiPjxzd2l0Y2g+PGZvcmVpZ25PYmplY3Qgc3R5bGU9Im92ZXJmbG93OiB2aXNpYmxlOyB0ZXh0LWFsaWduOiBsZWZ0OyIgcG9pbnRlci1ldmVudHM9Im5vbmUiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIHJlcXVpcmVkRmVhdHVyZXM9Imh0dHA6Ly93d3cudzMub3JnL1RSL1NWRzExL2ZlYXR1cmUjRXh0ZW5zaWJpbGl0eSI+PGRpdiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCIgZGlyPSJsdHIiIHN0eWxlPSJkaXNwbGF5OiBmbGV4OyBhbGlnbi1pdGVtczogdW5zYWZlIGNlbnRlcjsganVzdGlmeS1jb250ZW50OiB1bnNhZmUgY2VudGVyOyB3aWR0aDogMTU4cHg7IGhlaWdodDogMXB4OyBwYWRkaW5nLXRvcDogNjBweDsgbWFyZ2luLWxlZnQ6IDE2MXB4OyI+PGRpdiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgZm9udC1zaXplOiAwOyB0ZXh0LWFsaWduOiBjZW50ZXI7IG1heC1oZWlnaHQ6IDM2cHg7IG92ZXJmbG93OiBoaWRkZW47ICI+PGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyBmb250LXNpemU6IDEycHg7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGNvbG9yOiAjMDAwMDAwOyBsaW5lLWhlaWdodDogMS4yOyBwb2ludGVyLWV2ZW50czogYWxsOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXdyYXA6IG5vcm1hbDsgIj5CNyBCNiBCNSBCNCBCMyBCMiBCMSBCMDwvZGl2PjwvZGl2PjwvZGl2PjwvZm9yZWlnbk9iamVjdD48dGV4dCB4PSIyNDAiIHk9IjY0IiBmaWxsPSIjMDAwMDAwIiBmb250LWZhbWlseT0iSGVsdmV0aWNhIiBmb250LXNpemU9IjEycHgiIHRleHQtYW5jaG9yPSJtaWRkbGUiPkI3IEI2IEI1IEI0IEIzIEIyIEIxIEIwPC90ZXh0Pjwvc3dpdGNoPjwvZz48cmVjdCB4PSIzMjAiIHk9IjQwIiB3aWR0aD0iMTYwIiBoZWlnaHQ9IjQwIiBmaWxsPSJub25lIiBzdHJva2U9Im5vbmUiIHBvaW50ZXItZXZlbnRzPSJhbGwiLz48cGF0aCBkPSJNIDMyMCA0MCBNIDQ4MCA0MCBNIDQ4MCA4MCBNIDMyMCA4MCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwMDAwIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIHBvaW50ZXItZXZlbnRzPSJhbGwiLz48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMC41IC0wLjUpIj48c3dpdGNoPjxmb3JlaWduT2JqZWN0IHN0eWxlPSJvdmVyZmxvdzogdmlzaWJsZTsgdGV4dC1hbGlnbjogbGVmdDsiIHBvaW50ZXItZXZlbnRzPSJub25lIiB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiByZXF1aXJlZEZlYXR1cmVzPSJodHRwOi8vd3d3LnczLm9yZy9UUi9TVkcxMS9mZWF0dXJlI0V4dGVuc2liaWxpdHkiPjxkaXYgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWwiIHN0eWxlPSJkaXNwbGF5OiBmbGV4OyBhbGlnbi1pdGVtczogdW5zYWZlIGNlbnRlcjsganVzdGlmeS1jb250ZW50OiB1bnNhZmUgY2VudGVyOyB3aWR0aDogMTU4cHg7IGhlaWdodDogMXB4OyBwYWRkaW5nLXRvcDogNjBweDsgbWFyZ2luLWxlZnQ6IDMyMXB4OyI+PGRpdiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVyLWJveDsgZm9udC1zaXplOiAwOyB0ZXh0LWFsaWduOiBjZW50ZXI7IG1heC1oZWlnaHQ6IDM2cHg7IG92ZXJmbG93OiBoaWRkZW47ICI+PGRpdiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyBmb250LXNpemU6IDEycHg7IGZvbnQtZmFtaWx5OiBIZWx2ZXRpY2E7IGNvbG9yOiAjMDAwMDAwOyBsaW5lLWhlaWdodDogMS4yOyBwb2ludGVyLWV2ZW50czogYWxsOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3b3JkLXdyYXA6IG5vcm1hbDsgIj5DNyBDNiBDNSBDNCBDMyBDMiBDMSBDMDwvZGl2PjwvZGl2PjwvZGl2PjwvZm9yZWlnbk9iamVjdD48dGV4dCB4PSI0MDAiIHk9IjY0IiBmaWxsPSIjMDAwMDAwIiBmb250LWZhbWlseT0iSGVsdmV0aWNhIiBmb250LXNpemU9IjEycHgiIHRleHQtYW5jaG9yPSJtaWRkbGUiPkM3IEM2IEM1IEM0IEMzIEMyIEMxIEMwPC90ZXh0Pjwvc3dpdGNoPjwvZz48cmVjdCB4PSI0ODAiIHk9IjQwIiB3aWR0aD0iMTYwIiBoZWlnaHQ9IjQwIiBmaWxsPSJub25lIiBzdHJva2U9Im5vbmUiIHBvaW50ZXItZXZlbnRzPSJhbGwiLz48cGF0aCBkPSJNIDQ4MCA0MCBNIDY0MCA0MCBNIDY0MCA4MCBNIDQ4MCA4MCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMDAwMDAwIiBzdHJva2UtbWl0ZXJsaW1pdD0iMTAiIHBvaW50ZXItZXZlbnRzPSJhbGwiLz48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMC41IC0wLjUpIj48c3dpdGNoPjxmb3JlaWduT2JqZWN0IHN0eWxlPSJvdmVyZmxvdzogdmlzaWJsZTsgdGV4dC1hbGlnbjogbGVmdDsiIHBvaW50ZXItZXZlbnRzPSJub25lIiB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiByZXF1aXJlZEZlYXR1cmVzPSJodHRwOi8vd3d3LnczLm9yZy9UUi9TVkcxMS9mZWF0dXJlI0V4dGVuc2liaWxpdHkiPjxkaXYgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWwiIGRpcj0ibHRyIiBzdHlsZT0iZGlzcGxheTogZmxleDsgYWxpZ24taXRlbXM6IHVuc2FmZSBjZW50ZXI7IGp1c3RpZnktY29udGVudDogdW5zYWZlIGNlbnRlcjsgd2lkdGg6IDE1OHB4OyBoZWlnaHQ6IDFweDsgcGFkZGluZy10b3A6IDYwcHg7IG1hcmdpbi1sZWZ0OiA0ODFweDsiPjxkaXYgc3R5bGU9ImJveC1zaXppbmc6IGJvcmRlci1ib3g7IGZvbnQtc2l6ZTogMDsgdGV4dC1hbGlnbjogY2VudGVyOyBtYXgtaGVpZ2h0OiAzNnB4OyBvdmVyZmxvdzogaGlkZGVuOyAiPjxkaXYgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazsgZm9udC1zaXplOiAxMnB4OyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBjb2xvcjogIzAwMDAwMDsgbGluZS1oZWlnaHQ6IDEuMjsgcG9pbnRlci1ldmVudHM6IGFsbDsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgd29yZC13cmFwOiBub3JtYWw7ICI+RDcgRDYgRDUgRDQgRDMgRDIgRDEgRDA8L2Rpdj48L2Rpdj48L2Rpdj48L2ZvcmVpZ25PYmplY3Q+PHRleHQgeD0iNTYwIiB5PSI2NCIgZmlsbD0iIzAwMDAwMCIgZm9udC1mYW1pbHk9IkhlbHZldGljYSIgZm9udC1zaXplPSIxMnB4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5ENyBENiBENSBENCBEMyBEMiBEMSBEMDwvdGV4dD48L3N3aXRjaD48L2c+PC9nPjxzd2l0Y2g+PGcgcmVxdWlyZWRGZWF0dXJlcz0iaHR0cDovL3d3dy53My5vcmcvVFIvU1ZHMTEvZmVhdHVyZSNFeHRlbnNpYmlsaXR5Ii8+PGEgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMCwtNSkiIHhsaW5rOmhyZWY9Imh0dHBzOi8vd3d3LmRpYWdyYW1zLm5ldC9kb2MvZmFxL3N2Zy1leHBvcnQtdGV4dC1wcm9ibGVtcyIgdGFyZ2V0PSJfYmxhbmsiPjx0ZXh0IHRleHQtYW5jaG9yPSJtaWRkbGUiIGZvbnQtc2l6ZT0iMTBweCIgeD0iNTAlIiB5PSIxMDAlIj5WaWV3ZXIgZG9lcyBub3Qgc3VwcG9ydCBmdWxsIFNWRyAxLjE8L3RleHQ+PC9hPjwvc3dpdGNoPjwvc3ZnPg==
```
returned 	Description 	Min value 	Max value 	Units 	Formula[a]
       00 	     0 	        4 	                     PIDs supported [01 - 20] 			Bit encoded [A7..D0] == [PID $01..PID $20] See below      
       05        5          1                        Engine coolant temperature
       0B        11         1                        Intake manifold absolute pressure     
       0C 	     12         2 	                     Engine speed 	0 	16,383.75 	rpm 	256 A + B 4 {\displaystyle {\frac {256A+B}{4}}} {\displaystyle {\frac {256A+B}{4}}}
       0D 	     13       	1 	                     Vehicle speed 	0 	255 	km/h 	A {\displaystyle A} A
       0E 	     14        	1                      	 Timing advance 	-64 	63.5 	° before TDC 	A 2 − 64 {\displaystyle {\frac {A}{2}}-64} {\displaystyle {\frac {A}{2}}-64}
       0F 	15 	1 	Intake air temperature 	-40 	215 	°C 	A − 40 {\displaystyle A-40} {\displaystyle A-40}
      11 	17 	1 	Throttle position 	0 	100 	% 	100 255 A {\displaystyle {\tfrac {100}{255}}A} {\displaystyle {\tfrac {100}{255}}A}
      19 	25 	2 	Oxygen Sensor 6 A: Voltage
                                  B: Short term fuel trim  0 -100 
      1C 	28 	1 	OBD standards this vehicle conforms to 	1 	250 	- 	enumerated. See below
      20 	32 	4 	PIDs supported [21 - 40] 				Bit encoded [A7..D0] == [PID $21..PID $40] See below
     22 	34 	2 	Fuel Rail Pressure (relative to manifold vacuum) 	0 	5177.265 	kPa 	0.079 ( 256 A + B ) {\displaystyle 0.079(256A+B)} {\displaystyle 0.079(256A+B)}

     24 	36 	4 	Oxygen Sensor 1
     AB: Air-Fuel Equivalence Ratio (lambda,λ)
     CD: Voltage 

     25 	37 	4 	Oxygen Sensor 2
       AB: Air-Fuel Equivalence Ratio (lambda,λ)
       CD: Voltage 

     33 	51 	1 	Absolute Barometric Pressure 	0 	255 	kPa 	A {\displaystyle A} A

    40 	64 	4 	PIDs supported [41 - 60] 				Bit encoded [A7..D0] == [PID $41..PID $60] See below

    42 	66 	2 	Control module voltage 	0 	65.535 	V 	256 A + B 1000 {\displaystyle {\frac {256A+B}{1000}}} {\displaystyle {\frac {256A+B}{1000}}}

    46 	70 	1 	Ambient air temperature 	-40 	215 	°C 	A − 40 {\displaystyle A-40} {\displaystyle A-40}

    52 	82 	1 	Ethanol fuel % 	0 	100 	% 	100 255 A {\displaystyle {\tfrac {100}{255}}A} {\displaystyle {\tfrac {100}{255}}A}

    5C 	92 	1 	Engine oil temperature 	-40 	210 	°C 	A − 40 {\displaystyle A-40} {\displaystyle A-40}

    60 	96 	4 	PIDs supported [61 - 80] 				Bit encoded [A7..D0] == [PID $61..PID $80] See below

#### Bitwise encoded PIDs

Some of the PIDs in the above table cannot be explained with a simple formula. A more elaborate explanation of these data is provided here:
Example MODE 01 PID 00

A request for this PID returns 4 bytes of data (Big-endian). Each bit, from MSB to LSB, represents one of the next 32 PIDs and specifies whether that PID is supported.

For example, if the car response is BE1FA813, it can be decoded like this:

    Hexadecimal 	 B 	  |    E    |    1    |    F    |	 A    |  	8   |  	1   |  	3
     Binary 	  1 0 1 1 | 1 1 1 0 | 0 0 0 1 | 1 1 1 1 | 1 0 1 0 | 1 0 0 0 | 0 0 0 1 | 0 0 1 1

    Supported? 	Yes  No  Yes  Yes | Yes  Yes  Yes  No | No No No Yes | Yes Yes Yes Yes |Yes No Yes No | Yes No No No | No No No Yes| No No Yes Yes
    PID number 	 01  02  03   04  | 05   06   07   08 | 09 0A 0B 0C| 0D 	0E 	0F 	10 |	11 	12 	13 	14 |	15 	16 	17 	18 |	19 	1A 	1B 	1C |	1D 	1E 	1F 	20

So, supported PIDs are: 01, 03, 04, 05, 06, 07, 0C, 0D, 0E, 0F, 10, 11, 13, 15, 1C, 1F and 20 

#### MODE 22

Speeduino responds to the Mode 22 request for the following PID: 


 	  PID(hex)  PID(Dec) 	Data bytes returned 	Description 	Min value 	Max value 	Units 	Formula[a]
       7701      0 	        2 	                     AuxIn1 Data   
       7702      0          2                        AuxIn2 Data
       7703      0 	        2 	                     AuxIn3 Data   
       7704      0          2                        AuxIn4 Data
       7705      0 	        2 	                     AuxIn5 Data   
       7706      0          2                        AuxIn6 Data
       7707      0 	        2 	                     AuxIn7 Data   
       7708      0          2                        AuxIn8 Data
       7709      0 	        2 	                     AuxIn9 Data   
       770A      0          2                        AuxIn10 Data
       770B      0 	        2 	                     AuxIn11 Data
       770C      0          2                        AuxIn12 Data
       770D      0 	        2 	                     AuxIn13 Data 
       770E      0          2                        AuxIn14 Data
       770F      0 	        2 	                     AuxIn15 Data 
       7710      0          2                        AuxIn16 Data


#### CAN (11-bit) bus format

The PID query and response occurs on the vehicle's CAN bus. Standard OBD requests and responses use functional addresses. The diagnostic reader initiates a query using CAN ID 7DFh[clarification needed], which acts as a broadcast address, and accepts responses from any ID in the range 7E8h to 7EFh. ECUs that can respond to OBD queries listen both to the functional broadcast ID of 7DFh and one assigned ID in the range 7E0h to 7E7h. Their response has an ID of their assigned ID plus 8 e.g. 7E8h through 7EFh.

This approach allows up to eight ECUs, each independently responding to OBD queries. The diagnostic reader can use the ID in the ECU response frame to continue communication with a specific ECU. In particular, multi-frame communication requires a response to the specific ECU ID rather than to ID 7DFh.

CAN bus may also be used for communication beyond the standard OBD messages. Physical addressing uses particular CAN IDs for specific modules (e.g., 720h for the instrument cluster in Fords) with proprietary frame payloads.
Query

The functional PID query is sent to the vehicle on the CAN bus at ID 7DFh, using 8 data bytes. The bytes are:
	Byte
PID Type 	0 	1 	2 	3 	4 	5 	6 	7
SAE Standard 	Number of
additional
data bytes:
2 	Service
01 = show current data;
02 = freeze frame;
etc. 	PID code
(e.g.: 05 = Engine coolant temperature) 	not used
(ISO 15765-2 suggests CCh)
Vehicle specific 	Number of
additional
data bytes:
3 	Custom service: (e.g.: 22 = enhanced data) 	PID code
(e.g.: 4980h) 	not used
(ISO 15765-2 suggests CCh)
Response

The vehicle responds to the PID query on the CAN bus with message IDs that depend on which module responded. Typically the engine or main ECU responds at ID 7E8h. Other modules, like the hybrid controller or battery controller in a Prius, respond at 07E9h, 07EAh, 07EBh, etc. These are 8h higher than the physical address the module responds to. Even though the number of bytes in the returned value is variable, the message uses 8 data bytes regardless (CAN bus protocol form Frameformat with 8 data bytes). The bytes are:
	Byte
PID Type 	0 	1 	2 	3 	4 	5 	6 	7
SAE Standard
7E8h,
7E9h,
7EAh,
etc. 	Number of
additional
data bytes:
3 to 6 	Custom service
Same as query, except that 40h is added to the service value. So:
41h = show current data;
42h = freeze frame;
etc. 	PID code
(e.g.: 05 = Engine coolant temperature) 	value of the specified parameter, byte 0 	value, byte 1 (optional) 	value, byte 2 (optional) 	value, byte 3 (optional) 	not used
(may be 00h or 55h)
Vehicle specific
7E8h, or 8h + physical ID of module. 	Number of
additional
data bytes:
4to 7 	Custom service: same as query, except that 40h is added to the service value.(e.g.: 62h = response to service 22h request) 	PID code
(e.g.: 4980h) 	value of the specified parameter, byte 0 	value, byte 1 (optional) 	value, byte 2 (optional) 	value, byte 3 (optional)
Vehicle specific
7E8h, or 8h + physical ID of module. 	Number of
additional
data bytes:
3 	7Fh this a general response usually indicating the module doesn't recognize the request. 	Custom service: (e.g.: 22h = enhanced diagnostic data by PID, 21h = enhanced data by offset) 	31h 	not used
(may be 00h)



 







