#!/bin/bash

RST_PIN=24

curl -s https://raw.githubusercontent.com/mercenaruss/zigstar_gateways/main/files/Scripts/banner.txt > logo.txt && cat logo.txt && rm logo.txt

echo "Running Pi_Flasher_JTAG script"
sleep 1

if [ $1 ]; then
  RST_PIN=$1
fi
echo "RST pin set to $RST_PIN"

echo
echo "Installing dependencies"
apt install -y git unzip openocd pigpio

echo
echo "Cloning flash tool and firmware"
rm -rf zigbee-firmware
#curl https://raw.githubusercontent.com/mercenaruss/zigstar-docs/main/openocd.cfg?token=ABKAYIRBSVXXLAUAKMG2IVLBQPMBC --output /usr/share/openocd/scripts/board/zigihat.cfg
git clone https://github.com/jethome-ru/zigbee-firmware.git

echo
echo "Unpacking latest hex file"
archive=$(ls -1 zigbee-firmware/ti/coordinator/cc2652/*.zip | sort -r | head -1)
unzip -o $archive -d .
hexfile=$(ls -1 *.hex | head -1)
echo $hexfile

sleep 2

echo
echo "Flashing"
#openocd -f interface/raspberrypi2-native.cfg -f target/ti_cc26x2.cfg -c "transport select jtag" -c "adapter speed 1000"  -c "program $hexfile verify reset exit"
#openocd -f usr/share/openocd/scripts/board/zigihat.cfg
sudo openocd -f board/zigihat.cfg

sleep 2

echo
echo "Restart ZigBee"
echo 0 > /sys/class/gpio/gpio$RST_PIN/value
echo 1 > /sys/class/gpio/gpio$RST_PIN/value

echo
echo "Deleting all files"
rm -rf zigbee-firmware
#rm $hexfile
#rm -- "$0"