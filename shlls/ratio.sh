#!/bin/zsh
#find * -type d -exec ratio.sh '{}' /tmp/ratio.csv \;
#use imagemagick to get image dimension, then output ratio (width/height)
	echo -n ". . size ratio\n. . 21:9 2.333\n. . 16:10 1.6\n. . 16:9 1.78\n. . 3:2 1.5\n. . 4:3 1.33\n. . 9:21 0.429\n. . 10:16 0.625\n. . 9:16 0.5625\n. . 2:3 0.67\n. . 3:4 0.75\n. . . . \nname ratio\n" >> $2

#Strip any trailing slashes
a=`echo $1 | sed 's/\/*$//'`
	for x in ${a}/*.jpg ${a}/*.png
	do
		ratio=`identify $x | cut -d' ' -f 3`
		width=`echo $ratio | cut -d'x' -f1`
		height=`echo $ratio | cut -d'x' -f2`
		#echo $width $height
		echo $x `python -c "print($width/$height)"` >> $2
	done
