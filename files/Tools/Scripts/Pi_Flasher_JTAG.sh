#!/bin/bash

RST_PIN=24
BSL_PIN=27

curl -s https://raw.githubusercontent.com/mercenaruss/zigstar_gateways/main/files/Scripts/banner.txt > logo.txt && cat logo.txt && rm logo.txt

CYAN='\033[1;36m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${CYAN}Running Pi_Flasher_JTAG script${NC}"
sleep 3
if [ $1 ]; then
  RST_PIN=$1
fi
echo -e "${CYAN}RST pin set to $RST_PIN${NC}"

if [ $2 ]; then
  BSL_PIN=$2
fi
echo -e "${CYAN}BSL pin set to $BSL_PIN${NC}"

echo
echo -e "${CYAN}Installing dependencies${NC}"
apt install -y git unzip pigpio openocd

echo
echo -e "${CYAN}Cloning flash tool and firmware${NC}"
rm -rf zigbee-firmware
git clone https://github.com/jethome-ru/zigbee-firmware.git

echo
echo -e "${CYAN}Unpacking latest hex file${NC}"
archive=$(ls -1 zigbee-firmware/ti/coordinator/cc2652/*.zip | sort -r | head -1)
unzip -o $archive -d .
hexfile=$(ls -1 *.hex | head -1)
echo $hexfile


echo
echo -e "${CYAN}Enable BSL and RST pins${NC}"
if [ ! -e /sys/class/gpio/gpio$BSL_PIN ]; then
    echo $BSL_PIN > /sys/class/gpio/export
fi
echo out > /sys/class/gpio/gpio$BSL_PIN/direction

if [ ! -e /sys/class/gpio/gpio$RST_PIN ]; then
    echo $RST_PIN > /sys/class/gpio/export
fi
echo out > /sys/class/gpio/gpio$RST_PIN/direction

echo
echo -e "${CYAN}Enable BSL mode and restart ZigBee${NC}"
echo 0 > /sys/class/gpio/gpio$BSL_PIN/value
echo 0 > /sys/class/gpio/gpio$RST_PIN/value
echo 1 > /sys/class/gpio/gpio$RST_PIN/value

echo
echo -e "${CYAN}Wait 4 seconds before start${NC}"
sleep 4

echo
echo -e "${CYAN}Disable BSL mode${NC}"
echo 1 > /sys/class/gpio/gpio$BSL_PIN/value

echo
echo -e "${CYAN}Flashing${NC}"
sudo openocd -f interface/raspberrypi2-native.cfg -f target/ti_cc26x2.cfg -c 'transport select jtag' -c 'adapter speed 1000' -c "program $hexfile verify reset exit"

echo
echo -e "${CYAN}Restart ZigBee${NC}"
echo 0 > /sys/class/gpio/gpio$RST_PIN/value
echo 1 > /sys/class/gpio/gpio$RST_PIN/value

echo
echo -e "${RED}Deleting all files${NC}"
rm -rf cc2538-bsl
rm -rf zigbee-firmware
rm $hexfile
rm -- "$0"
echo
echo -e "${GREEN}Flashing complete${NC}"