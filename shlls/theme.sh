#!/bin/zsh
themename=$1
#polybar apply
sed -i -E "/include/s/_.*/_${themename}/" .config/polybar/config.ini
killall polybar
.config/polybar/init.sh
.config/polybar/initmon2.sh
#kitty apply
kitty +kitten themes ${themename}
#bspwm apply
sed -i -E "/colors/s/_.*/_${themename}/" .config/bspwm/applytheme.sh
.config/bspwm/applytheme.sh
#rofi apply
sed '1s/".*"$/"${themename}"/' config.rasi 
