#!/bin/bash

. /etc/defaults/recalbox-launcher

CURUSER=$serviceuser
#$(id -un)
CURHOME=$servicehome
CURVT=$(sudo fgconsole)

if [ $CURVT -eq 7 ]
then
sudo chvt 1
fi

#sudo screen bash -c "
systemctl stop display-manager 
su $CURUSER -c /usr/local/bin/recalbox-boot.sh

RETVAL=$?
echo "docker returned $RETVAL"

if [ $RETVAL -eq 130 ]; then
  systemctl start display-manager
fi

if [ $RETVAL -eq 129 ]; then
  echo "Reboot requested."
fi

exit $RETVAL

