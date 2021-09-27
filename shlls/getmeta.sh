#!/bin/bash
#Copy to /usr/local/bin with same name
#1. Get file name and field selector from pipe input
#2. Check file exist and syntax
#3. Use case to output required field selector value for 4
#4. Use atomicparsley to parse value of input file
#5. Main process: return value to output


#Declare global vars
g_input=""
g_select=""

#1. Get file name + field selector
fx_getfile() {
	g_input=$1
	g_select=$2
	#Call check function
}
fx_syntaxinfo() {
	echo "Syntax: <file> <field selector>
	a	Artist
	t	Title
	b	Album name
	ab	Album Artist
	w	Artwork"
return 0
}

#2. Check file exist & syntax, if true call selector and pass select
fx_check() {
	local fx_check_inputfile=$1
	local fx_check_selector=$2
	if [[ ! -a $fx_check_inputfile || -z $fx_check_selector ]]; then
		echo "File do not exist or wrong syntax."
		fx_syntaxinfo
		exit
		return 1
	else
		return 0
	fi
}
#3. Map selector to search criteria, return selector value
fx_selector() {
	local fx_selector_value=$1
	case $fx_selector_value in 
		"a"|"A"|"artist"|"Artist")
			echo "©ART"
			return 0
			;;
		"b"|"B"|"album"|"Album")
			echo "©alb"
			return 0
			;;
		"ab"|"aB"|"Ab"|"AB"|"albumartist"|"Albumartist"|"albumArtist"|"AlbumArtist")
			echo "aART"
			return 0
			;;
		"t"|"T"|"title"|"Title"|"name"|"song"|"Song"|"Name")
			echo "©nam"
			return 0
			;;
		"w"|"W"|"artwork"|"cover"|"Artwork"|"Cover")
			echo "covr"
			return 0
			;;
		*)
			echo "Bad selector."
			fx_syntaxinfo
			exit
			return 1
			;;
	esac
}

#4. Parse and trim value of input file, using global input file var and piped selector value from 3, return queried data
fx_parse() {
	local fx_parse_inputfile=$g_input
	local fx_parse_query=$2
	local fx_parse_rawdata=$(atomic "$fx_parse_inputfile" -t | grep $fx_parse_query)
	local fx_parse_data=${fx_parse_rawdata/*contains:/""}
	echo $fx_parse_data
}

fx_getfile $1 $2 #Assign global value from passed input 
fx_check $g_input $g_select	#Debug check
fx_parse $g_input $(fx_selector $g_select)	#Call query function

