#!/bin/sh -e

# mp3sync: sync mixed/, music/ and new/ with bitsenke.local

MUSICDIRS="/home/and1/mixed /home/and1/music /home/and1/new"
BACKUPDIR="/mnt/#Musik"

if mount | grep "bitsenke.local:/srv/data on /mnt" > /dev/null; then
  rsync -vvrlpt --delete $MUSICDIRS $BACKUPDIR
else
  mount /mnt &&\
  rsync -vvrlpt --delete $MUSICDIRS $BACKUPDIR &&\
  umount /mnt
fi
