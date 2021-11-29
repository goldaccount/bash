#!/bin/zsh
for x in *.mkv
do
	ffmpeg -i $x -map 0 -c:v libx265 -vf scale=1280:720:lanczos -c:a copy ${x/mkv/mp4} -threads 12
done
