#!/bin/zsh
#metaflac --remove-tag=Album --remove-tag=Artist --remove-tag=Label --remove-tag=Date --remove-tag=Genre $1
#for x in *.flac; do; name=$(echo $x | awk -F. '{print $2}');  metaflac --remove-tag=Album --set-tag=Album="Amazing" --set-tag=Artist="Sakakibara Yui" --set-tag=Label="" --set-tag=Date="" --set-tag=Title="$name" $x; done
metaflac --remove-tag=Album --set-tag=Album="" --set-tag=Artist="" --set-tag=Label="" --set-tag=Date="" --set-tag=Genre="" $1
