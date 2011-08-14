#!/bin/sh
#tar -caf ~/wd/www.tar ~/www
#tar -caf ~/wd/boot.tar /boot
#tar -caf ~/wd/etc.tar /etc
tar --exclude {/home/*,/usr/*} -caf ~/wd/stage4.tar /

