#!/bin/zsh
maxline=$(wc $1 -l | sed -E 's/ .*//')
interval=$2

fx_changewall() {
	feh --image-bg "#000" --bg-max $1
}

fx_seq() {
	local index=1;
	while true
	do
	local currenttime=$(date +%S)
	if [[ `expr $currenttime % $interval` -eq 0 ]]; then
		echo $currenttime
		fx_changewall $(sed -n ${index}p list)
#		increase index count only if it, or reset if reach max
		if [[ index -eq $maxline ]]; then; index=1; else; index=`expr $index + 1`; fi
	fi
	unset currenttime
	sleep 1;
	done
}

fx_rand() {
	while true
	do
	local currenttime=$(date +%S)
	if [[ `expr $currenttime % $interval` -eq 0 ]]; then
#		randomize index from 1 to maxline
		local index=$[ $RANDOM % $maxline + 1 ];
		fx_changewall $(sed -n ${index}p list)
		unset index
	fi
	unset currenttime
	sleep 1;
	done
}

echo start
#fx_test
#fx_loop
#fx_seq
fx_rand
