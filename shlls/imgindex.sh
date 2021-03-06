#!/bin/bash
for y in $(ls -1dv */)
do
	echo $y
	echo "<html>
<body>" > $y/001.html
	index=""
	pre="<img src=\"" #/home/rnx/Videos/"
	suff="\" width=85%></img>"
for x in $(ls -v $y*.jpg)
do
	#echo "$x"
	index=$(echo $x | sed -E 's/.*\///g')
	echo $pre$index$suff"</br>" >> $y/001.html
done
echo "</body>
</html>" >> $y/001.html
done
echo "Finished generating individual indexes.
#Generating master index.html..."
echo "<html>
<body>" > index.html
for y in $(ls -R */001.html) 
do
	index=""
	pre="<a href=\""
	suff="</a>"
	y1=$(echo $y | sed -E 's/\/001\.html//g' | sed -E 's/'_'/ /g')
	index=$y\"">"$y1
	echo $pre$index$suff"</br>" >> index.html
done
echo "</body>
</html>" >> index.html
echo "Finished master index.html"
