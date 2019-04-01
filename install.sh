#!/bin/bash

. config

./build-prepare.sh
./build-rootfs.sh
./build-docker-from-rootfs.sh

# cleanup
sudo rm -rf ./docker/rootfs
sudo rm -rf ./rootfs-excluded

echo
echo "Docker and $name installed.  Launch $name from your Applications menu."
echo

echo "To launch from a tty, logout and back in and then run $name-boot.sh"
echo
echo "To boot directly into $name: systemctl enable $name"
echo

