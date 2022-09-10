---
title: Smart RF Flash Programmer 2
description: Flashing Zigbee Modules using Smart RF Flash Programmer 2
hide:
  - tags
tags:
  - flashing
  - bsl
  - erase
---

# Flash Firmware using TI SmartRF Flash Programmer v2

Go to [TI's Website](https://www.ti.com/tool/FLASH-PROGRAMMER){target=_blank} and download SmartRF Flash Programmer v2.

Make sure you download and install FLASH-PROGRAMMER-2.

## Determine the USB port

Plug your device in and ensure that device is recognised by your OS:

On windows, use this in a Powershell or go to Device Manager

	$comports = Get-WMIObject Win32_SerialPort; $comports | Get-PnpDeviceProperty -InstanceId {$_.pnpdeviceid} -Keyname DEVPKEY_Device_BusReportedDeviceDesc | ForEach-Object { foreach($comport in $comports) { if ($comport.pnpdeviceid -eq $_.instanceid) { new-object psobject -property  @{COMPORT = $comport.deviceid; 'Device-Name' = $_.data} } } }

The drivers for CH340 should be automatically be picked up,check under "Ports (COM & LPT)" in Device Manager:

![BSL Button](/images/radio-docs/ch340-port-windows.png){ loading=lazy }
	
If you need to install the drivers manually, go [HERE](http://www.wch.cn/downloads/CH341SER_ZIP.html){target=_blank} for official drivers.
	
!!! TIP
        Double-check by undocking the device again.

## Put your stick in BSL mode

Please follow the following instructions to put your stick in BSL mode:

  - Unplug your stick from the host
  - Press the `BSL` pushbutton and keep holding while plugging the device back into the host:

![BSL Button](/images/radio-docs/ch340c-bsl.png){: style="height:15%;width:15%" loading=lazy} ![BSL Button](/images/radio-docs/ch340e-bsl.png){: style="height:15%;width:15%" loading=lazy}

  - Give it a few seconds for the device to settle and set up and release the BSL button
  - Your stick should now be in ROM bootloader mode

<ins>It's very important that you press and hold the BSL button **before** plugging it in to the host and release it **after a few seconds**. If you don't follow this, your stick will not enter BSL mode and flashing will fail.</ins>


## Select correct device

We need to tell SmartRF Flash Programmer v2 what target device we have on our stick. Select "CC2652P":

![Select correct chip](/images/radio-docs/flash-prog-device.png){: style="height:15%;width:15%" loading=lazy}


## Select firmware file and flash device

With the correct serial port chosen and target device selected, click "Browse" and select the firmware you want to flash (see [here](/radio-docs/quick-start/#step-2-download-the-correct-firmware-for-your-device) for help on choosing firmware).

!!! warning
	It is crucial that you download the correct firmware for your stick as using the wrong firmware will disable the BSL and you will need an external debugger / programmer to flash your stick again.</p>

With the correct firmware chosen, make sure that "Erase", "Program" and "Verify" are all chosen under "Actions" and press the blue button to start flashing:

![Flash windows](/images/radio-docs/flash-prog.png){: style="height:70%;width:70%" loading=lazy}

If all goes to plan, after a few seconds you should see a green bar confirming that the flashing operating suceeded:

![Flash succesful](/images/radio-docs/flash-prog-ok.png){: style="height:70%;width:70%" loading=lazy}

You can now proceed to configuring your software of choice see [HERE](/radio-docs/z2m-zha/).

If your stick is not in BSL mode or you have not chosen the correct serial port, you will get the following error message:

![Flash failed](/images/radio-docs/flash-prog-fail.png){: style="height:70%;width:70%" loading=lazy}

Unplug your stick and try again according the instructions.