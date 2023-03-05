#!/bin/zsh
sudo mount -t cifs -o ro,noatime,user,users,uid=1000,credentials=/home/nr2/.config/mount/smb1 //tn1/Music mount/Music
