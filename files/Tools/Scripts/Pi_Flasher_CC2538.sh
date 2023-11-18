#!/bin/bash

PORT=/dev/ttyAMA0
RST_PIN=24
BSL_PIN=27

curl -s https://raw.githubusercontent.com/mercenaruss/zigstar_gateways/main/files/Tools/Scripts/banner.txt > logo.txt && cat logo.txt && rm logo.txt

CYAN='\033[1;36m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${CYAN}Running Pi_Flasher_CC2538 script${NC}"
sleep 3
if [ $1 ]; then
  PORT=$1
fi
echo -e "${CYAN}Flash port set to $PORT${NC}"

if [ $2 ]; then
  RST_PIN=$2
fi
echo -e "${CYAN}RST pin set to $RST_PIN${NC}"

if [ $3 ]; then
  BSL_PIN=$3
fi
echo -e "${CYAN}BSL pin set to $BSL_PIN${NC}"

echo
echo -e "${CYAN}Installing dependencies${NC}"
sudo apt install -y git unzip python3 python3-pip pigpio python3.11-venv
echo
echo -e "${CYAN}Activate Python Enviroment${NC}"
python -m venv env
source env/bin/activate
pip3 install pyserial intelhex


echo
echo -e "${CYAN}Cloning flash tool and firmware${NC}"
sudo rm -rf cc2538-bsl && sudo rm -rf zigbee-firmware
git clone https://github.com/JelmerT/cc2538-bsl.git
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
    sudo echo $BSL_PIN > /sys/class/gpio/export
fi
sleep 2
sudo echo out > /sys/class/gpio/gpio$BSL_PIN/direction
sleep 2
if [ ! -e /sys/class/gpio/gpio$RST_PIN ]; then
    sudo echo $RST_PIN > /sys/class/gpio/export
fi
sleep 2
sudo echo out > /sys/class/gpio/gpio$RST_PIN/direction
sleep 2
echo
echo -e "${CYAN}Enable BSL mode and restart ZigBee${NC}"
sudo echo 0 > /sys/class/gpio/gpio$BSL_PIN/value
sudo echo 0 > /sys/class/gpio/gpio$RST_PIN/value
sudo echo 1 > /sys/class/gpio/gpio$RST_PIN/value

echo
sudo echo -e "${CYAN}Wait 4 seconds before start${NC}"
sleep 4

echo
sudo echo -e "${CYAN}Disable BSL mode${NC}"
sudo echo 1 > /sys/class/gpio/gpio$BSL_PIN/value

echo
echo -e "${CYAN}Flashing${NC}"
python3 cc2538-bsl/cc2538-bsl.py -p $PORT -ewv $hexfile
echo
echo -e "${CYAN}Deactivate Python Enviroment${NC}"
deactivate
echo
echo -e "${CYAN}Restart ZigBee${NC}"
sudo echo 0 > /sys/class/gpio/gpio$RST_PIN/value
sudo echo 1 > /sys/class/gpio/gpio$RST_PIN/value

echo
echo -e "${RED}Deleting all files${NC}"
sudo rm -rf cc2538-bsl && sudo rm -rf zigbee-firmware && sudo rm -rf env && sudo rm -rf firmware_*.patch
rm $hexfile
rm -- "$0"
echo
echo -e "${GREEN}Flashing complete${NC}"