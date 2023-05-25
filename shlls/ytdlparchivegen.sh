#!/bin/zsh
for x in *
do
	echo $x | sed -E 's/^.{9}//' | sed -E 's/\..*$//' >> archivelist
done
