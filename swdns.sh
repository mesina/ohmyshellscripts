#!/bin/bash


opendns(){

	echo "Switching to opendns and dnscrypt dsn conf..."	
	chattr -i /etc/resolv.conf
	echo "nameserver 127.0.0.1"$'\n'"nameserver 127.0.0.2" > /etc/resolv.conf
	chattr +i /etc/resolv.conf	
	systemctl restart pdnsd
	systemctl restart dnscrypt-proxy
	systemctl restart NetworkManager
}


local(){

        echo "Switching to local dns conf..."
	chattr -i /etc/resolv.conf
        systemctl stop pdnsd
        systemctl stop dnscrypt-proxy
        systemctl restart NetworkManager 
}


if [ "$1" = "opendns" ]
then 
  opendns
elif [ "$1" = "local" ]
then
  local
fi
