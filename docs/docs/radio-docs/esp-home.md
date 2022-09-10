---
title: Configuration ESP-HOME
description: ZigStar LAN Coordinator Setup Documentation
hide:
  - tags
tags:
  - ESP-HOME
  - LAN
  - WEB
---

# ESP-HOME

In order to change default setting for ESP-HOME firmware, please follow next guides.

## Install ESP-HOME 

Choose from 2 optional avalaible at the moment:

=== "HA Supervised"

	It's using Home Assistant add-on, install instruction are found [HERE](https://esphome.io/guides/getting_started_hassio.html){target=_blank}
	
=== "Standalone"

	It can be installed barematel or using docker( personally using on windows ), follow instructions from [HERE](https://esphome.io/guides/getting_started_command_line.html){target=_blank}
	
!!! info	
	For both cases is required to download .yaml for your PCB

## Substitutions

For example you want to change gateway hostname, friendly name in HA, your API and OTA passwords.

In this case edit just next items,at the beggining of .yaml file:

![Esp-Home-Edit](/images/radio-docs/esp-home/esp-home-sub.png){ loading=lazy }

## Static IP

In order to make your device have the same IP each time after reboot, you have 2 ways to achieve this: 

- setup static ip in your router config 
- modify .yaml file.

![Esp-Home-Static IP](/images/radio-docs/esp-home/esp-home-static.png){ loading=lazy }

## Generate and install updated firmware

![Esp-Home-Install](/images/radio-docs/esp-home/esp-home-install.png){ loading=lazy }


!!! danger
	Any error in ip configuration could cause the gw to not connect and require to be flashed with Serial to USB converter( applies to Wifi Gateway)
!!! danger
	After changing IP parameters, OTA update it's not gonna work,until firmware is flashed to ESP module,using Manual Download.
		
=== "Wirelessly"

	If you made changes only in subtitutions section,then just press Install button in ESP-HOME interface,followed by Wirelessly.
	
	![Esp-Home-Install Wirelles1](/images/radio-docs/esp-home/esp-home-method-w.png){ loading=lazy }
	
	![Esp-Home-Install Wirelles2](/images/radio-docs/esp-home/esp-home-manual-wirelles.png){ loading=lazy }
	
=== "Manual Download"

	After changing IP parameters, OTA update it's not gonna work,until firmware is flashed to ESP module manually.
	
	1. Press Manual Download
	
		![Esp-Home-Manual Download](/images/radio-docs/esp-home/esp-home-method-m.png){ loading=lazy }
	
	2. Debug console confirm that firmware was built and Download button appear in righ bottom corner.
	
		![Esp-Home-Debug](/images/radio-docs/esp-home/esp-home-manual-success.png){ loading=lazy } ![Sub](/images/radio-docs/esp-home/esp-home-manual-download.png){ loading=lazy }
	
	3. Open your gateway address in browser and update firmware:
	
		![Esp-Home-OTA Update](/images/radio-docs/esp-home/esp-home-update.png){ loading=lazy }
	

