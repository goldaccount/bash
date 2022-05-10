#/bin/zsh
ytdlp -f 140 -a $1 --config-location=/home/rnx/sh/ytdl_music 1>$1.log
echo "Done" >> status
