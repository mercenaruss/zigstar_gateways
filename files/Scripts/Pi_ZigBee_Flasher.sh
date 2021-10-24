#!/bin/bash

PORT=/dev/ttyAMA0

if [ $1 ]; then
  PORT=$1
fi
echo Flash port set to $PORT

RST_PIN=19
if [ $2 ]; then
  RST_PIN=$2
fi
echo RST pin set to $RST_PIN

BSL_PIN=26
if [ $3 ]; then
  BSL_PIN=$3
fi
echo BSL pin set to $BSL_PIN


echo
echo Installing dependencies
apt install -y git unzip python3 python3-pip
pip3 install pyserial intelhex


echo
echo Cloning flash tool and firmware
git clone https://github.com/JelmerT/cc2538-bsl.git
git clone https://github.com/jethome-ru/zigbee-firmware.git

echo
echo Unpacking latest hex file
archive=$(ls -1 zigbee-firmware/ti/coordinator/cc2652/*.zip | sort -r | head -1)
unzip -o $archive -d .
hexfile=$(ls -1 *.hex | head -1)
echo $hexfile


if [ ! -e /sys/class/gpio/gpio$BSL_PIN ]; then
    echo $BSL_PIN > /sys/class/gpio/export
fi

echo out > /sys/class/gpio/gpio$BSL_PIN/direction


if [ ! -e /sys/class/gpio/gpio$RST_PIN ]; then
    echo $RST_PIN > /sys/class/gpio/export
fi

echo out > /sys/class/gpio/gpio$RST_PIN/direction

echo
echo Enable BSL and restart Zigbee
echo 0 > /sys/class/gpio/gpio$BSL_PIN/value
echo 0 > /sys/class/gpio/gpio$RST_PIN/value
echo 1 > /sys/class/gpio/gpio$RST_PIN/value

echo
echo Wait 8 seconds before start
sleep 8

echo
echo Disable BSL
echo 1 > /sys/class/gpio/gpio$BSL_PIN/value

echo
echo Flashing
python3 cc2538-bsl/cc2538-bsl.py -p $PORT -ewv $hexfile

echo
echo Restart Zigbee
echo 0 > /sys/class/gpio/gpio$RST_PIN/value
echo 1 > /sys/class/gpio/gpio$RST_PIN/value

