#!/bin/bash
url=""
currentdate=$(date +%Y%m%d_%H%M%S)

fx_check() {
if [ -z $1 ]; then
	echo -e "Syntax error: URL required
Syntax: <URL> [quality] [playlist index]
quality: Audio: 140=m4a (default), 251=webm
Video:  [1080]=399,248,137,303,299
        [1440]=400,271,308
        [2160]=401,313,315
        Or input 'vf' to view full list of formats
	"
	exit
#else
#        mode=""
#        read -p "Choose mode" mode
#        echo $mode
fi
}

fx_trim() {
#-Trim URL
if [[ $1 =~ ^https.*youtu.* ]]; then
	url=$1
elif [[ $1 =~ .*youtu.* ]]; then
	url="https://"$1
elif [[ $1 =~ .*holodex.* ]]; then
	url=${1/holodex.net\/watch/youtu.be}
else
	url="https://youtu.be/"$1
fi
echo $url
}

fx_process() {
if [ "$1" == "vf" ]; then
	ytdlp $url -Fs;
	exit
fi
#---Catch format, default to 140 if not specified
if [ -n $2 ]; then
	format="$2[protocol!=DASH]"
fi
if [ -z $2 ]; then
	format=140
fi
#---Catch playlist start (if any)
#if [ -n $3 ]; then
#	playlist='--yes-playlist --playlist-start '$3
#fi

#---Catch no playlist
#if [ -z $3 ]; then
#	playlist=''
#fi
#-----
}

#Direct
#ytdl -f $format $url --add-metadata -o '%(upload_date)s_%(id)s.%(ext)s' --write-thumbnail $playlist $4 1>$currentdate.log &
touch $currentdate.log
fx_dl() {
#Using config file
echo ytdlp "$url" -f $format ${3} --config-location $HOME/sh/ytdl_music --download-archive archive | tee -a $currentdate.log
ytdlp "$url" -f $format ${3} --config-location $HOME/sh/ytdl_music --download-archive archive | tee -a $currentdate.log

}
#title=$(ytdl $url --get-title --skip-download &)
#id=$(ytdl $url --id --skip-download )
#touch $id && echo $title | tee -a $id

#ytmusic Ns4HRGilgHw bv+ba "" "--cookies ~/ck/sora.txt -a download --download-archive list"

fx_check "$1";
fx_trim "$1";
fx_process "$1" "$2" "$3";
fx_dl "$1" "$2" "$3";
