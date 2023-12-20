#!/bin/bash
for x in *.flac
do
	y=`echo $x | sed -e 's/.flac//' -e 's/^..\.\s//'`
	metaflac --set-tag="Title=${y}" $x
done
