#!/bin/bash

#Done_1. Define function for adding metadata, this function must take single input, assignment value and overwrite the original input file
#Done_2. Define function for batch processing by listing all items matching a pattern then call the adding metadata function with its output
#Done_3. Options to choose operation: Artist name, Album name, Artwork name
#Pending_4. Function to extract ID3 tags from file using atomicparsley or similar programs
#Pending_5. Check parsed parameters to avoid voiding field tags
#atomic $input --artist=$artist --albumArtist=$artist -W
#
# Command: a.sh $1 $2 $3 $4	$1 = inputfilename, $2 $3 $4 = parameters
#

#Define passthrough parameters to global variables
tempIFS="$IFS"
IFS="\b"
input1=$1
input2=$2
input3=$3
input4=$4
glb_field=''
inputext=''
#Check valid file
fx_checkfile() {
local x=$1
if [[ ! -f $x ]]; then
	echo "No input file, exiting.
Usage: batch <input file> <1st parameter> [2nd parameter] [3rd parameter]"
	exit
fi
}

fx_getfileext() {
local x=$1
inputext=${x##*.}
echo $inputext
}

#Check valid parameter
fx_checkparam() {
local x=$1
if [[ -z $x ]]; then
	echo "Invalid Parameter found, exiting.
Usage: batch <input file> <1st parameter> [2nd parameter] [3rd parameter]"
	exit
else
	return 0
fi
}

#Select operation mode
fx_opmode() {
local batch=""
echo "Choose operation: 
1	Single file mode
2	Batch file mode (for artwork, artist)"
read batch
#Operation mode check
while [[ -z $batch || $batch -gt 2 || $batch -lt 1 ]] 
do
	echo Wrong Mode, try again
	read batch
done
#Choose single / batch
if [ $batch -eq 1 ]; then
	echo "Single file mode"
	fx_operation
	fx_single $1
	return 0
else 
	if [ $batch -eq 2 ]; then
		echo "Batch file mode"
		fx_operation
		fx_batch $1
		return 0
	fi
fi
return 0
}

#3. Choose operation function
fx_operation() {
local fx_op_field=''
#while [[ -z $fx_op_ield || $fx_op_field -gt 7 || $fx_op_field -lt 1 || $fx_op_field -eq 5  ]]
#do
	echo "Specify input metadata field:
	1	Artist
	2	AlbumArtist
	3	Artist + AlbumArtist
	4	Title + Album
	5	Artist + Title&Album
	6	Artwork
	7	Title&Album + Artwork
	8	Artist + Title&Album + Artwork"
	read fx_op_field
	case $fx_op_field in 
	1|2|3|4|6)	#Call Artist function
		fx_checkparam input2
		;;
	5|7)	#Call Artist + Title&Album function
		fx_checkparam input2
		fx_checkparam input3
		;;
	8)	#Call all functions
 		fx_checkparam input2
 		fx_checkparam input3
 		fx_checkparam input4
		;;
	*)	#Exit
 		echo Wrong choice, input again.
		;;
	esac
#done
glb_field=$fx_op_field
return 0
}

#1. Metadata operation functions, call by fx_ <input> <parameter>
fx_artist() {
local str_artist=$2
local obj_input=$1
case $inputext in 
	m4a)
		atomic "$obj_input" --artist="$str_artist" -W
		;;
	flac)
		metaflac --set-tag="Artist"="$str_artist" --preserve-modtime "$obj_input"
		;;
	mp3)
		eyeD3 -a "$str_artist" "$obj_input"
		;;
	*)
		echo "Unknown file type (!m4a, !flac, !mp3)"
		;;
esac
}

fx_albumartist() {
local str_artist=$2
local obj_input=$1
case $inputext in 
	m4a)
		atomic "$obj_input" --albumArtist="$str_artist" -W
		;;
	flac)
		metaflac --set-tag="albumArtist"="$str_artist" --preserve-modtime "$obj_input"
		;;
	mp3)
		eyeD3 -A "$str_artist" "$obj_input"
		;;
	*)
		echo "Unknown file type (!m4a, !flac, !mp3)"
		;;
esac
}

fx_album() {
local str_album=$2
local str_title=$2
local obj_input=$1
case $inputext in
	m4a|M4A)
		atomic "$obj_input" --title="$str_title" --album "$str_album" -W
		;;
	flac|FLAC)
		metaflac --set-meta="Album"="$str_album" --preserve-modtime "$obj_input"
		;;
	mp3|MP3)
		eyeD3 -Q -A "$str_album" "$obj_input"
		;;
	*)
		echo "Unknown file type (!m4a, !flac, !mp3)"
		;;
esac
}

fx_art() {
local obj_art=$2
local obj_input=$1
case $inputext in
	m4a|M4A)
		atomic "$obj_input" --artwork="$obj_art" -W
		;;
	flac|FLAC)
		metaflac --import-picture-from="$obj_art" --preserve-modtime "$obj_input"
		;;
	mp3|MP3)
		eyeD3 -Q --add-image="$obj_art" "$obj_input"
		;;
	*)
		echo "Unknown file type (!m4a, !flac, !mp3)"
		;;
esac
}

#2. Batch processing
fx_batch() {
local x=$1	#Input object name
local y	#Base name of object
local list=$(ls *.m4a) #List of objects in directory
for x in $list
do
	fx_single $x
done
}

#2. Single processing
fx_single() {
local x=$1	#Input object name
local y	#Base name of object
local fx_single_field
fx_single_field=$glb_field #Get value from global varglb_field 
	case $fx_single_field in 
	1)	#Call Artist function
		fx_artist $x "$input2"
		;;
	2)	#Call AlbumArtist function
		fx_albumartist $x "$input2"
		;;
	3)	#Call Arist & AlbumArtist function
		fx_artist $x "$input2"
		fx_albumartist $x "$input2"
		;;
	4)	#Call Title + &Album function
		fx_album $x "$input2"
		;;
	5)	#Call Artist + Title&Album function
		fx_artist $x "$input2"
		fx_album $x "$input3"
		;;
	6)	#Call Artwork function
		fx_art $x "$input2"
		;;
	7)	#Call Title&Album + Artwork function
		fx_album $x "$input2"
		fx_art $x "$input3"
		;;
	8)	#Call all functions
		fx_artist $x "$input2"
		fx_album $x "$input3"
		fx_art $x "$input4"
		;;
	esac
}

#Function calls
fx_checkfile $input1
fx_getfileext $input1
fx_checkparam $input2
fx_operation
fx_single $input1
#fx_opmode $1
#fx_operation
IFS=$tempIFS
