#!/bin/zsh
date=$(date +%Y%m%d_%H%M%S)
fullpath=$HOME/Pictures/shots/$date
[[ ! -d $HOME/Pictures/shots ]] && mkdir -p $HOME/Pictures/shots
#-i $(xdotool getactivewindow)
# scrot -q 100 ${fullpath}.png -e 'convert $f -crop 1920x1080+0+60 $f'
maim -g 3840x1200+0+0 -m 10 -u -f png ${fullpath}.png
#maim -m 10 -u -f png ${fullpath}.png
xclip -selection clipboard -t image/png -i ${fullpath}.png
