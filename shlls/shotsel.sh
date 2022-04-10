#!/bin/zsh
[[ ! -d $HOME/Pictures/shots ]] && mkdir -p $HOME/Pictures/shots || scrot -s $HOME/Pictures/shots/%Y%m%d_%H%M%S.png -q 100 -e 'xclip -selection clipboard -t image/png -i $f'
