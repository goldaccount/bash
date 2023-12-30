for x in *.m4a; do; artist=`fpr $x -show_entries "format_tags=artist" -v quiet -of csv=p=0`; echo $artist; atomic $x -W --albumArtist $artist; done
