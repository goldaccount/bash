#!/bin/bash
for y in $(ls -1dv drm_*) 
do

echo "<html>
<body>" > $y.html
index=""
pre="<img src=\""
suff="\"></img>"
for x in $(ls -v $y/*.jpg)
do
	#echo $x
	index=$x
	echo $pre$index$suff"</br>" >> $y.html
done
echo "</body>
</html>" >> $y.html
done
echo "Finished generating individual indexes
Generating master index all.html
"
echo "<html>
<body>" > all.html
for y in $(ls -1dv drm_*.html) 
do
	index=""
	pre="<a href=\""
	suff="</a>"
	index=$y"\">"${y/"drm"/"Doremon"}
	echo $pre$index$suff"</br>" >> all.html
done
echo "</body>
</html>" >> all.html
echo "Finished master index all.html"
