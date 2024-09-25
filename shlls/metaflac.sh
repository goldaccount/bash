#!/bin/zsh
#metaflac --remove-tag=Album --remove-tag=Artist --remove-tag=Label --remove-tag=Date --remove-tag=Genre $1
metaflac --remove-tag=Album --set-tag=Album="" --set-tag=Artist="" --set-tag=Label="" --set-tag=Date="" --set-tag=Genre="" $1
