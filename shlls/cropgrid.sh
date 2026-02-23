#!/bin/zsh
echo "Syntax: ./crop.sh <image path> <col> <row> <prefix>\nOutput to <prefix>_<col>_<row>.png "
image="$1"
cols=$2
rows=$3
prefix=$4
offset=0
#Get image size, divide to cells
maxw=$(identify $image | cut -d" " -f3 | cut -dx -f1)
maxh=$(identify $image | cut -d" " -f3 | cut -dx -f2)
cellw=$(( $maxw / $cols ))
cellh=$(( $maxh / $rows ))
for row in {0..${rows}..1}; do
	for col in {0..${cols}..1}; do
	echo "cell="$row"_"$col
	x=$(( ${col} * (${cellw}+${offset}) ))
	y=$(( ${row} * (${cellh}+${offset}) ))
	out=${prefix}"_"${col}"_"${row}".png"
	convert $image -crop ${cellw}x${cellh}+$x+$y $out
	done
done
