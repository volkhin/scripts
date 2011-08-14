#!/bin/sh

# dgsync: sync scripts/ and wallpapers/ with donnergurgler.net

LOCALDIRS="/home/and1/scripts /home/and1/wallpapers"
BACKUPDIR="and1@donnergurgler.net:public_html"

rsync -avvr --delete $LOCALDIRS $BACKUPDIR
