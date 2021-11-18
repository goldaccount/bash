#/bin/bash
pactl set-sink-mute $(pactl list sinks short | grep alsa | sed -e 's/\t.*//') toggle
