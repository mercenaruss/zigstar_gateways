#!/bin/bash

PORT_T=/dev/ttyS1
RST_PIN_T=18
BSL_PIN_T=16
PORT_Z=/dev/ttyS2
RST_PIN_Z=11
BSL_PIN_Z=13

CYAN='\033[1;36m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${CYAN}Running Flasher_CC2538 script${NC}"
sleep 3
if [ $1 ]; then
  PORT_T=$1
fi
echo -e "${CYAN}Flash port for Thread is set to $PORT_T${NC}"

if [ $2 ]; then
  RST_PIN_T=$2
fi
echo -e "${CYAN}RST pin for Thread is set to $RST_PIN_T${NC}"

if [ $3 ]; then
  BSL_PIN_T=$3
fi
echo -e "${CYAN}BSL pin for Thread is set to $BSL_PIN_T${NC}"
if [ $4 ]; then
  PORT_Z=$4
fi
echo -e "${CYAN}Flash port for Zigbee is set to $PORT_Z${NC}"

if [ $5 ]; then
  RST_PIN_Z=$5
fi
echo -e "${CYAN}RST pin for Zigbee is set to $RST_PIN_Z${NC}"

if [ $6 ]; then
  BSL_PIN_Z=$6
fi
echo -e "${CYAN}BSL pin for Zigbee is set to $BSL_PIN_Z${NC}"

echo
echo -e "${CYAN}Clean old filer and directorie${NC}"
sudo rm -rf cc2538-bsl && sudo rm -rf firmware && sudo rm -rf env && sudo rm -rf firmware_*.patch
echo
echo -e "${CYAN}Installing dependencies${NC}"
sudo apt install -y git gpiod unzip python3 python3-pip python3.9-venv
echo
echo -e "${CYAN}Activate Python Enviroment${NC}"
python3 -m venv env
source env/bin/activate
pip3 install pyserial intelhex
echo
echo -e "${CYAN}Cloning flash tool and firmwares${NC}"
git clone https://github.com/JelmerT/cc2538-bsl.git
git clone https://github.com/hoobs-org/firmware.git

echo
echo -e "${CYAN}Unpacking latest hex file${NC}"
archive_t=$(ls -1 firmware/ti/otbr/cc2652p2/RCP*.zip | sort -r | head -1)
archive_z=$(ls -1 firmware/ti/coordinator/cc2652p2/CC1352P2_CC2652P_launchpad_coordinator*.zip | sort -r | head -1)
unzip -o $archive_t -d .
unzip -o $archive_z -d .
hexfile_t=$(ls -1 RCP*.hex | head -1)
hexfile_z=$(ls -1 CC1352P2_CC2652P_launchpad_coordinator*.hex | head -1)
echo $hexfile_t
echo $hexfile_z

echo -e "${CYAN}Enable BSL mode and restart Thread${NC}"
gpioset $(gpiofind PIN_$BSL_PIN_T)=0
gpioset $(gpiofind PIN_$RST_PIN_T)=0
sleep 1
gpioset $(gpiofind PIN_$RST_PIN_T)=1

echo
sudo echo -e "${CYAN}Wait 4 seconds before start${NC}"
sleep 4

echo
sudo echo -e "${CYAN}Disable BSL mode Thread${NC}"
gpioset $(gpiofind PIN_$BSL_PIN_T)=1

echo
echo -e "${CYAN}Flashing Thread${NC}"
python3 cc2538-bsl/cc2538-bsl.py -p $PORT_T -ewv $hexfile_t

echo
echo -e "${CYAN}Restart Zigbee${NC}"
gpioset $(gpiofind PIN_$RST_PIN_T)=0
gpioset $(gpiofind PIN_$RST_PIN_T)=1
echo
echo -e "${CYAN}Enable BSL mode and restart Zigbee${NC}"
gpioset $(gpiofind PIN_$BSL_PIN_Z)=0
gpioset $(gpiofind PIN_$RST_PIN_Z)=0
sleep 1
gpioset $(gpiofind PIN_$RST_PIN_Z)=1

echo
sudo echo -e "${CYAN}Wait 4 seconds before start${NC}"
sleep 4

echo
sudo echo -e "${CYAN}Disable BSL mode Zigbee${NC}"
gpioset $(gpiofind PIN_$BSL_PIN_Z)=1

echo
echo -e "${CYAN}Flashing Zigbee${NC}"
python3 cc2538-bsl/cc2538-bsl.py -p $PORT_Z -ewv $hexfile_z

echo
echo -e "${CYAN}Restart Zigbee${NC}"
gpioset $(gpiofind PIN_$RST_PIN_Z)=0
gpioset $(gpiofind PIN_$RST_PIN_Z)=1
echo
echo -e "${CYAN}Deactivate Python Enviroment${NC}"
deactivate
echo
echo -e "${RED}Deleting all files${NC}"
sudo rm -rf cc2538-bsl && sudo rm -rf firmware && sudo rm -rf env && sudo rm -rf firmware_*.patch
rm $hexfile_t $hexfile_z
rm -- "$0"
echo
echo -e "${GREEN}Flashing complete${NC}"
