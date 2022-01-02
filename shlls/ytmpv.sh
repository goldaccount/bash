#!/bin/bash
#1. Init vars & get from input pipe
#2. Check syntax & formats, echo errors
#3. Map quality selector to format ID
#4. Run vlc
#
#

glb_url=""
glb_quality=""

fx_pickquality() {
#	local fx_pickquality_id
	echo "Quality:
	F for all formats
	novid = audio/aud/novid
	360   = 360/shit
	480p  = 480/sd
	720p  = 720/HD/hd
	1080p = 1080/fullHD/full
	2K    = 1440/2K/2k
	4K    = 2160/4K/4k"
	if [[ $1 == 'f' ]]; then
		ytformat
	fi
#	read fx_pickquality_id
#	echo You chose $fx_pickquality_id
#	glb_qualityid=$fx_pickquality_id
#	unset fx_pickquality_id
}

#2. Check input 
fx_checkurl() {
	local fx_checkurl_input1
	fx_checkurl_input1="$1"
	
	if [[ -z $1 ]]; then
		echo "Invalid input.
		Syntax: ytvlc <url> [quality] or parse 'a' for audio only"
		return 1
		exit
	fi

	if [[ $fx_checkurl_input1 =~ ^https.*youtu.* ]]; then
		fx_checkurl_input1=$1
	elif [[ $fx_checkurl_input1 =~ .*youtu.* ]]; then
		fx_checkurl_input1="https://"$1
	else
		fx_checkurl_input1="https://youtu.be/"$1
	fi
	echo $fx_checkurl_input1
	unset fx_checkurl_input1
	return 0
}

#2. Check quality input, if a then select audio only, if not specified default to 1080p
fx_checkquality() {
	if [[ -z $1 ]]; then
#		url_v=$(fx_geturl_v $1)
#		url_a=$(fx_geturl_a $1)	
		echo best
	else
		echo $1
	fi
	return 0
}

#3. Process video quality id from input, return functional video url
fx_mapid_v() {
	local fx_mapid_v_input1=$1
	local fx_mapid_v_id=''
	local fx_mapid_v_url=''
	#Quality ID arrays
	local fx_mapid_v_id144=(278 160 394)
	local fx_mapid_v_id240=(242 133 395)
	local fx_mapid_v_id360=(243 134 396)
	local fx_mapid_v_id480=(244 135 297)
	local fx_mapid_v_id720=(302 298 398 247 136)
	local fx_mapid_v_id1080=(303 299 248 137 399)
	local fx_mapid_v_id1440=(308 271 400)
	local fx_mapid_v_id2160=(315 401 313)
	local fx_mapid_v_id4320=(571 0)
	local i=0	#Array index counter
	#Check vid id, if return null skip to next vid id, or default to 480p

	while [[ -z $fx_mapid_v_url && $i -lt 5 ]]
	do
		case $fx_mapid_v_input1 in
		a|aud|audio)
			break 2
			;;
		144)
			fx_mapid_v_id=${fx_mapid_v_id144[$i]}
			;;
		240)
			fx_mapid_v_id=${fx_mapid_v_id240[$i]}
			;;
		360)
			fx_mapid_v_id=${fx_mapid_v_id360[$i]}
			;;
		480)
			fx_mapid_v_id=${fx_mapid_v_id480[$i]}
			;;
		720|HD|hd)
			fx_mapid_v_id=${fx_mapid_v_id720[$i]}
			;;
		1080|fullhd|fullHD|full)
			fx_mapid_v_id=${fx_mapid_v_id1080[$i]}
			;;
		1440|2K|2k)
			fx_mapid_v_id=${fx_mapid_v_id1440[$i]}
			;;
		2160|4K|4k)
			fx_mapid_v_id=${fx_mapid_v_id2160[$i]}
			;;
		4320|8K|8k)
			fx_mapid_v_id=${fx_mapid_v_id4320[$i]}
			;;
		*)
			fx_mapid_v_id=480
			;;
		esac
		fx_mapid_v_url=$(fx_geturl $fx_mapid_v_id)
		i=$(expr $i + 1)
	done
	echo $fx_mapid_v_url
	return 0
}

