#!/bin/zsh
for x in $(find * -type d -ctime -1 -print)
do
	base=$x
	zip=Downloads/hq/$(echo $x | sed -E 's/.*\///g').7z
	if [[ ! $base =~ "Downloads".* && $base =~ '.*/.*' ]]; then
		7z u -mx -mmt12 $zip $base
		echo $base"\t"$zip
	fi
done
