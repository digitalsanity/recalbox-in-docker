# recalbox-docker

Launch recalbox/kodi (rockpro64 and Debian/Ubuntu host currently) via docker from your desktop.  Xorg will close but your services will continue.  Shutdown computer from Kodi to return to Recalbox.  Shutdown computer from Recalbox to return to Xorg.

# Steps

1. cd to this directory.
2. ./install.sh (not with sudo)
3. If a RECALBOX folder pops up during install, close it.
4. Logout and back in or reboot
5. Launch Recalbox from desktop (Media/Games)

# Debugging steps

1. cd to this directory.
2. ./install-docker.sh - Install Docker and dependencies.
3. ./build-rootfs.sh - Grab and build rootfs.  There will be some rsync errors/warnings - it's OK.
4. Optional: Review docker/rootfs and build-docker-from-rootfs.sh for files that will be removed.
5. ./build-docker-from-rootfs.sh - Build docker from docker/rootfs.
6. Launch Recalbox or /usr/local/bin/recalbox-boot-stopx.sh from desktop, or close your desktop and launch /usr/local/bin/recalbox-boot.sh from tty1.


Regards,
- Jason Fisher
- jason dot fisher at gmail dot com
