#!/bin/zsh
<<<<<<< HEAD
date=$(date +%Y%m%d_%H%M%S)
fullpath=$HOME/Pictures/shots/$date
[[ ! -d $HOME/Pictures/shots ]] && mkdir -p $HOME/Pictures/shots 
#scrot -s $HOME/Pictures/shots/%Y%m%d_%H%M%S.png -q 100 -e 'xclip -selection clipboard -t image/png -i $f'

maim -s -m 10 -u -f png ${fullpath}.png
xclip -selection clipboard -t image/png -i ${fullpath}.png
>>>>>>> 510f32535fd856b1b0ae631ac5a0e951cbd37c9f
