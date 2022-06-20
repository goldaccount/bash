#!/bin/zsh
#$1 = input
#$2 = scale
#$3 = fps

ffmpeg -i $1 -vf "fps=${3},scale=iw/${2}:ih/${2}:flags=lanczos,palettegen" $1.png && \
ffmpeg -i $1 -i $1.png -filter_complex "fps=${3},scale=iw/${2}:ih/${2}:flags=lanczos[x];[x][1:v]paletteuse" $1.gif
echo Done converting
mpv --loop $1.gif
