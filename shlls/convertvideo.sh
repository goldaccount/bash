#!/bin/bash
#Learn how to pass values with spaces to other command 
#1. Define parsed parameters
#2. Check file exist
#3. Check parameter value, position-agnostic
#4. Assign default values
#5. Process parameters values
#6. Execute commands with processed parameters values, avoid duplicates
#7. Commands
#7. Bug catch

#1. Define parsed parameters
input_file=$1
output_file=${input_file/\.*/-converted.mkv} #Strip extension, replace with -converted.mkv
crf_val=""
preset_val=""
resize=""
fps=""
array_para=("$2" "$3" "$4" "$5")

#2. Check file exist
fx_check_file() {
	if [[ ! -a $1 ]]; then
		echo "File not found. Exiting."
		exit
	fi
}

fx_print_help() {
	echo "convert_all.sh <input file> <crf> <preset> <resolution>
	crf=[1..28] (default 28)
	preset=veryslow,slower,slow, medium, fast, faster, veryfast, superfast, ultrafast (default medium)
	resolution=1080, 720 (default 720)"
}

#3. Check parameter if exist
fx_check_command() {
	if [[ -z $1 ]]; then
		fx_set_default
#		echo "Missing parameters."
	fi
}

#4. Assign default values
fx_set_default() {
	if [[ -z $crf_val ]]; then
		crf_val=28
	fi
	if [[ -z $preset_val ]]; then
		preset_val="fast"
	fi
	if [[ -z $resize ]]; then
		resize=''
	fi
	if [[ -z $fps ]]; then
		fps=''
	fi
}

#3. Check parameter value, no matter position
fx_process_parameter() {
	local i=0;
	while [ $i -lt 3 ]
	do
		fx_check_command ${array_para[$i]}
		fx_process_command ${array_para[$i]}
		((i++))
	done
}

#5. Process parameter values
fx_process_command() {
	case $1 in
	1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28)
		crf_val=$1
		echo crf=$crf_val
	;;
	veryslow|slower|slow|medium|fast|faster|veryfast|superfast|ultrafast)
		preset_val=$1
		echo preset=$preset_val
	;;
	1080|720)
		resize=$1
	;;
	30|60)
		fps=$1
	;;
#	1080)
#		resize='\-vf scale=1920:1080:lanczos'
#		echo resize=$resize
#	;;
#	720)
#		resize='\-vf scale=1280:720:lanczos'
#		echo resize=$resize
#	;;
#	'')
#		fx_set_default	#set default value if null
#	;;
	*)
		echo "Invalid parameter."
		fx_print_help
	;;
	esac
}

#6. Exec commands
fx_dupecheck() {
	local fx_dupecheck_name=$1
	if [[ "$fx_dupecheck_name" != *-converted.mkv ]]; then #Avoid duplicate
		if [[ $resize == 720 ]]; then		#Select command based on values. 
			fx_convert720
		elif [[ $resize == 1080  ]]; then
			fx_convert1080
		elif [[ $resize == ""  ]]; then
			fx_convert
		fi
	fi
}

#7. Commands
fx_convert() {
	ffmpeg -i $input_file -map 0 -c:v libx265 -crf $crf_val -preset $preset_val -c:a copy -n -hide_banner $output_file
}

fx_convert1080() {
	ffmpeg -i $input_file -map 0 -c:v libx265 -crf $crf_val -vf scale=-1:1080:lanczos  -preset $preset_val -c:a copy -n -hide_banner $output_file
}

fx_convert720() {
	ffmpeg -i $input_file -map 0 -c:v libx265 -crf $crf_val -vf scale=-1:720:lanczos -preset $preset_val -c:a copy -n -hide_banner $output_file
}


#Kill insufferable fucking spaces
	SAVEIFS=$IFS
	IFS=$(echo -en "\n\b")

#Main program flow
fx_check_file $input_file
fx_process_parameter
fx_dupecheck $input_file
