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
		color: #DDD;
		font-size: 3vw;
		}	
	}
	</style>	
	</head>
<body>' > $y/001.html
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
echo '<html>
	<head>
	<style>
		html, body {
		background: #000;
		color: #DDD !important;
		h1, a, a:visited, a:hover {
		color: #DDD !important;;
		font-size: 3vw !important;;
		}	
	}
	</style>	
	</head>
<body>' > indexpc.html
for y in $(ls -R */001.html) 
do
	index=""
	pre="<h1><a href=\""
	suff="</a></h1>"
	y1=$(echo $y | sed -E 's/\/001\.html//g' | sed -E 's/'_'/ /g')
	index=$y\"">"$y1
	echo $pre$index$suff"</br>" >> indexpc.html
done
echo "</body>
</html>" >> indexpc.html
echo "Finished master indexpc.html"
