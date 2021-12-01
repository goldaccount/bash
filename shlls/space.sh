#!/bin/bash

x=("$1" "$2" "$3")
#x[0]=$1
#x[1]=$2
#x[2]=$3

fx_test1() {
i=0
while [[ $i -lt 3 ]]
do
#	echo ${x[$i]}
	if [[ "${x[$i]}" != *-converted.mkv ]]; then
		echo
	fi
	((i++))
done
}

fx_check() {
if [[ ! -a $1 ]]; then
	echo Not found
	exit
fi
}

#Redefine the fucking space 
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
fx_check $1
