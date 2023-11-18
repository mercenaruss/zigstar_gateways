#!/bin/bash

curl -s https://raw.githubusercontent.com/mercenaruss/zigstar_gateways/main/files/Tools/Scripts/banner.txt > logo.txt && cat logo.txt && rm logo.txt

CYAN='\033[1;36m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
echo -e "${CYAN}Running Pi_Starter script${NC}"
sleep 3
echo
echo -e "${CYAN}Installing sed${NC}"
echo
sudo apt update && sudo apt install -y sed pigpio

echo
echo -e "${CYAN}Disabling system console${NC}"
echo
sudo sed -i 's/console=serial0,115200 //' /boot/cmdline.txt
sudo sed -i 's/console=serial0,115200 //' /boot/firmware/cmdline.txt
sudo systemctl disable hciuart
echo
echo -e "${CYAN}Enable UART1${NC}"
echo
sudo sh -c "echo 'enable_uart=1' >> /boot/config.txt"

echo
echo -e "${CYAN}Disabling BT & Wi-Fi${NC}"
echo
read -p "$(echo -e ${RED}"Do you wish to disable BT?(y/n)?"${NC})" choice
case "$choice" in 
  y|Y ) echo -e "${GREEN}Yes, BT is disabled${NC}"; sudo sh -c "echo 'dtoverlay=disable-bt' >> /boot/config.txt";;
  n|N ) echo -e "${RED}No, BT is ON(possible interfercence with ZigBee${NC}";;
  * ) echo "invalid";;
esac
echo
read -p "$(echo -e ${RED}"Do you wish to disable WiFi?(y/n)?"${NC})" choice
case "$choice" in 
  y|Y ) echo -e "${GREEN}Yes, Wifi is disabled${NC}"; sudo sh -c "echo 'dtoverlay=disable-wifi' >> /boot/config.txt";;
  n|N ) echo -e "${RED}No, Wifi is ON(possible interfercence with ZigBee${NC}";;
  * ) echo "invalid";;
esac
sleep 2
echo
echo -e "${CYAN}Installing i2c-tools${NC}"
sudo apt install -y i2c-tools

echo
echo -e "${CYAN}Installing ntpdate${NC}"
sudo apt install -y ntpdate && sudo ntpdate -s 0.pool.ntp.org
sleep 1

echo
echo -e "${CYAN}Enabling RTC(Real Time Clock)${NC}"
echo
sudo raspi-config nonint do_i2c 0
sleep 1
sudo i2cdetect -y 1
sleep 1
echo 'pcf8563 0x51' | sudo tee /sys/class/i2c-adapter/i2c-1/new_device
# sudo echo pcf8563 0x51 > /sys/class/i2c-adapter/i2c-1/new_device
sleep 2
echo
echo -e "${CYAN}RTC write current time${NC}"
sudo hwclock -w
echo
echo -e "${CYAN}Wait 4 seconds before RTC read${NC}"
sleep 2
echo
echo -e "${CYAN}RTC read current time${NC}"
echo
sudo hwclock -r
echo
#Choose to add to init
read -p "$(echo -e ${RED}"Do you want to enable RTC on boot?(y/n)?"${NC})" choice
case "$choice" in 
  y|Y ) echo -e "${GREEN}Yes, RTC is enabled on boot${NC}"; sudo sed -i 's/exit 0//' /etc/rc.local; sudo sh -c "echo 'sudo echo pcf8563 0x51 > /sys/class/i2c-adapter/i2c-1/new_device' >> /etc/rc.local"; sudo sh -c "echo 'sudo hwclock -s' >> /etc/rc.local"; sudo sh -c "echo 'exit 0' >> /etc/rc.local"; sudo sh -c "echo 'echo RTC Clock is enabled' >> /home/pi/.bashrc"; sudo sh -c "echo 'sudo hwclock -r' >> /home/pi/.bashrc";;
  n|N ) echo -e "${RED}No, you will active manually${NC}";;
  * ) echo "invalid";;
esac
echo
echo -e "${CYAN}You are ready to use ZigiHAT${NC}"
echo
read -p "$(echo -e ${RED}"Do you want to reboot?(y/n)?"${NC})" choice
case "$choice" in 
  y|Y ) echo -e "${GREEN}Reboot in 10 sec${NC}"; sleep 10; sudo reboot;;
  n|N ) echo -e "${RED}No, you will need to reboot manually${NC}";;
  * ) echo "invalid";;
esac
sudo rm -- "$0"
