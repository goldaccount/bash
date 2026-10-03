#!/bin/zsh

#move window to position
fx_setwin() {
#	id=$(xdotool getactivewindow selectwindow)
	xdotool selectwindow windowmove 1230 670
}

fx_click01() {
#home -> career -> 
	xdotool mousemove 1650 1270 click 1;
#wait 6s for load
	sleep 6;
#career -> select URA
	xdotool click 1;
	sleep 1;
	xdotool click 1;
	sleep 1
	xdotool click 1;
	sleep 1
#card
	xdotool mousemove 1700 1050 click 1;
#wait 5s to pick card
	sleep 5
#card close
#click start career 1
	xdotool mousemove 1650 1270;
	sleep 1
	xdotool click 1
#click start career 2
	xdotool mousemove 1665 1330;	
	sleep 1
	xdotool click 1
}

#in-career select skip
fx_click02() {
#click skip
	xdotool mousemove 1830 1350 click 1;
	sleep 2
#skip ok
	xdotool mousemove 1600 1180 click 1;
	sleep 1
	xdotool mousemove 1611 1366 click 1;
	xdotool click 1;
#skip over
}

#in-career select schedule
fx_click03() {
	xdotool mousemove 2470 1150 click 1;
	sleep 2
	xdotool mousemove 2257 1320 click 1;
	sleep 2
	xdotool mousemove 1750 1230;
	sleep 1
	xdotool click 1;
}

fx_setwin
sleep $(($RANDOM%6))
fx_click01
sleep $(($RANDOM%10))
fx_click02
sleep 7
fx_click03











