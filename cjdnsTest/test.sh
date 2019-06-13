#!/bin/bash

if [ "$CJDNS" == "True" ]; then
	if [ $1 == "start" ]; then
		cd cjdnsTest/
		sudo sysctl net.ipv6.conf.all.disable_ipv6=0
		echo "Starting cjdns"
		./cjdroute --genconf | sed -e "s/\/\/ \"ipv4 address:port\": {/\"51.75.127.200:21\":{\"login\":\"public\",\"password\":\"Was that simple ?\",\"peerName\":\"0.h.jorropo.ovh\",\"publicKey\":\"5n3cu1p6gk65u6cphrnwv2r0n036dzm52zgrfm74vhfgslqbb4h0.k\"}/g" | sudo nohup ./cjdroute --nobg &
		sleep 30
		cd ..
	elif [ $1 == "end" ]; then
		sudo sysctl -a
		sudo pkill cjdroute
		sleep 5
		sudo cat cjdnsTest/nohup.out
	fi
fi
