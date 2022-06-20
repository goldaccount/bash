#!/bin/zsh
today=$(date +%Y%m%d_%H%M%S)
transmission-cli -ep -v -w $HOME/Ex/Torrent/ $1 &>$today.log &
tail -F $today.log
