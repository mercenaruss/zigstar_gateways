---
title: ZigStar Olizig
description: Zigbee POE Coordinator based on CC2652P.
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
          <img src="../../assets/images/zigbee-olizig/Olimex POE - 4.png" alt=”zigbee gateway poe”>
        </div>
    <div class="swiper-slide">
          <img src="../../assets/images/zigbee-olizig/Olimex POE - 1.png" alt=”zigbee lan bridge">
        </div>
		<div class="swiper-slide">
          <img src="../../assets/images/zigbee-olizig/Olimex POE - 2.png" alt=”ethernet zigbee">
        </div>
    <div class="swiper-slide">
          <img src="../../assets/images/zigbee-olizig/Olimex POE - 3.png" alt=”olimex zigbee">
        </div>
      </div>
	  <div class="swiper-pagination"></div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>

## Features

- <b>802.3af PoE</b> or USB C-Type 
- CC2652P TI chip, the most powerful (+20dB)
- <b> 2 WORKING MODES: </b> LAN/POE Coordinator or USB Coordinator/Router
- 2 LED for indication [KoenK Firmware](https://github.com/Koenkk/Z-Stack-firmware/tree/master/coordinator/Z-Stack_3.x.0/bin)
- Communicates via USB or LAN network with [Z2M](https://www.zigbee2mqtt.io/) and [ZHA](https://www.home-assistant.io/integrations/zha/)
- DS18B20 temperature sensor for extra safety
- Power Switch beetween POE and USB power
- SMA port for an external antenna
- Easy programming with [ZigStar Multi Tool](/radio-docs/zigstar-multi-tool/#zigstar-multi-tool). No external programmer needed!<br>

## Flashing

* [ZigStar ESP Firmware!](https://github.com/xyzroe/ZigStarGW-FW/releases)[^1]<br> 
* Zigbee Module flashing guide - [ZigStar Multi Tool](/radio-docs/zigstar-multi-tool/#zigstar-multi-tool))<br>

## Downloads

- [Gerbers](https://github.com/mercenaruss/zigstar_gateways/tree/main/files/Gerbers)
- [Schematics](https://github.com/mercenaruss/zigstar_gateways/tree/main/files/Schematics)
- [LCSC BOM File](https://github.com/mercenaruss/zigstar_gateways/tree/main/files/BOM)

[^1]: **All forces will be used for this firmware, ESPHOME debugging and development is depreceated**