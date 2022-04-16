#!/bin/zsh
#twspace-dl
# -i input URL
# -u show master URL (m3u8 playlist url)
# -f use master URL
# -s skip download
# -k keep files 
# -l log file
# -o output format
# %(title)s %(id)s %(start_date)s %(creator_name)s %(creator_screen_name)s %(url)s 
#date=$(date +%Y%m%d_%H%M).log
twspace_dl -o "%(start_date)s_%(creator_name)s_%(id)s" -l -i $1
