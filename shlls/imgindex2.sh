#!/bin/bash
for y in $(ls -1dv */)
do
	touch $y/.nomedia
echo "<html>
<body>" > $y/001.html
index=""
pre="<img src=\""
suff="\" width=100%></img>"
for x in $(ls -v $y*.jpg)
do
	index=${x/*\//}
#	echo $index
	echo $pre$index$suff"</br>" >> $y/001.html
done
echo "</body>
</html>" >> $y/001.html
done
echo "Finished generating individual indexes."
