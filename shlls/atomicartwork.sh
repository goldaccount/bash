#!/bin/bash
for x in $(ls *.m4a)
do
	base=${x/"m4a"/"jpg"}
	atomic $x --artwork ${x/"m4a"/"jpg"}
done

