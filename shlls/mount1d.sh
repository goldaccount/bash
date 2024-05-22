#/bin/zsh
#sudo mount -t cifs -o rw,user,users,credentials=/home/nr2/.config/mount/nr2,uid=1000 //tn1/p1d mount/p1d
#sudo mount -t nfs tn1:/mnt/p1/p1d mount/p1d -wv
sudo mount -t nfs -o rw,nosuid,soft tn2:/mnt/p2/p2d mount/p1d -wv
