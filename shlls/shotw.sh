#!/bin/zsh
#
date=$(date +%Y%m%d_%H%M%S)
fullpath=$HOME/Pictures/shots/$date
#[[ ! -d $HOME/Pictures/shots ]] && mkdir -p $HOME/Pictures/shots ||
#scrot -q 100 -u ${fullpath}.png -e 'xclip -selection clipboard -t image/png -i $f' 

maim -i $(xdotool getactivewindow) -m 10 -u -f png ${fullpath}.png | xclip -loops 5 -sel c -t image/png 
