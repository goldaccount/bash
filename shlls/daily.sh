#!/bin/zsh
today=`date +%Y%m%d`
full=$HOME/Documents/Air/TSN/$today
if [[ ! -d $full ]]; then        
        mkdir $full
        ln -s $full $today
        echo $today
else
fi
