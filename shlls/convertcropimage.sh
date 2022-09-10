#!/bin/zsh
#for x in *.png
#do
	convert $1 -gravity Center -crop x1080+0+0 +repage ${1/png/_1.png}
	rm $1
#done
