#!/bin/bash
#ufw allow bind9
/etc/init.d/bind9 start
tail -f /dev/null
ufw allow Bind9

chmod 660 /etc/bind/rndc.conf
chown root:bind /etc/bind/rndc.conf
cd /etc/dhcp
ln -s /etc/bind/rndc.conf

#chmod 660 /etc/bind/rndc.conf
#chown root:bind /etc/bind/rndc.conf
#cd /etc/dhcp
#ln -s /etc/bind/rndc.conf