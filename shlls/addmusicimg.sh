#!/bin/bash
echo "Adding image" $2 "to" $1 "-->" $3
src="$1"
img="$2"
out="$3"
ffmpeg -i $src -i $img -map_metadata 0 -map 0 -map 1 -acodec copy -vsync 2 $out 1>/dev/null
