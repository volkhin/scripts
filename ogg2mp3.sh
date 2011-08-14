#!/bin/sh
#
# ogg to mpg3 converter
#

OGG_FILE="$1"
MPEG_FILE="$2"

TITLE=`ogginfo -v ${OGG_FILE} | grep title= | awk -F title= '{print $2}'`
ARTIST=`ogginfo -v ${OGG_FILE} | grep artist= | awk -F artist= '{print $2}'`
ALBUM=`ogginfo -v ${OGG_FILE} | grep album= | awk -F album= '{print $2}'`
GENRE=`ogginfo -v ${OGG_FILE} | grep genre= | awk -F genre= '{print $2}'`
GENRENR=`lame --genre-list | grep -i --max-count=1 ${GENRE} | awk '{print $1}'`
TRACKNR=`ogginfo -v ${OGG_FILE} | grep tracknumber= | awk -F tracknumber= '{print $2}'`

ogg123 -q --device wav -f - ${OGG_FILE} | \
        lame -h -v -b 192 --quiet --preset cd \
                --tt "${TITLE}" \
                --ta "${ARTIST}" \
                --tl "${ALBUM}" \
                --tg "${GENRENR}" \
                --tn "${TRACKNR}" \
                - \
                ${MPEG_FILE}

exit 0
