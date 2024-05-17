#/bin/zsh
#sudo mount -t cifs -o rw,noatime,user,users,credentials=/home/nr2/.config/mount/nr2,uid=1000 //tn1/p1a mount/p1a
sudo mount -t nfs tn2:/mnt/p2/p2b mount/p1b -wv
