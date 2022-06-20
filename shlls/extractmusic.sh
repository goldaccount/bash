#!/bin/zsh
input="$1"
dir="$2"
pass="$3"

#check valid file
fx_check() {
	local x=$input
	local y=$dir
	if [[ -z $pass ]]; then
		pass=$pass
	else
		pass="-p$pass"
	fi
	if [[ ! -f $x ]]; then
	echo "No input file, exiting.
Usage: extractmusic <input path> <output path>"
	exit
	elif [[ -z $y ]]; then
		echo "Not input path, skipping extract."
		dir=$x
		echo "Cleaning up "$dir
		fx_clean
		fx_stripmp3
		fx_stripflac
	else
		fx_extract
		fx_clean
		fx_stripmp3
		fx_stripflac
	fi
	unset x
	unset y
#	fx_result
}

fx_result() {
	echo result is input = $input and dir = $dir
}

fx_extract() {
	#-aoa overwrite mode = (s)kip overwrite(a)ll (t)rename existing file (u)rename extracted file
	7z e $input -o$dir $pass -aos
}

fx_clean() {
	find $dir/* -type d -empty -delete
	rm $dir/*.url
}

fx_stripmp3() {
	if [[ ! -z $(ls $dir/*.mp3) ]]; then
		for x in $dir/*.mp3
		do
			ffmpeg -i $x \
			-hide_banner \
			-metadata comment="" \
			-metadata 'download site'="" \
			-metadata encoder="" \
			-metadata 'download'="" \
			-c copy ${x/.mp3/_b.mp3}
			rm $x
			mv ${x/.mp3/_b.mp3} $x
		done
	fi
}

fx_stripflac() {
	if [[ ! -z $(ls $dir/*.flac) ]]; then
		for x in $dir/*.flac
		do
			ffmpeg -i $x \
			-hide_banner \
			-metadata comment="" \
			-metadata 'download site'="" \
			-metadata encoder="" \
			-metadata 'download'="" \
			-c copy ${x/.flac/_b.flac}
			rm $x
			mv ${x/.flac/_b.flac} $x
		done
	fi
}
fx_check
#fx_cleanonly
#fx_extract
#fx_clean
#fx_stripmp3
#fx_stripflac
