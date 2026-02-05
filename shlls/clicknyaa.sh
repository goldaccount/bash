#!/bin/bash
echo Auto click every ${1}s
id=$(xdotool getactivewindow selectwindow)
while true
do
	xdotool click --window ${id} 2			#Middle click
	xdotool key --window ${id} --repeat 2 Ctrl+0xff56	#Ctrl Pgdown
	sleep $1
done
