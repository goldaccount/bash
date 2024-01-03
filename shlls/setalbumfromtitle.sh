for x in *.m4a; do; title=`fpr $x -show_entries "format_tags=title" -v quiet -of csv=p=0`; echo $title; atomic $x -W --album $title; done
