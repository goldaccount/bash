#!/bin/bash
echo Auto click every ${1}s
while true
do
	xdotool click 1
	sleep $1
done
