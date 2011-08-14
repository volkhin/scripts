#!/bin/sh

rsync -r -c --stats --delete --exclude _archive ~/dev/olymp /mnt/sdf1

