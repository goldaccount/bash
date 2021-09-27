#!/bin/bash
for x in $(ls *.m4a)
do
	y=$(getmeta $x $1)
#	echo $x	$(/home/rnx/b.sh "$(getmeta $x $1)")
	echo $y
done
