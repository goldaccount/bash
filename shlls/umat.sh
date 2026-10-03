#!/bin/zsh

#vars
id=""
x=""
y=""
w=""
h=""
s=""
readonly _X="1230"
readonly _Y="670"
readonly _W="1280"
readonly _H="720"


#randomize sleep seed
fx_rnd() {
	sleep $(($RANDOM%7))
#	sleep 5
}

#not need
fx_getwinid() {
	id=$(xdotool search --all --classname --name 'steam_app_3224770|Umamusume' getwindowgeometry --shell)
}

fx_checkwin() {
	xdotool search --all --classname --name 'steam_app_3224770|Umamusume' getwindowgeometry --shell | {
#	xdotool getwindowgeometry --shell $id | {
	while read -r line; do
		case "$line" in
			WINDOW=*)
				id=${line#WINDOW=}	;;
			X=*)
				x=${line#X=}		;;
			Y=*)
				y=${line#Y=}		;;
			WIDTH=*)
				w=${line#WIDTH=}	;;
			HEIGHT=*)
				h=${line#HEIGHT=}	;;
			SCREEN=*)
				s=${line#SCREEN=}	;;
		esac
	done
	}
}

fx_setwin() {
	echo "Check window position & size: ${_X},${_Y} ${_W}x${_H}"
	if [[ x -ne ${_X} || y -ne ${_Y} ]]; then
		echo "${x},${y} ${w}x${h} position problem, fixing ..."
		xdotool windowmove ${id} ${_X} ${_Y}
	fi
	if [[ x -eq ${_X} && y -eq ${_Y} && w -ne ${_W} || h -ne ${_H} ]]; then
		echo "${x},${y} ${w}x${h} size problem, fixing ..."
		bspc node ${id} -z bottom_right $(expr ${_W} - ${w}) $(expr ${_H} - ${h}) 
	else
		echo "${x},${y} ${w}x${h} position and size ok"
	fi
}

#career start
fx_click01() {
echo move mouse to career button
	xdotool mousemove 1650 1270
	xdotool click 1
echo Wait load
	sleep 6;
	xdotool click 1
		echo career next
#next 7 lines for event padding only, remove if no event
#	xdotool mousemove 1600 1270
#	xdotool click 1
#	sleep 1.5
#echo confirm
#	xdotool mousemove 1650 1320 click 1
#	xdotool click 1
echo move back to next
	fx_rnd
	xdotool mousemove 1600 1270 click 1
	xdotool click 1

#	xdotool click 1
		echo choose uma
	fx_rnd
	xdotool mousemove 1600 1270 click 1
#	xdotool click 1
		echo parent	
	fx_rnd
	xdotool mousemove 1600 1270
	xdotool click 1
	fx_rnd
		echo card
echo choose card
	xdotool mousemove 1700 1050;
	xdotool click 1
	fx_rnd
echo refresh  pick card
	xdotool mousemove 1770 1235;
	sleep 5
	xdotool click 1
	fx_rnd
echo choose 1
	xdotool mousemove 1760 835;
#choose 2
#	xdotool mousemove 1760 935;
#choose 3
#	xdotool mousemove 1760 1035;
	fx_rnd
	xdotool click 1
	fx_rnd
echo card close
#	xdotool mousemove 1650 1320;
	echo start career
	xdotool mousemove 1650 1270;
	fx_rnd
	xdotool click 1
	echo indie
	fx_rnd
	xdotool mousemove 1660 790 click 1
	fx_rnd
	echo schedule
	xdotool mousemove 1745 1010 click 1
	fx_rnd
	echo my schedule
	xdotool mousemove 1750 1285
	fx_rnd
	xdotool click 1
	fx_rnd
#	echo load schedule 1
#	xdotool mousemove 1750 995
	echo load schedule 2
	xdotool mousemove 1705 1120
	fx_rnd
	xdotool click 1
	fx_rnd
#	echo close goal dialog
# close goal dialog box if not MANT
#	xdotool click 3
	echo close schedule
	xdotool click 3
	fx_rnd
	echo start 
	xdotool mousemove 1640 1320
	xdotool click 1
	xdotool click 1
}

#from home click finish career
fx_click02() {
	echo close overview
	xdotool mousemove 1650 1320 click 1;
	fx_rnd
	echo career
	xdotool mousemove 1650 1270 click 1;
	fx_rnd
	echo choose career
	xdotool mousemove 1650 1180 click 1;
	sleep 5
	echo ok
	xdotool mousemove 1650 1330 click 1;
#spark
	echo spark confirm	
	xdotool mousemove 1650 1250 click 1;
	echo spark confirm	
	xdotool mousemove 1650 1250 click 1;

#sleep for spark
	echo sleep spark
	sleep 5

	echo next
	fx_rnd
	xdotool mousemove 1650 1250 click 1;
	echo rewards next
	fx_rnd
	xdotool mousemove 1650 1250 click 1;
	echo rewards next
	fx_rnd
	xdotool mousemove 1650 1250 click 1;
	
	echo next event
	xdotool mousemove 1650 1330 click 1;

	echo next noevent
	xdotool mousemove 1650 1330 click 1;


	xdotool mousemove 1650 1320 click 1;
	xdotool mousemove 1650 1320 click 1;
	echo home	
	xdotool click 3;
	xdotool click 3;
	
}

