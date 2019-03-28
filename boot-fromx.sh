#!/bin/bash
mkdir -p $HOME/recalbox-share

read -p "WARNING: The graphical server is about to be shut down!
Make sure you close all other apps before proceeding.
Press Enter to continue, or Ctrl+C to cancel."
CURUSER=$(id -un)
CURHOME=$HOME
CURVT=$(sudo fgconsole)

if [ $CURVT -eq 7 ]
then
sudo chvt 1
fi

sudo screen bash -c "systemctl stop display-manager ; su $CURUSER -c /usr/local/bin/recalbox-boot.sh ; systemctl start display-manager"

