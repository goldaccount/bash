#!/bin/bash
#echo Auto click every ${1}s

fx_clicktor() {
	xdotool click --window ${id} 2
	while true
	do
		xdotool mousemove_relative 0 45 click 2
		sleep 2
	done
}

fx_clickimage() {
	while true
	do
		xdotool click --window ${id} 2			#Middle click
		xdotool key --window ${id} --repeat 2 Ctrl+0xff56	#Ctrl Pgdown
		sleep 2
	done
}

fx_clickmagnet() {
	i=1
	for i in {0..5..1}
	do
		xdotool click --window ${id} 1			#Left click title
		sleep 1
		echo clicking ${id}
		bspc node -f east
		xdotool key Ctrl+Shift+V P
		echo paste to terminal
		sleep 1
		xdotool key --window ${id} --repeat 1 Ctrl+0xff56	#Ctrl Pgdown
		echo next tab
		sleep 2
	done
}

fx_select() {
	echo "Select mode\n1=clicktor\n2=clickimage\n3=clickmagnet"
	read mode
	case $mode in
		1)
			fx_clicktor
			;;
		2)
			fx_clickimage
			;;
		3)
			fx_clickmagnet
			;;
		*)
			fx_select
			;;
	esac
}

id=$(xdotool getactivewindow selectwindow)
fx_select
#fx_clickimage
#fx_clickmagnet
