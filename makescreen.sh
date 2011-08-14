#!/bin/bash

FILE=`date +"%Y-%m-%d-%s".png`
sleep 5
scrot /tmp/$FILE
ompload /tmp/$FILE

