#!/bin/bash
for x in $(ls *.webp)
do
	convert -format jpg "$x" ${x/"webp"/""}jpg
done

