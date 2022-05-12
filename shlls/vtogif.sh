#!/bin/zsh
#$1 = input
#$2 = scale /

ffmpeg -i $1 -vf "fps=30,scale=iw/${2}:ih/${2}:flags=lanczos,palettegen" $1.png && \
ffmpeg -i $1 -i $1.png -filter_complex "fps=30,scale=iw/${2}:ih/${2}:flags=lanczos[x];[x][1:v]paletteuse" $1.gif
echo Done converting
mpv --loop $1.gif
