#!/bin/sh

# ii: connect to an IRC server and join a channel (backend for phpii)

IIDIR=/home/and1/irc
NICK=ii
REALNAME="http://and1.donnergurgler.net/ii/"
CHANNEL='#incafeucht'
SERVER=irc.oftc.net
PORT=6669
RECONNET_DELAY=30

(cd $IIDIR && ln -s -f $SERVER oftc)
while true ; do
  ( sleep 10 && echo "/j $CHANNEL" > $IIDIR/${SERVER}/in ) &
  ii -s $SERVER -p $PORT -n $NICK -f $REALNAME
  sleep $RECONNET_DELAY
done
