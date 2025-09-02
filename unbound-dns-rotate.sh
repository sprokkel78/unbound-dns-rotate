#!/bin/sh

# ROTATE BETWEEN DNS SERVERS
RAND=$((1 + $RANDOM % 4))

if [ $RAND -eq 1 ]; then
    cp /etc/unbound/unbound.conf1 /etc/unbound/unbound.conf
    systemctl reload unbound
elif [ $RAND -eq 2 ]; then
    cp /etc/unbound/unbound.conf2 /etc/unbound/unbound.conf
    systemctl reload unbound
elif [ $RAND -eq 3 ]; then
    cp /etc/unbound/unbound.conf3 /etc/unbound/unbound.conf
    systemctl reload unbound
else
    cp /etc/unbound/unbound.conf4 /etc/unbound/unbound.conf
    systemctl reload unbound
fi

# ADD ROOT-SERVER DNS BLOCK RULE
#IPT=$(iptables -C OUTPUT -p tcp --dport 53 -j DROP 2>&1 >/dev/null)
#echo $IPT
#if [ "$IPT" == "" ]; then
#	echo -e "root-server block rule is present"
#else
#	echo "adding root-server block rule"
#	iptables -I OUTPUT -p tcp --dport 53 -j DROP
#fi
