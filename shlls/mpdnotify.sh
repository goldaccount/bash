#!/bin/zsh
current=$(mpc --host=/home/rnx/.config/mpd/socket --format '%title%\n%album% - %artist%' | grep -v volume)
notify-send -r 559977 -t 5000 "Playing" $current
