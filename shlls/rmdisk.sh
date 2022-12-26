#!/bin/zsh
sudo umount ${1}*
udisksctl power-off -b $1
