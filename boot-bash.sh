#!/bin/bash
mkdir -p $HOME/recalbox-share
docker run --privileged -it -v $HOME/recalbox-share:/recalbox/share -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /media:/media -v /mnt:/mnt -v /etc/machine-id:/etc/machine-id -v /dev:/dev recalbox-launcher/recalbox-launcher:local bash

RETVAL=$?
# echo "returned: $RETVAL"

# 130 = container shutdown
# 129 = container reboot

# if [ $RETVAL -eq 130 ]; then
#  echo "Starting display manager.."
#  systemctl start display-manager.service 

echo "ended with $RETVAL"
exit $RETVAL
# any exit other than 0 or 255 should restart the service?
# exit 0
