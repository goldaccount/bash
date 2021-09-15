#!/bin/bash
for x in $(ls *.m4a)
do
	echo $x	$(getmeta.sh $x $1)
done
