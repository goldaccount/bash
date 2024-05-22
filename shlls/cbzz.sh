#!/bin/zsh
for x in `ls -d */`; do
	name=`echo $x | sed 's/\///'`
	find ${x} \( -iregex '.*\.png' -or -iregex '.*\.jpg' \) -exec 7z a ${x}${name}.zip '{}' \;
	find ${x}*.zip -exec recbz --cbz --color '{}' \;
	find ${x}*.zip -delete
#	touch ${name}\ \[reCBZ\].cbz
	mv ${name}\ \[reCBZ\].cbz ${name}.cbz
	find ${name}.cbz -exec recbz --color -p PW5 '{}' \;
	mv ${name}\ \[reCBZ\].epub ${name}.epub
done
