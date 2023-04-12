---
title: ZigStar Stick v4
description: Zigbee USB Stick - CC2652P Zigbee Coordinator
tags:
  - zigbee stick
  - zigbee usb-stick
  - usb zigbee gateway
  - zigbee dongle
  - zigbee coordinator
hide:
  - tags
  - toc
---
<div class="swiper stick">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="../../assets/images/zigbee-stick-v4/ZigStar Stick - Top.png" alt=”zigbee stick”>
		  <div class="title" id="title_1">ZigStar Stick - Top</div>
        </div>
        <div class="swiper-slide">
          <img src="../../assets/images/zigbee-stick-v4/ZigStar Stick - Bottom.png" alt=”cc2652p zigbee stick”>
		  <div class="title" id="title_2">ZigStar Stick - Bottom</div>
        </div>
      </div>
	  <div class="swiper-pagination"></div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>

## Features

- [TI CC2652P](https://www.ti.com/product/CC2652P) SimpleLink™ 2.4 GHz Multiprotocol Wireless MCU targeting Zigbee,Bluetooth 5.1 Low Energy,Thread + 19.5-dBm high-power amplifier<br>
- Support RF-BM-2652P1 and RF-BM-2652P2 Module from RF-STAR,with CC2652P on board<br>
- BSL,RST Buttons<br>
- 2 LED for indication<br>
- Compatible with [Z2M](https://www.zigbee2mqtt.io/)and [ZHA](https://www.home-assistant.io/integrations/zha/)<br>
- SMA antenna port for an external antenna<br>
- Easy programming with [ZigStar Multi Tool](/radio-docs/zigstar-multi-tool/#zigstar-multi-tool).No external programmer needed!<br>
- Communicates via the common CH340E/CH340C USB-UART Bridge<br>
- Plug & Play, comes pre-flashed<br>

## Purchase 

Assembled versions of Zigbee Stick v4 is available for purchase.<br>
<b>Shiping is done from Germany</b><br>
Each order contains a fully assembled and tested PCBA along with a plastic enclosure and a small +3dBi antenna.

## Revisions

There are 2 versions of stick,both of them tested:<br>
- [CH340C 3D Printed Case version](https://github.com/mercenaruss/zigbee-stick-v4/raw/main/files/gerber/Gerber_Zigbee%20Stick%20v4.0%20-%20CH340C.zip), more easy to solder,Auto-BSL enabled and includes ESD protection.[^1]<br>
- [CH340C Factory Case version](https://github.com/mercenaruss/zigbee-stick-v4/raw/main/files/gerber/Gerber_Zigbee%20Stick%20v4.0%20-%20CH340C%20-%20Factory%20VG-S48_AK-N-12.zip),[^2] fits in this factory cases [VG-S48](https://letyshops.com/r/aliexpress-5891f3cb4a88)/[AK-N-12](https://letyshops.com/r/aliexpress-0f3a529a9464)<br>

CH340C versions use this [3D Model Case](https://github.com/mercenaruss/zigbee-stick-v4/blob/main/files/STL)<br>
Factory cases are found on Aliexpress: [VG-S48](https://letyshops.com/r/aliexpress-5891f3cb4a88)/[AK-N-12](https://letyshops.com/r/aliexpress-0f3a529a9464) 

## Bill of Materials:

EasyEDA Generated Boom,you can order on [LCSC](https://lcsc.com)directly - [BOM](https://github.com/mercenaruss/zigbee-stick-v4/blob/main/files/BOM_Zigbee%20Stick%204.0%20CH340E-C.csv)

| Designator  | Name  | Footprint | Quantity |
| :------------|:---------------|:-----|:--------:|
| U1| RF-BM-2652P1/P2| | 1 |
| U2|AMS1117-3.3 |SOT-223| 1 |
| U3 | CH340E/CH340C|MSOP-10/SOP-16 |1|
| R1 | 10 kohm|SMD 0805 |1|
| R2,R3 | 1 kohm|SMD 0805 |2|
| R4 | 100 ohm|SMD 0805 |1|
| C1| 10uF|SMD_L3.2-W1.6|1|
| C2,C4| 100nF|SMD 0805|2|
| C3| 22uF|SMD_L3.2-W1.6|1|
| L1,L2| RED/GREEN LED|SMD 0805|2|
| SBL,RST|PUSH BUTTON |SMD_L3.9-W3.0-P4.45|2|
| USB| USB A MALE|USB-A-SMD_USB-A-1-TH|1|
| JTAG| PIN HEADER 5 PIN|2.54x5P|1|
| ANT| SMA ANTENNA PORT 1.6mm||1|
| D1| ESD USBLC6-2SC6|SOT-23-6|1|

**WARNING** D1 is used only for CH340C and Factory Case sticks.<br>
Next items are not available on LCSC,you can get them on Aliexpress:<br>
 - [RF-BM-2652P1/P2](https://letyshops.com/r/aliexpress-c83c7878b18b)<br> 
 - [RP-SMA Antenna PCB Connector 1.2/1.6mm](https://letyshops.com/r/aliexpress-7507f61580c3)<br> 
 - [RP-SMA Antenna Female - Inner hole](https://letyshops.com/r/aliexpress-81d294a1360f)<br> 
 - Cases [VG-S48](https://letyshops.com/r/aliexpress-5891f3cb4a88)/[AK-N-12](https://letyshops.com/r/aliexpress-0f3a529a9464)<br> 
 
## Firmware

Module is compatible with [Z2M](https://www.zigbee2mqtt.io/).
Firmware [CC1352P2_CC2652P_launchpad_*.zip](https://github.com/Koenkk/Z-Stack-firmware/tree/master/coordinator/Z-Stack_3.x.0/bin).<br>
Default TX Power is <b>9dbm</b>. It can be adjusted in Z2M config section:

    experimental:
      transmit_power: 10

Available TX power values: -20,-18,-15,-12,-10,-9,-6,-5,-3,0,1..5,14..20 [^3]

## Downloads
 - [Gerbers](https://github.com/mercenaruss/zigbee-stick-v4/tree/main/files/gerber)<br> 
 - [STL Case](https://github.com/mercenaruss/zigbee-stick-v4/tree/main/files/STL)<br>
 - [Schematics (pdf), Revision 1](https://github.com/mercenaruss/zigbee-stick-v4/tree/main/files/schematics)<br> 
 - [LCSC Boom File](https://github.com/mercenaruss/zigbee-stick-v4/blob/main/files/BOM_Zigbee%20Stick%204.0%20CH340E-C.csv)<br>
 
## Video

*English subtitles available

<iframe width="560" height="315" src="https://www.youtube.com/embed/vhDZYdSpEH4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[^1]: **Not recomended for new assembly.**
[^2]: **Recomended version for assembly.**
[^3]: **After many tests recomended value is 10dbm, depending on your environment.**
