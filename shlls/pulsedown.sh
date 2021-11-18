#/bin/bash
pactl set-sink-volume $(pactl list sinks short | grep alsa | sed -e 's/\t.*//') -2%

