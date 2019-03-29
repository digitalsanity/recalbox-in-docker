#!/bin/bash
mkdir -p $HOME/libreelec-share
docker run --privileged -it -v $HOME/libreelec-share:/storage -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /media:/media -v /mnt:/mnt -v /etc/machine-id:/etc/machine-id -v /dev:/dev libreelec-launcher/libreelec-launcher:local bash
