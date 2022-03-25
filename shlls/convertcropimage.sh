#!/bin/zsh
for x in *.png
do
	convert $x -gravity Center -crop x1080+0+0 +repage ${x/png/jpg}
	#rm $x
done