#3. function return correct quality id of audio, default to highest quality
fx_mapid_a() {
#Check aud id, if return null skip to next aud id
	local fx_mapid_a_array=(251 140 338 327 250 249)
	local fx_mapid_a_id
	local fx_mapid_a_url
	local i=0
	while [[ -z $fx_mapid_a_url && $i -lt 6 ]]
	do
		fx_mapid_a_id=${fx_mapid_a_array[$i]}
		fx_mapid_a_url=$(fx_geturl $fx_mapid_a_id)
		i=$(expr $i + 1)
	done
	echo $fx_mapid_a_url
	return 0
	unset fx_mapid_a_array
	unset fx_mapid_a_id
	unset fx_mapid_a_url
}

#Get url of video from global url and quality id

#Get url id of format provided in $1, return url of requested format
fx_geturl() {
	local fx_geturl_url=""
	fx_geturl_url=$(ytdlp -s -g -f "$1" $glb_url)
	echo $fx_geturl_url
	unset fx_geturl_url
	return 0
}

#Get best quality URL
fx_geturl_v() {
	local fx_geturl_v_url=""
	fx_geturl_v_url=$(ytdlp -s -g -f bv $1)
	echo $fx_geturl_v_url
	unset fx_geturl_v_url
	return 0
}
fx_geturl_a() {
	local fx_geturl_a_url=""
	fx_geturl_a_url=$(ytdlp -s -g -f ba $1)
	echo $fx_geturl_a_url
	unset fx_geturl_a_url
	return 0
}

#Get thumnail from url provided in $1, return maxresdefault URL
fx_getthumb() {
	local fx_getthumb_url=""
	fx_getthumb_url=$(ytdlp --list-thumbnails -s $1 | grep maxresdefault.jpg | sed -E 's/.*https/https/g')
	echo $fx_getthumb_url
	unset fx_getthumb_url
	return 0
}

#Get url from $glb_url, return title of video
fx_play_title() {
	local title
	title=$(ytdlp -e -s $1)
	echo $title
	return 0
	unset $title
}
#4. Function call mpv, parse url value from video, audio and title function
fx_play() {
	local fx_play_v
	local fx_play_a
	local fx_play_title

	echo "Getting URLs..."	
	if [[ $glb_quality == 'best' ]]; then
		fx_play_v=$(fx_geturl_v $glb_url)
		fx_play_a=$(fx_geturl_a $glb_url)		
	elif [[ $glb_quality == 'a' || $glb_quality == 'aud' || $glb_quality == 'audio' ]]; then
		fx_play_a=$(fx_geturl_a $glb_url)		
	else
		fx_play_v=$(fx_mapid_v $glb_quality)
		fx_play_a=$(fx_mapid_a)
	fi
	echo "Getting title..."
	fx_play_title=$(fx_play_title $glb_url)
	echo "Getting thumbnail..."
	fx_play_thumb=$(fx_getthumb $glb_url)

	if [[ $glb_quality == 'a' || $glb_quality == 'aud' || $glb_quality == 'audio' ]]; then
		echo "Playing ["$fx_play_title"] audio only."
		mpv $fx_play_thumb --audio-file=$fx_play_a --title=$fx_play_title --profile=youtube
	else
		echo "Playing ["$fx_play_title"] at "$glb_quality" quality."
		mpv $fx_play_v --audio-file=$fx_play_a --title=$fx_play_title --profile=youtube

	fi 
	return 0
}

#	

#2>/dev/null
#vlc --playlist-enqueue $vid2 :input-slave=$aud2 :network-caching=1000
#--meta-title $title
#--no-video-title-show
#--no-video
#--no-video-deco
#--no-osd
#--no-autoscale


glb_quality=$(fx_checkquality $2)
glb_url=$(fx_checkurl $1)
fx_play

#Testing area
#echo $glb_url $glb_quality
#echo $(fx_geturl $1)
#echo $(fx_mapid_a)
#echo $glb_url
#fx_mapid_v $2
#echo $(fx_getthumb $1)

