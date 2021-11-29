#!/bin/bash
for x in */*.zip
do y=$(echo $x | sed -e 's/\/.*//g')

	echo $y
	unzip -qq $x -d $y
done

