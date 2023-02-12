#!/bin/zsh
out="/home/nr2/usb/20230124"
for x in *.rar
do
	if [[ ! ( $x =~ ^KSBD || $x =~ ^MYTH ) ]]; then
		if [[ $x =~ hololive* || $x =~ HoneyWorks* || $x =~ KAMITSUBAKI* || $x =~ Yorushika ]]; then
			y=${${x/_/\/}/.rar/}
#			echo $y
		elif [[ $x =~ NatsumeItsuki* ]]; then
			y=itsuki/${x/.rar/}
		elif [[ $x =~ HoshimachiSuisei* ]]; then
			y=hololive/${x/.rar/}
		elif [[ $x =~ DECO ]]; then
			y=Vocaloid/${x/.rar/}
		elif [[ $x =~ part ]]; then
			y=o/${x/.part*/}
		else
			y=o/${x/.rar/}
		fi
		7z e $x -o${out}'/'${y}
	fi
done
