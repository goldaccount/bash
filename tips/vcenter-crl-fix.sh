#!/bin/bash
cd /etc/ssl/certs
mkdir /tmp/pems
mkdir /tmp/OLD-CRLS-CAs
mv *.pem /tmp/pems && mv *.* /tmp/OLD-CRLS-CAs
h=$(/usr/lib/vmware-vmafd/bin/vecs-cli entry list --store TRUSTED_ROOT_CRLS --text | grep Alias | cut -d : -f 2)
for hh in "echo "${h[@]}"";do echo "Y" | /usr/lib/vmware-vmafd/bin/vecs-cli entry delete --store TRUSTED_ROOT_CRLS --alias $hh;done
mv /tmp/pems/* .
for l in `ls *.pem`;do ln -s $l ${l/pem/0};done
service-control --stop vmafdd && service-control --start vmafdd