#!/bin/zsh
#for x in $(<$1); do
for x in `ls -d */`; do
	name=`echo $x | sed 's/\///'`
#	if [[ -z ${x}/${name}.zip ]]; then 
		7z a ${name}.zip ${name}/*.jpg
		7z a ${name}.zip ${name}/*.png
#	else
#		echo ${x}/${name}.zip exists. Skipping...
#	fi
# 	find ${x} \( -iregex '.*\.png' -or -iregex '.*\.jpg' \) -exec 7z a ${x}${name}.zip '{}' \;
#	if [[ -z ${x}/${name}.cbz ]]; then 
#		find ${name}/*.zip -exec recbz --cbz --color '{}' \;
#		find ${name}/*.zip -delete
#	else
#		echo ${x}/${name}.cbz exists. Skipping...
#	fi
#	touch ${name}\ \[reCBZ\].cbz
#	mv ${name}' [reCBZ].cbz' ${name}.cbz
	mv ${name}.zip ${name}.cbz
#	find ${name}.cbz -exec recbz --color -p PW5 '{}' \;
#	mv ${name}' [reCBZ].epub' ${name}.epub
done
