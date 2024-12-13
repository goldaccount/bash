#!/bin/zsh
echo Unmounting $1
udisksctl unmount -b /dev/$1*
#sudo umount ${1}*
#sudo hdparm -Y $1
#echo Powering off $1
sudo udisksctl power-off -b /dev/$1
