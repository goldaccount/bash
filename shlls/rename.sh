#!/bin/zsh
for x in */*.mkv
do
	base=$(echo $x | sed -e 's/\/.*//g' )
#	echo $base
	y=$(echo $x | sed -e 's/.*\///g' | sed -e 's/\.mkv//g')
#	echo $y
	sub=$(echo $base/*.srt)
#	echo $sub
	if [[ -n $sub ]] then
#		echo $sub #2>/dev/null
		cp $sub $base/$y.srt
	else
		continue
	fi
done
