#!/bin/bash
#echo Auto click every ${1}s

id=""
id2=""


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
	while true
	do
		echo clicking ${id}
		xdotool mousemove 520 175 click --window ${id} 1			#Left click title
		sleep 1
		echo focus ${id2}
		bspc node -f ${id2}
		echo paste to ${id2} 
#Old style
#		xdotool key --window ${id2} Ctrl+Shift+V P 0xff8d
#		xdotool key --window ${id2} 0xff8d
#New Esc then O and paste
		xdotool key --window ${id2} 0xff1b o Ctrl+Shift+V
		sleep 0.5
#Insert 2 newlines
		xdotool key --window ${id2} 0xff1b o 0xff1b
		sleep 0.5
		echo next tab
		xdotool key --window ${id} --repeat 1 Ctrl+0xff56	#Ctrl Pgdown
		sleep 1
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
#			id2=$(xdotool getactivewindow selectwindow)
			id2=$(xdotool search --all --name "clicknyaa")
			sleep 3
			fx_clickmagnet
			;;
		*)
			fx_select
			;;
	esac
}

#id=$(xdotool getactivewindow selectwindow)
id=$(xdotool search --all --limit 1 --name "Sukebei.*")
id2=$(xdotool search --all --limit 1 --name "tormg" )
echo $id $id2
sleep 5
fx_clickmagnet
#fx_select

#fx_clickimage
#fx_clickmagnet
