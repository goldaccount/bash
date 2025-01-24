#!/bin/zsh
<<<<<<< HEAD
echo Unmounting /dev/$1
udisksctl unmount -b /dev/$1*
#sudo umount /dev/${1}*
#echo Idling $1
#sudo hdparm -y $1
#sleep 10
#echo Sleeping $1
#sudo hdparm -y /dev/$1
#sleep 5
echo Powering off /dev/$1
udisksctl power-off -b /dev/$1
>>>>>>> bf758a67dbacfafa611e48d51521bf94ad2d5e9f