fx_click03() {
	echo overview move mouse to OK
	fx_rnd
	xdotool mousemove 1650 1320
	xdotool click 1
	echo move mouse to complete career
	sleep 3
	xdotool mousemove 1650 1250
	fx_rnd
	xdotool click 1
	echo move mouse to finish career
	sleep 3
	xdotool mousemove 1650 1170
	fx_rnd
	xdotool click 1
	echo move mouse to next rank 
	sleep 3
	xdotool mousemove 1650 1320
	fx_rnd
	xdotool click 1
	echo click confirm spark x2
	sleep 3
	xdotool mousemove 1650 1320
	xdotool click 1
	sleep 1
	xdotool mousemove 1650 1320
	xdotool click 1
	echo delay after spark, click Close
	sleep 5
	xdotool mousemove 1650 1320
	xdotool click 3
	xdotool click 1
	echo delay after final, click Next
	sleep 3
	xdotool mousemove 1650 1320
	xdotool click 1
	xdotool click 1
	echo delay bond fans
	sleep 7
	xdotool mousemove 1650 1320
	xdotool click 1
	sleep 2
	xdotool click 1
	echo delay support points
	sleep 5
	xdotool mousemove 1650 1320
	xdotool click 1
	sleep 3
	xdotool click 1
#Events
	echo event click next
	sleep 3
	xdotool mousemove 1650 1320
	xdotool click 1
#Events 2
	echo event click next
	sleep 3
	xdotool mousemove 1650 1320
	xdotool click 1
	sleep 1
	xdotool click 3
	sleep 3
	xdotool click 1
#No event
	echo back to home x2
	xdotool click 3
	sleep 1
	xdotool click 3
	echo finish round
}

#career finish
fx_click04() {
	echo overview move mouse to OK
	fx_rnd
	xdotool mousemove 1650 1320
	xdotool click 1
	echo move mouse to complete career
	sleep 3
	xdotool mousemove 1650 1250
	fx_rnd
	xdotool click 1
	echo move mouse to finish career
	sleep 3
	xdotool mousemove 1650 1170
	fx_rnd
	xdotool click 1
	echo move mouse to next rank 
	sleep 3
	xdotool mousemove 1650 1320
	fx_rnd
	xdotool click 1
	echo click confirm spark x2
	sleep 3
	xdotool mousemove 1650 1320
	xdotool click 1
	fx_rnd
	xdotool mousemove 1650 1320
	xdotool click 1
	echo delay after spark, click Close
	sleep 5
	xdotool mousemove 1650 1320
	xdotool click 3
	fx_rnd
	xdotool click 1
	echo delay after final, click Next
	sleep 3
	xdotool mousemove 1650 1320
	xdotool click 1
	echo delay bond fans
	sleep 7
	xdotool mousemove 1650 1320
	xdotool click 1
	echo delay support points
	sleep 5
	xdotool mousemove 1650 1320
	xdotool click 1
	fx_event01
	fx_event02
echo Career complete Tazuna dialog
echo Back to home
	xdotool click 3
}

fx_event01() {
#long event
echo rewards items
	fx_rnd
	xdotool mousemove 1650 1320
	xdotool click 1
#echo rewards points
	fx_rnd
	xdotool mousemove 1650 1320
	xdotool click 1
	fx_rnd
	xdotool click 1
#echo spins	
#	fx_rnd
#	xdotool mousemove 1650 1320
#	xdotool click 1
echo back to rewards points
	sleep 1	
	xdotool click 1
}

fx_event02() {
#trainer aptitude
echo event points
	fx_rnd
	xdotool mousemove 1650 1320
	xdotool click 1
echo after tazuna dialog tests returns to event home
	fx_rnd
	xdotool click 3
}

fx_clicktt() {
	echo race
	xdotool mousemove 1700 1350
	fx_rnd
	xdotool click 1
	echo TT
	fx_rnd
	xdotool mousemove 1550 1150 click 1
	echo edit team
	fx_rnd
	xdotool mousemove 1650 1200
	xdotool click 1
echo stay @ TT team
}
	
fx_exit() {
echo to home
	xdotool click 3
	sleep 0.5
	xdotool click 3
	sleep 0.7
	xdotool click 3
}

fx_closetrain() {
echo close training mode
	xdotool mousemove 1820 1350 click 1
	fx_rnd
	xdotool mousemove 1550 970
	fx_rnd
	xdotool click 1
echo back to home screen
}

fx_main() {
	fx_checkwin
	fx_setwin
	sleep 2
while true
do
	fx_click01
	echo sleep 50 mins
	sleep 3020
	fx_click04
	sleep 8
done
}

#sleep 3020
#fx_click04
#sleep 4
fx_main
#fx_checkwin
#fx_setwin
