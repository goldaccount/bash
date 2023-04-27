#!/bin/zsh	 
#Generating master indexpc.html & indexmb.html..."
echo '<html>
	<head>
	<style>
		html, body {
		background: #000;
		}	
		a, p, li, h1, h2 {
		color: #AAA; font-size: 3vw;
		}
	</style>	
	</head>
<body>
<h1>
<ol>' > indexpc.html > indexmb.html
for y in $(ls -R */001.html) 
do
	index=""
	pre="<li><a href=\""
	suff="</a>"
	y1=${y/\/001.html/""}
	y2=${y1/_/" "}
	index=$y\"">"$y2
	indexm="/storage/DB2E-8DC5/sys/"$y\"">"$y2
	echo ${pre}${index}${suff}"</br>" >> indexpc.html
	echo ${pre}${indexm}${suff}"</br>" >> indexmb.html
done
echo '</h1>
</ol>
</body>
</html>' >> indexpc.html >> indexmb.html
echo "Finished master indexpc.html & indexmb.html"
