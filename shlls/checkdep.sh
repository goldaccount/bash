#!/bin/zsh
input=$1
for x in $(<$input)
do
	apt search $x 2>/dev/null | grep installed
	echo $x
	sudo apt-get install --assume-no $x | grep space
done
