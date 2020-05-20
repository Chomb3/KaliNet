#!/bin/bash
#
# Restarting Internet Services
# Default Card = wlan0

card=$(iw dev | grep -w Interface | awk '{print $2}')

ip link set $card down
macchanger -p $card >/dev/null
iw dev wlan0 set type  managed
ip link set wlan0 up

service network-manager start

echo "Networking settings restarted!"
