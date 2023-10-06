#!/bin/zsh
#Delete all empty, *url *txt
find ./* \( \( -iregex '.*\.url' -or -iregex '.*\.txt' \) -or -type d -empty \) -delete
#Call stripmeta on *flac *mp3
find ./* \( -iregex '.*\.flac' -or -iregex '.*\.mp3' \) -exec stripmeta '{}' \;
