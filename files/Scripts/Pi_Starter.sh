#!/bin/bash

curl -s https://raw.githubusercontent.com/mercenaruss/zigstar_gateways/main/files/Scripts/banner.txt > logo.txt && cat logo.txt && rm logo.txt


echo "Running Pi_Starter script"
sleep 3
echo
echo "Installing sed"
sudo apt update && sudo apt install -y sed


echo
echo "Disabling system console"
STR='console=serial0,115200'
sudo sed -i .bak "/$STR/d" "cmnline.txt"
sudo systemctl disable hciuart


echo
echo "Disabling BT & Wi-Fi"
sudo sh -c "echo 'dtoverlay=disable-bt' >> /boot/config.txt"
sudo sh -c "echo 'dtoverlay=disable-wifi' >> /boot/config.txt"


echo
echo "Installing i2c-tools"
sudo apt install -y i2c-tools


echo
echo "Installing ntpdate"
sudo apt install -y ntpdate && sudo ntpdate -s 0.pool.ntp.org


echo
echo "Enabling RTC"
sudo echo pcf8563 0x51 > /sys/class/i2c-adapter/i2c-0/new_device
sudo hwclock -w && sudo hwclock -r


sudo rm -- "$0"