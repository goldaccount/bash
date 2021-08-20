#!/bin/bash

#Init vars
url=''
quality=''
vid=''
aud=''
title=''
#Quality ID arrays
idaud=(251 140 250 249)
id144=(278 160 394)
id240=(242 133 395)
id360=(243 134 396)
id480=(244 135 297)
id720=(302 398 247 136 298)
id1080=(303 399 248 137 299)
id1440=(308 271 400)
id2160=(315 401 313)
id4320=(571 0)
i=-1	#Array index counter starts at -1 for positive value in while loop
ib=-1	#Counter

if [ -z $1 ] | [ -z $2 ];
then
	echo "Syntax: ytvlc <quality> <URL>"
	echo "Audio Only = aud/audio/novid
	360p = 360; 480p = 480; 720p = 720/hd/HD
	1080p = 1080/full/fullHD/fullhd
	2K = 1440/2K/2k
	4K = 2160/4K/4k
	Or specify format directly.
	"
	exit
else
		url=$2	#Assign pipe to var
		quality=$1
		title=$(ytdl -e -s $url)
		echo $title		#Debug
fi

#Check vid id, if return null skip to next vid id, or default to 640p
while [ -z $vid ]
do
i=$(expr $i + 1)
	case $quality in
		aud|audio|novid)
			break 2
			;;
		360|shit)
			vidquality=${id360[$i]}
			;;
		480|sd)
			vidquality=${id480[$i]}
			;;
		720|HD|hd)
			vidquality=${id720[$i]}
			;;
		1080|fullhd|fullHD|full)
			vidquality=${id1080[$i]}
			;;
		1440|2K|2k)
			vidquality=${id1440[$i]}
			;;
		2160|4K|4k)
			vidquality=${id2160[$i]}
			;;
		*)
			vidquality=$quality
			;;
	esac
	#echo $vidquality 	#Debug
	#Catch error if exhaust id array
	if [ $i -le 5 ];
	then
		vid=$(ytdl -g -s -f $vidquality $url 2>/dev/null)
	else
		echo "Quality not available."
	fi
done

#Check aud id, if return null skip to next aud id
while [ -z $aud ]
do
	ib=$(expr $ib + 1)
	audquality=${idaud[$ib]}
	aud=$(ytdl -g -s -f $audquality $url 2>/dev/null) 
done

if [ $quality == "aud" ] | [ $quality == "audio" ];
then
	echo "Playing ["$title"] audio only."
	vlc --meta-title "$title" --no-autoscale --no-video-deco --no-video $aud :network-caching=2000 2>/dev/null
else
	echo "Playing ["$title"] at ["$quality"] quality."
	vlc --meta-title "$title" --no-video-deco $vid :input-slave=$aud :network-caching=2000 2>/dev/null
fi 
#2>/dev/null
#vlc --playlist-enqueue $vid2 :input-slave=$aud2 :network-caching=1000
#--meta-title "$title"
#--no-video-title-show
#--no-video
#--no-video-deco
#--no-osd
#--no-autoscale
