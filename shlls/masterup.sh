#!/bin/zsh
vol=$( expr $(amixer -c 1 cget numid=33 | grep ': values' | sed -E 's/.*=//') + 2 )
amixer -c 1 cset numid=33 $vol
