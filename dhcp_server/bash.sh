#!/bin/bash

# Initialize the lease file if it doesn't exist.
#touch /data/dhcpd/dhcpd.leases

# Start devpi-server.
#dhcpd -cf /data/dhcpd/dhcpd.conf -lf /data/dhcpd/dhcpd.leases --no-pid -4 -f

/etc/init.d/isc-dhcp-server start
tail -f /dev/null

chmod 660 /etc/bind/rndc.conf
chown root:bind /etc/bind/rndc.conf
cd /etc/dhcp
ln -s /etc/bind/rndc.conf

