#!/bin/sh
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
