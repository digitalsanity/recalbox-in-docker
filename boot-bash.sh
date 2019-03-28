#!/bin/bash
mkdir -p $HOME/recalbox-share
docker run --privileged -it -v $HOME/recalbox-share:/recalbox/share -v /media:/media -v /mnt:/mnt -v /etc/machine-id:/etc/machine-id -v /dev:/dev recalbox/recalbox:master bash
#docker run --privileged -it -v $HOME/recalbox-share:/recalbox/share -v /media:/media -v /mnt:/mnt -v /etc/machine-id:/etc/machine-id -v /dev:/dev --device /dev/dri:/dev/dri --device /dev/dri/by-path/:/dev/dri/by-path/ --device /dev/mali0:/dev/mali0 recalbox/recalbox:master
#docker run --privileged -it -v $HOME/recalbox-share:/recalbox/share -v /media:/media -v /mnt:/mnt -v /etc/machine-id:/etc/machine-id -v /dev:/dev --device /dev/dri:/dev/dri --device /dev/dri/by-path/:/dev/dri/by-path/ --device /dev/mali0:/dev/mali0 recalbox/recalbox:master bash
echo "recalbox ended."
#/etc/init.d/rcS
