#!/bin/zsh
sudo umount ${1}*
sudo hdparm -y $1
sudo hdparm -Y $1
sudo udisksctl power-off -b $1
