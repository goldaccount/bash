#!/bin/zsh
# $1 = vol value

volname="Master Playback Volume"
# Get numid of master
volid=$(amixer -c 1 controls | grep "${volname}" | sed -E 's/,iface.*//' | sed -E     's/numid=//')

#Get current vol of master
currentvalue=$(amixer -c 1 cget numid=${volid} | grep ': values' | sed -E 's/^.*=//' | sed -E 's/,.*$//')
newvalue=`expr ${currentvalue} - 5`
vol m $newvalue
