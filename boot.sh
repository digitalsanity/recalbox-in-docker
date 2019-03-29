#!/bin/bash
echo "Booting with $HOME"
mkdir -p $HOME/libreelec-share
docker run --privileged -it -v $HOME/libreelec-share:/storage -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /media:/media-host -v /mnt:/mnt -v /etc/machine-id:/etc/machine-id -v /dev:/dev libreelec-launcher/libreelec-launcher:local
RETVAL=$?
# echo "returned: $RETVAL"

# 130 = container shutdown
# 129 = container reboot

# if [ $RETVAL -eq 130 ]; then
#  echo "Starting display manager.."
#  systemctl start display-manager.service 

exit $RETVAL
# any exit other than 0 or 255 should restart the service?
# exit 0
