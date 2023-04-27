#!/bin/zsh
#

fx_mp3() {
	eyeD3 \
	--remove-all-comments \
	--user-text-frame "www" \
	--user-text-frame "COMMENT" \
	--user-text-frame "download" \
	--user-text-frame "DOWNLOAD SITE" \
	--user-text-frame "encoder" \
	--preserve-file-times \
	$1
}

fx_flac() {
	metaflac --remove-tag="COMMENT" --remove-tag="comment" --remove-tag="DOWNLOAD SITE" --remove-tag="encoder" --remove-tag="download" --remove-tag="www" \
	$1
}

fx_m4a() {
	IFS='aaaaa'
	fmpeg -i "$1" -metadata download="" -metadata www="" -metadata comment="" -c copy ${x/.m4a/_.m4a}
	IFS=' '
}

fx_proc() {
	x="$1"
	if [[ $x =~ .*mp3.* ]]; then
		fx_mp3 $x
	elif [[ $x =~ .*flac.* ]]; then
		fx_flac $x
	elif [[ $x =~ .*m4a.* ]]; then
		fx_flac $x
	fi
}

fx_proc $1
#for x in *.mp3
#do
#	eyeD3 \
#	--remove-all-comments \
#	--user-text-frame "www" \
#	--user-text-frame "COMMENT" \
#	--user-text-frame "download" \
#	--user-text-frame "DOWNLOAD SITE" \
#	--user-text-frame "encoder" \
#	$x
#done
#else
#fi
#
#if [[ ! -f `ls *.flac` ]]; then
#for x in *.flac
#do
#	metaflac --remove-tag="COMMENT" --remove-tag="comment" --remove-tag="DOWNLOAD SITE" --remove-tag="encoder" --remove-tag="download" --remove-tag="www" \
#	$x
#done
#else
#fi
#echo "Removed all tags."
