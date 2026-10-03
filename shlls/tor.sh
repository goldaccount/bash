#!/bin/zsh

echo "Usage: ./tor.sh <host> <torpath> <inputpath> <u:p>"
while IFS= read -r magnet; do transmission-remote $1 -n $4:$4 -a "$magnet" -w /mnt/z5m1/tor/${2} ; done < /tmp/${3}
