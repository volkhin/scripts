#!/bin/sh

# filesync: sync config files with /root, donnergurgler.net and bitsenke.local

CONFIGFILES="/home/and1/.bash* /home/and1/.inputrc /home/and1/.screenrc /home/and1/.vim /home/and1/.vimrc"
DESTINATION="/root/ /srv/sid/root/ and1@donnergurgler.net:. and1@bitsenke.local:."

for i in $DESTINATION ; do rsync -avvr --exclude='.bash_history' $CONFIGFILES $i ; done
