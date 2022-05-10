#/bin/zsh
#find * -type d -atime -1 -print | sed -E 's/.*\///g'
#Find all empty directories and delete
find * -type d -empty -print
find * -type d -empty -delete
find */*/*.url -delete
#Find all recently accessed directories in under 24 hours and print, then archive
for x in $(find * -type d -atime -1 -print)
do
	base=$x
	zip=Downloads/hq/$(echo $x | sed -E 's/.*\///g').7z
	if [[ ! $base =~ "Downloads".* && $base =~ '.*/.*' ]]; then
		7z a -mx -mmt12 $zip $base
	fi
	echo $base"\t"$zip
done
