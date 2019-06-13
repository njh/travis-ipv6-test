#!/bin/bash

if [ "$CJDNS" == "True" ]; then
	if [ $1 == "start" ]; then
		cd cjdnsTest/
		sudo sysctl net.ipv6.conf.all.disable_ipv6=0
		echo "Starting cjdns"
		./cjdroute --genconf | sudo nohup ./cjdroute --nobg &
		sleep 30
		cd ..
	elif [ $1 == "end" ]; then
		sudo sysctl -a
		sudo pkill cjdroute
		sleep 5
		sudo cat cjdnsTest/nohup.out
	fi
fi
