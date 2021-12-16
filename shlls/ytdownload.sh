#!/bin/bash
url=$1
currentdate=$(date +%Y%m%d_%H%M%S)
#touch $currentdate
if [ -z $1 ]; then
	echo "Syntax error: URL required
Syntax: <URL> [quality] [playlist index]
	quality:Audio: 140=m4a (default), 251=webm
		Video:  [1080]=399,248,137,303,299
			[1440]=400,271,308
			[2160]=401,313,315
		Or input 'vf' to view full list of formats
	";
	exit
fi
if [ "$1" == "vf" ]; then
	ytformat;
	exit
fi
#---Catch format, default to 140 if not specified
if [ -n $2 ]; then
	format=$2
fi
if [ -z $2 ]; then
	format=140
fi
#---Catch playlist start (if any)
if [ -n $3 ]; then
	playlist='--yes-playlist --playlist-start '$3
fi

#---Catch no playlist
if [ -z $3 ]; then
	playlist=''
fi
#-----

	#playlist='--yes-playlist --start-playlist='$2
	ytdl --add-metadata -f $format $url -o '%(upload_date)s_%(id)s.%(ext)s' --write-thumbnail $playlist $4 1>$currentdate &
tail -F $currentdate
#title=$(ytdl $url --get-title --skip-download &)
#id=$(ytdl $url --id --skip-download )
#touch $id && echo $title | tee -a $id

