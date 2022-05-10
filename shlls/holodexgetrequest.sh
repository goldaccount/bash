#!/bin/zsh
sed -E s/"UC.*"/$2\"/ < $1
firefox https://holodex.stoplight.io/docs/holodex/b3A6MTE2NDUyNTI-create-a-search-video-search 
