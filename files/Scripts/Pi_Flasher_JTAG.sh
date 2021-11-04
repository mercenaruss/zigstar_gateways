#!/bin/bash

PORT=/dev/ttyAMA0
RST_PIN=24
BSL_PIN=27

curl -s https://raw.githubusercontent.com/mercenaruss/zigstar_gateways/main/files/Scripts/banner.txt > logo.txt && cat logo.txt && rm logo.txt


echo "Running Pi_Flasher_CC2538 script"
sleep 3
if [ $1 ]; then
  PORT=$1
fi
echo "Flash port set to $PORT"

if [ $2 ]; then
  RST_PIN=$2
fi
echo "RST pin set to $RST_PIN"

if [ $3 ]; then
  BSL_PIN=$3
fi
echo "BSL pin set to $BSL_PIN"

echo
echo "Installing dependencies"
apt install -y git unzip openocd pigpio

echo
echo "Cloning firmware and OpenOCD config"
rm -rf zigbee-firmware
git clone https://github.com/jethome-ru/zigbee-firmware.git

echo
echo "Unpacking latest hex file"
archive=$(ls -1 zigbee-firmware/ti/coordinator/cc2652/*.zip | sort -r | head -1)
unzip -o $archive -d .
hexfile=$(ls -1 *.hex | head -1)
echo $hexfile

echo
echo "Enable BSL and RST pins"
if [ ! -e /sys/class/gpio/gpio$BSL_PIN ]; then
    echo $BSL_PIN > /sys/class/gpio/export
fi
echo out > /sys/class/gpio/gpio$BSL_PIN/direction

if [ ! -e /sys/class/gpio/gpio$RST_PIN ]; then
    echo $RST_PIN > /sys/class/gpio/export
fi
echo out > /sys/class/gpio/gpio$RST_PIN/direction

echo
echo "Wait 4 seconds before start"
sleep 4

echo
echo "Flashing"
openocd -f interface/raspberrypi2-native.cfg -f target/ti_cc26x2.cfg -c "transport select jtag" -c "adapter speed 1000"  -c "program $hexfile verify reset exit"
#sudo openocd -f board/zigihat.cfg

sleep 2

echo
echo "Restart ZigBee"
echo 0 > /sys/class/gpio/gpio$RST_PIN/value
echo 1 > /sys/class/gpio/gpio$RST_PIN/value

echo
echo "Deleting all files"
rm -rf zigbee-firmware
rm $hexfile
rm -- "$0"