#!/bin/sh

if ! grep -q nethost /etc/hosts; then
	#ip=$(ifconfig |awk '/inet / {print substr($2, 6)}'|grep -v '127.0.0.1'|head -n1)
	ip=$(grep `hostname` /etc/hosts|awk '{print $1}')
	echo $ip nethost >> /etc/hosts
fi

exec "$@"
