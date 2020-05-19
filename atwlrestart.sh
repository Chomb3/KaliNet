#!/bin/bash
#
# Restarting Internet Services
# Default Card = wlan0

card=wlan0

ip link dev $card down
iw dev wlan0 set type auto
ip link dev wlan0 up

service network-manager start
