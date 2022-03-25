#!/bin/zsh
vol=$1
#vol=$( expr $(amixer -c 1 cget numid=33 | grep ': values' | sed -E 's/.*=//') + 2 )
if [[ -z $vol ]]; then
	amixer -c 1 cset numid=5 0
else
	amixer -c 1 cset numid=5 $vol
fi
