#!/bin/zsh
[[ ! -d $HOME/Pictures/shots ]] && mkdir -p $HOME/Pictures/shots
scrot -u $HOME/Pictures/shots/%Y%m%d_%H%M%S.png -e 'xclip -selection clipboard -t image/png -i $f' 
