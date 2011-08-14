#!/bin/sh

# cap: make screenshot and upload it to sprunge.us

PAGE=And1
PASSWD=foo

[ "$PAGE" ] && [ "$PASSWD" ] || {
  echo "need PAGE and PASSWD. please edit me."
  exit
}

[ $1 ] && sleep $1

scrot -q 50 /tmp/$$.png || {
  echo "pls install scrot or imagemagick, thx."
  echo "pls install imagemagick, thx."
  exit
}

curl -F "ver=2" -F "passwd=$PASSWD" -F "img=@/tmp/$$.png" cap.sprunge.us/$PAGE
rm /tmp/$$.png
