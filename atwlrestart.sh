#!/bin/bash
#
# Restarting Internet Services
# Default Card = wlan0

card=wlan0

ip link set $card down
iw dev wlan0 set type  managed
ip link set wlan0 up

service network-manager start

echo "Networking settings restarted!"
