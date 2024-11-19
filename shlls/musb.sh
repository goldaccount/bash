#!/bin/zsh
usb=$(udisksctl mount -b /dev/$1)
echo ${usb##*at } | xclip -sel c
echo ${usb##*at }
