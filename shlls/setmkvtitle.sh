#!/bin/zsh
temp=$IFS
IFS="....."
for x in *.mkv
do
#	title=$(echo $x | gawk -F "] " '{print $2}' | gawk -F " v" '{print $1}')
	title2=${${x#*] *}%% v*}
#	echo $x....$title2
	ffmpeg -i "$x" -map 0 -metadata title=${title2} -codec copy $HOME/mount/p1a/Mn/Oshi\ No\ Ko/"$title2".mkv
#	echo $title2
done
IFS=$temp
