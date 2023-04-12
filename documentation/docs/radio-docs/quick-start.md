---
title: Quick Start
description: Quick Start for ZigStar Projects
hide:
  - tags
tags:
  - Quickstart
  - ZHA
  - Zigbee2MQTT
  - Z2M
  - Home Assistant
  - HA
---

# Quick Start for ZigStar Projects

This page provides a overview of what you'll need to do to set up your USB/LAN Coordinator to be used with the great collection of open-source home automation software, [Z2M(Zigbee2MQTT)](https://www.zigbee2mqtt.io/)or [ZHA](https://www.home-assistant.io/integrations/zha/)

## 1.Plug your device in

First step in getting your coordinator working is to ensure that your computer, server or Raspberry Pi recognises the device plugged in (specifically, the "USB to Serial Converter" chip) and installs the drivers needed. 

For network devices that they are reachable by network, using IP address or hostname.

Each coordinator is compatible by default with [Z2M(Zigbee2MQTT)](https://www.zigbee2mqtt.io/)and [ZHA](https://www.home-assistant.io/integrations/zha/)

## 2.Download firmware

If you are using correct firmware,you dont need an external debugger/programmer as the chips used have a built-in bootloader (BSL)! 

There are two ways you can use your device, either as a **coordinator** or a **router**.

=== "**Coordinator**"
	This is the firmware you need if you're going to be using your coordinator with [Z2M(Zigbee2MQTT)](https://www.zigbee2mqtt.io/), [ZHA(Home Assistant)](https://www.home-assistant.io/integrations/zha/)or any other ZNP-firmware-compliant software.
     
	| RF-STAR RF-BM-2652P2 | Ebyte E72-2G4M20S1E
	|----------------------|--------------------|
	| [CC1352P2_CC2652P_launchpad_*.zip](https://github.com/Koenkk/Z-Stack-firmware/tree/master/coordinator/Z-Stack_3.x.0/bin)| [CC1352P2_CC2652P_other_*.zip](https://github.com/Koenkk/Z-Stack-firmware/tree/master/coordinator/Z-Stack_3.x.0/bin)|

	!!! info
		CC1352P2_CC2652P_launchpad_*.zip - RF-BM-2652P1/P2 modules<br>
		CC1352P2_CC2652P_other_*.zip - E72-2G4M20S1E module
		
=== "**Router**"
	 If you're looking to extend the range of your network, flash your coordinator with the router firmware and plug it into a power source somewhere central in your home for stand-alone operation. Refer to the [README](https://github.com/Koenkk/Z-Stack-firmware/blob/master/router/Z-Stack_3.x.0/bin/README.md)for setup instructions.
	
	| RF-STAR RF-BM-2652P2 | Ebyte E72-2G4M20S1E
	|----------------------|--------------------|
	| [CC1352P2_CC2652P_launchpad_router_*.zip](https://github.com/Koenkk/Z-Stack-firmware/tree/master/coordinator/Z-Stack_3.x.0/bin)| [CC1352P2_CC2652P_other_router_*.zip](https://github.com/Koenkk/Z-Stack-firmware/tree/master/coordinator/Z-Stack_3.x.0/bin)|

	!!! info
		CC1352P2_CC2652P_launchpad_router_*.zip - RF-BM-2652P1/P2 modules<br>
		CC1352P2_CC2652P_other_router*.zip - E72-2G4M20S1E module

!!! danger
	It is crucial that you download the correct firmware for your coordinator as using the wrong firmware will disable the BSL and you will need an external debugger / programmer to flash your coordinator again.</p>
		
## 3.Flash the firmware

With the firmware of your choice downloaded and unziped, you should end up with a single .hex file that will need to be flashed to your coordinator. Three options for that:

  - The beginner friendly option: [ZigStar Multi Tool](/radio-docs/zigstar-multi-tool/#zigstar-multi-tool)
  - Windows-only option: [Flash firmware using TI's Flash Programmer 2](/radio-docs/flash-ti-flash-prog/)
  - Cross-platform option using Python: [Flash firmware using cc2538-bsl](/radio-docs/flash-cc-bsl/)

## 4.Setup Zigbee2MQTT or ZHA

Configure your choice of software so that it can talk to your coordinator.
For instruction go [HERE](/radio-docs/z2m-zha/)

## 5.Have fun!

With your coordinator flashed and the software of your choice configured,  you can start to pair your devices and start exploring the world of open-source Home Automation!<br>
A significant amount of effort goes to developing, maintaining and supporting the open source home automation ecosystem so if you can, please consider donating to the great software projects that are mentioned in these pages.<br>

A portion of each sale of ZigStar radio boards will be donated to [@Koenkk](https://github.com/Koenkk/) to support his work on [Zigbee2mqtt](https://github.com/Koenkk/zigbee2mqtt).
