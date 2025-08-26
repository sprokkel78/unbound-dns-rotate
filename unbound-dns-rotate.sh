#!/bin/sh

# ROTATE BETWEEN DNS SERVERS
MIN=$(date +%M)

if [ $MIN -gt 0 -a $MIN -lt 15 ]; then
    cp /etc/unbound/unbound.conf1 /etc/unbound/unbound.conf
    systemctl restart unbound
elif [ $MIN -gt 15 -a $MIN -lt 30 ]; then
    cp /etc/unbound/unbound.conf2 /etc/unbound/unbound.conf
    systemctl restart unbound
elif [ $MIN -gt 30 -a $MIN -lt 45 ]; then
    cp /etc/unbound/unbound.conf3 /etc/unbound/unbound.conf
    systemctl restart unbound
else
    cp /etc/unbound/unbound.conf4 /etc/unbound/unbound.conf
    systemctl restart unbound
fi

# ADD ROOT-SERVER DNS BLOCK RULE
IPT=$(iptables -C OUTPUT -p tcp --dport 53 -j DROP 2>&1 >/dev/null)
#echo $IPT
if [ "$IPT" == "" ]; then
	echo -e "root-server block rule is present"
else
	echo "adding root-server block rule"
	iptables -I OUTPUT -p tcp --dport 53 -j DROP
fi
