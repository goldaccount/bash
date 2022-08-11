#!/bin/zsh
if [[ $1 =~ ^https.*youtu.* ]]; then
	url=$1
elif [[ $1 =~ .*youtu.* ]]; then
	url="https://"$1
elif [[ $1 =~ .*holodex.* ]]; then
	url=${1/holodex.net\/watch/youtu.be}
else
	url="https://youtu.be/"$1
fi

ytdlp $url -f $2 --downloader ffmpeg --downloader-args "ffmpeg_i:-ss $3 -t $4" --config-location $HOME/sh/ytdl_id
