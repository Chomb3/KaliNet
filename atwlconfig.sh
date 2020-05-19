#/bin/bash
#
# Presettings for enable monitor monde and new mac addres using external wifi card
# Default new mac=00:11:22:33:44:55 / Default interface name=wlan0
# Vesion 1.0
# Everkadaver

newmac=00:11:22:33:44:55
card=wlan0

ip link set $card down
ifconfig $card hw ether $newmac
airmon-ng check kill >/dev/null
iw dev $card set type monitor
ip link set $card up

ip=$(iw dev | grep -w addr | awk '{ print $2}' )
mon=$(iw dev | grep -w type | awk '{print $2}')
flag=0

if [[ $mon = 'monitor' ]]; then

	echo "Monitor Mode = Check!"
	flag=$flag+1

else

	echo "Monitor Mode = Failed =("

fi

if [[ $ip = $newmac ]]; then

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
