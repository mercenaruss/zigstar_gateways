---
title: ZigStar LilyZig
description: ZigStar Zigbee POE Coordinator based on CC2652P.
tags:
  - zigbee gateway poe
  - zigbee poe coordinator
  - zigbee ethernet gateway
  - zigbee poe bridge
  - ethernet zigbee
  - zigbee ethernet
hide:
  - tags
  - toc
---

<div class="swiper stick">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="../../assets/images/zigbee-lilyzig/Photo 1.jpg" alt=”zigbee gateway poe”>
        </div>
        <div class="swiper-slide">
          <img src="../../assets/images/zigbee-lilyzig/Photo 2.jpg" alt=”zigbee gateway lan”>
        </div>
		<div class="swiper-slide">
          <img src="../../assets/images/zigbee-lilyzig/Photo 3.jpg" alt=”zigbee lan poe”>
        </div>
		<div class="swiper-slide">
          <img src="../../assets/images/zigbee-lilyzig/Photo 4.jpg" alt=”zigbee gw poe”>
        </div>
      </div>
	  <div class="swiper-pagination"></div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>

!!! note

    **LiliZig is retired** Not anymore on sale. Available only for self assembly.

## Features

- <b>802.3af PoE</b> or USB C-Type [^1]
- CC2652P TI chip, the most powerful (+20dB)
- <b> 2 WORKING MODES: </b> LAN/POE Coordinator or USB Coordinator/Router
- 2 LED for indication [KoenK Firmware](https://github.com/Koenkk/Z-Stack-firmware/tree/master/coordinator/Z-Stack_3.x.0/bin)
- Communicates via USB or LAN network with [Z2M](https://www.zigbee2mqtt.io/) and [ZHA](https://www.home-assistant.io/integrations/zha/)
- SMA port for an external antenna
- Easy programming with [ZigStar Multi Tool](/radio-docs/zigstar-multi-tool/#zigstar-multi-tool). No external programmer needed!<br>

!!! danger "Important notice"
    **USB and PoE is forbidden to use simultaneously!**<br>
    LilyZig has **no galvano isolation** from Ethernet's power supply, when you program the board via the USB-C connector the Ethernet cable should be disconnected.

## Revisions

There are 2 version of LilyZig POE Gateway,what are tested:<br>
- [RF-STAR RF-BM-2652P2 - 20dBm](https://github.com/mercenaruss/zigstar_gateways/raw/main/files/Gerbers/LilyZig/Gerber_TTGO_RF-BM-2652P2.zip)<br>
- [Ebyte E72-2G4M20S1E  - 20dBm](https://github.com/mercenaruss/zigstar_gateways/raw/main/files/Gerbers/LilyZig/Gerber_TTGO_E72-2G4M20S1E.zip)<br> 


!!! INFO
    - RF-STAR RF-BM-2652P2 recommended
	  - PCB thickness 1.2mm is recommended
	

## Bill of Materials

EasyEDA Generated BOM,you can order on [LCSC](https://lcsc.com) directly - [BOM](https://github.com/mercenaruss/zigstar_gateways/blob/main/files/BOM/BOM_TTGO_RF-BM-2652P2.csv)

Next items are not available on LCSC,you can get them on Aliexpress:

| Name  | Shop 1 | Shop 2 |
| :------------|:---------------|:-----|
| LILYGO® TTGO T-Internet-POE| [CLICK](https://letyshops.com/r/aliexpress-69affae66921)| [CLICK](https://letyshops.com/r/aliexpress-95230416106d)|
| RF-STAR RF-BM-2652P1/P2|[CLICK](https://letyshops.com/r/aliexpress-c83c7878b18b) | [CLICK](https://letyshops.com/r/aliexpress-dbe513b72282) |
| Ebyte E72-2G4M20S1E | [CLICK](https://letyshops.com/r/aliexpress-b25ea4b8642a)| [CLICK](https://letyshops.com/r/aliexpress-00563b7dcf47) |
| RP-SMA Antenna PCB Connector 1.2mm | [CLICK](https://letyshops.com/r/aliexpress-7507f61580c3)| N/A |
| RP-SMA Antenna Female - Inner hole |[CLICK](https://letyshops.com/r/aliexpress-81d294a1360f)| [CLICK](https://letyshops.com/r/aliexpress-5ebae68206ac) |

## Firmware

Help on choosing correct firmware for your device is located [HERE](/radio-docs/quick-start/#step-2-download-the-correct-firmware-for-your-device)

## Flashing

* [ZigStar ESP Firmware!](https://github.com/xyzroe/ZigStarGW-FW/releases)[^2]<br> 
* Zigbee Module flashing guide - [ZigStar Multi Tool](/radio-docs/zigstar-multi-tool/#zigstar-multi-tool))<br>

## Downloads
 - [Gerbers](https://github.com/mercenaruss/zigstar_gateways/tree/main/files/Gerbers)
 - [STL Case](https://github.com/mercenaruss/zigstar_gateways/tree/main/files/STL)
 - [Schematics (pdf)](https://github.com/mercenaruss/zigstar_gateways/tree/main/files/Schematics)
 - [LCSC Boom File](https://github.com/mercenaruss/zigstar_gateways/tree/main/files/BOM)

## Video

*English subtitles available

<iframe width="560" height="315" src="https://www.youtube.com/embed/0xBRh4BmTmA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[^1]: **USB and PoE is forbidden to use simultaneously**
[^2]: **All forces will be used for this firmware, ESPHOME debugging and development is depreceated**