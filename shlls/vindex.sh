#!/bin/zsh

#Check if exist vid, then create index
fx_checkvid() {
	find ./*/ \( -iregex '.*mp4' -o -iregex '.*mov' \) -a -type f -execdir zsh -c 'echo -n "<html>
<head>
	<style>
    	html, body {background: #000;}
		a, p, li, h1, h2 {color: #AAA; font-size: 3vw;}
	</style>
</head>
<body>
</body>
</html>
" > 001v.html' \;
}

fx_addvideo() {
	find ./*/ \( -iregex '.*mp4' -o -iregex '.*mov' -o -iregex '.*mkv' \) -a -type f -execdir zsh -c ' \
	x="{}"
	pre="<video width=100% controls><source src=\""
	suff="\" type=\"video/mp4\"></video>"
	sed -i 8a${pre}${x}${suff}"</br>" 001v.html;' \;
}

fx_masterindex() {
	echo -n "<html>
<head>
	<style>
    	html, body {background: #000;}
		a, p, li, h1, h2 {color: #AAA; font-size: 3vw;}
	</style>
</head>
<body>
<ol>
</ol>
</body>
</html>
" > indexv.html
	find ./*/ -name '001v.html' -exec zsh -c ' \
	x="{}"
	pre="<li><a href=\""
	suff="</a>"
	text=${x/\/001v.html/}
	sed -i 9a${pre}${x}\"">"${text/.\//}${suff}"</br>" indexv.html
	' \;
}

fx_checkvid
fx_addvideo
fx_masterindex

#-printf "%f\n"
#-execdir zsh -c 'x="{}"; ../vindex2.sh $x' \; #2>/dev/null
#find */001v.html -exec sh -c "echo -n {}; echo -n ' .. '; echo {}" \;
