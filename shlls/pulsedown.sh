#/bin/bash
#pactl set-sink-volume $(pactl list sinks short | grep alsa | grep RUNNING | sed -e 's/\t.*//') -2%
amixer -c 1 set Master 5%-
