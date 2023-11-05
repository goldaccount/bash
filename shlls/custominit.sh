#!/bin/zsh
#Set monitors
#bin/displaysetup.sh
#Set background
#feh --image-bg "#000" --bg-max $HOME/Pictures/84933825_p0.jpg
#feh --image-bg "#000" --bg-fill $HOME/w11.jpg
#./wallchange.sh list 900 &
vol f 0
vol s 0
vol c 0
vol lfe 0
mpd &
#.config/mpd/mpdinit.sh
#Init picom
#picom -b --config=$HOME/.config/picom/picom.conf
#.config/polybar/init.sh
#xrandr --output DP-2 --auto --right-of DP-0

#feh --bg-max Pictures/px/o/bluearchive/109191106_p0.jpg --bg-max Pictures/px/2/紫咲シオン/80105523_p0.png
#
feh --bg-max --randomize ~/Pictures/wpp/* --bg-max --randomize ~/Pictures/wpp/* &
