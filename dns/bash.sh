#!/bin/bash
#ufw allow bind9
/etc/init.d/bind9 start
tail -f /dev/null
#chmod 660 /etc/bind/rndc.conf
#chown root:bind /etc/bind/rndc.conf
#cd /etc/dhcp
#ln -s /etc/bind/rndc.conf