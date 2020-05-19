#/bin/bash

ip link set wlan0 down
ifconfig wlan0 hw ether 00:11:22:33:44:55
airmon-ng check kill
iw dev wlan0 set type monitor
ip link set wlan0 up

ip=$(iw dev | grep -w addr | tr -d ':'| awk '{ print $2}' )
mon=$(iw dev | grep -w type | awk '{print $2}')
flag=0

if [[ $mon = 'monitor' ]]; then

	echo "Monitor Mode = Check!"
	flag=$flag+1

else

	echo "Monitor Mode = Failed =("

fi

if [[ $ip -eq 001122334455 ]]; then

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
