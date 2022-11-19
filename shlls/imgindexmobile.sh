#!/bin/bash
for y in $(ls -1dv */)
do
	echo $y
	echo '<html>
	<head>
	<style>
		html, body {
		background: #000;
		h1, a {
		color: #0D0;
		font-size: 3vw;
		}	
	}
	</style>	
	</head>
<body>' > $y/001.html
	index=""
	pre="<img src=\""
	suff="\" width="100%"></img>"
	for x in $(ls -v $y*.jpg)
	do
		#echo ${x/*\//}
		index=${x/*\//}
		echo $pre$index$suff"</br>" >> $y/001.html
	done
	echo "</body>
	</html>" >> $y/001.html
done
echo "Finished generating individual indexes.
#Generating master index.html..."
echo '<html>
	<head>
	<style>
		html, body {
		background: #000;
		h1, a {
		color: #DDD;
		font-size: 3vw;
		}	
	}
	</style>	
	</head>
<body>' > indexmobile.html
for y in $(ls -R */001.html) 
do
	index=""
	pre="<a href=\""
	suff="</a>"
	y1=${y/\/001.html/""}
	y2=${y1/_/" "}
	index="/storage/DB2E-8DC5/sys/"$y\"">"$y2
	echo $pre$index$suff"</br>" >> indexmobile.html
	touch $y1/.nomedia
done
echo "</body>
</html>" >> indexmobile.html
echo "Finished master indexmobile.html"
