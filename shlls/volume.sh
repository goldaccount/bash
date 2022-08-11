#!/bin/zsh

vol=$2

fx_selectvol() {
	private volname
	private volid
	case $1 in
	front|f)
		volname="Front Playback Volume"
		;;
	surr|s|surround)
		volname="Surround Playback Volume"
		;;
	cen|c|center)
		volname="Center Playback Volume"
		;;
	lfe|LFE)
		volname="LFE Playback Volume"
		;;
	hp|head|headphone)
		volname="Headphone Playback Volume"
		;;
	mas|m|master)
		volname="Master Playback Volume"
		;;
	*)
		volname="Master Playback Volume"
		;;
	esac
	volid=$(amixer -c 1 controls | grep "${volname}" | sed -E 's/,iface.*//' | sed -E 's/numid=//')
	echo $volid
	unset volname
	unset volid
}

fx_getvol() {
	amixer -c 1 cget numid=$(fx_selectvol $1)
currentvalue=$(amixer -c 1 cget numid=$1 | grep ': values' | sed -E    's/^.*=//' | sed -E 's/,.*$//')
newvalue=`expr ${currentvalue} + 5`
vol m 
}

fx_setvol() {
	if [[ -z $2 ]]; then
		amixer -c 1 cset numid=$(fx_selectvol $1) 0
	#	amixer -c 1 cset numid=`expr $(fx_selectvol $1) + 1` 0
#	else
#	if [[ $2 == '+' ]]; then
#		`expr $(fx_getvol $(fx_selectvol $1)) + 5`
	else
		amixer -c 1 cset numid=$(fx_selectvol $1) $2
	#	amixer -c 1 cset numid=`expr $(fx_selectvol $1) + 1` 1
	fi
}

fx_setvol $1 $2


#Temp residual commands
#volid=$(amixer -c 1 controls | grep "Front Playback Volume" | sed -E 's/,iface.*//' | sed -E 's/numid=//')
#vol=$( expr $(amixer -c 1 cget numid=33 | grep ': values' | sed -E 's/.*=//') + 2 )
