---
title: ZigStar ZigiHAT
description: Raspberry HAT - Zigbee Coordinator
tags:
  - raspberry coordinator
  - raspberry zigbee shield
  - raspberry hat
  - zigihat
hide:
  - tags
  - toc
---

<div class="swiper stick">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="../../assets/images/zigbee-zigihat/ZigiHAT-1.png" alt=”zigbee gateway lan”>
        </div>
    <div class="swiper-slide">
          <img src="../../assets/images/zigbee-zigihat/ZigiHAT-2.png" alt=”zigbee lan bridge">
        </div>
		<div class="swiper-slide">
          <img src="../../assets/images/zigbee-zigihat/ZigiHAT-3.png" alt=”ethernet zigbee">
        </div>
      </div>
	  <div class="swiper-pagination"></div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>

## Features
- [CC2652P](https://www.ti.com/product/CC2652P)chip from Texas Instruments, using the [RF-BM-2652P2](https://letyshops.com/r/aliexpress-c83c7878b18b)module:
    - Max. RF Power: 20dBm
    - Built-in ROM serial bootloader - no external programmer/debugger needed
- SMA antenna for 2.4GHz(ZigBee)
- PoE IEEE 802.3af or passive 48V PoE support
- RTC with backup battery for offline timekeeping
- ID EEEPROM (firmware still under development)
- Easy programming using [CC2538-BSL](https://github.com/JelmerT/cc2538-bsl)or [OpenOCD](https://openocd.org/)JTAG([scripts provided](#flashing))
- QWIIC/Stemma QT compatible I2C expansion header
- BSL,RESET Buttons


## What is included:
- ZigiHAT Addon board - 1 pcs
- Standoff - 4 pcs
- Plastic screws - 4 pcs

## Flashing

To make setup and flashing procedure more pleasant for end-user,we make some scripts to be used for setup of ZigiHAT<br>

- <b>Pi_Flasher_CC2538</b> - Run to flash last [Koenkk firmware](https://github.com/Koenkk/Z-Stack-firmware)using [CC2538-BSL](https://github.com/JelmerT/cc2538-bsl)<br>
  ```
	curl -s https://raw.githubusercontent.com/mercenaruss/zigstar_gateways/main/files/Tools/Scripts/Pi_Flasher_CC2538.sh > Pi_Flasher_CC2538.sh && chmod +x ./Pi_Flasher_CC2538.sh && ./Pi_Flasher_CC2538.sh
  ```
- <b>Pi_Flasher_JTAG</b> - Run to flash over JTAG the last [Koenkk firmware](https://github.com/Koenkk/Z-Stack-firmware)using [OpenOCD](https://openocd.org/)
  ```
  curl -s https://raw.githubusercontent.com/mercenaruss/zigstar_gateways/main/files/Tools/Scripts/Pi_Flasher_JTAG.sh > Pi_Flasher_JTAG.sh && chmod +x ./Pi_Flasher_JTAG.sh && ./Pi_Flasher_JTAG.sh
  ```
- <b>Pi_Starter</b> - Run to setup your Raspberry Pi Wifi/Bluetooth, RTC and I2C,what is available on board of ZigiHAT
  ```
  curl -s https://raw.githubusercontent.com/mercenaruss/zigstar_gateways/main/files/Tools/Scripts/Pi_Starter.sh > Pi_Starter.sh && chmod +x ./Pi_Starter.sh && ./Pi_Starter.sh
  ```

!!! tip
      
    Wifi and Bluetooth is recomended to disable in case in not used by system,when <b>Pi_Starter</b> ask you. 

??? danger "Flashing settings"
    In order to use any of flashing methods(<b>Pi_Flasher_CC2538</b> or <b>Pi_Flasher_JTAG</b>),all swithes from DIP switch(FLASH) should be in ON position.

## Downloads

- [Gerbers](https://github.com/mercenaruss/zigstar_gateways/tree/main/files/Gerbers)
- [Schematics](https://github.com/mercenaruss/zigstar_gateways/tree/main/files/Schematics)
- [LCSC BOM File](https://github.com/mercenaruss/zigstar_gateways/tree/main/files/BOM)