#!/bin/bash
#
# Pre-settings for enable monitor monde and new mac addres using external wifi card
# Vesion 1.0
# Everkadaver

card=$(iw dev | grep -w Interface | awk '{print $2}')
oldmac=$(iw dev | grep -w addr | awk '{print $2}')

ip link set $card down
macchanger -r $card >/dev/null
airmon-ng check kill >/dev/null
iw dev $card set type monitor
ip link set $card up

mac=$(iw dev | grep -w addr | awk '{ print $2}')
mon=$(iw dev | grep -w type | awk '{print $2}')
flag=0

if [[ $mon = 'monitor' ]]; then

	echo "Monitor Mode = Check!"
	flag=$flag+1

else

	echo "Monitor Mode = Failed =("

fi

if [[ $mac != $oldmac ]]; then

	echo "New MAC = Check!"
	flag=$flag+1

else

	echo "New MAC = Failed =("

fi

if [[ $flag -eq 2 ]]; then

	echo "Ok Polilla!"

else

	echo "Settings need to be checked"

fi
