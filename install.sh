#!/bin/bash

./install-docker.sh
./build-rootfs.sh
./build-docker-from-rootfs.sh

# cleanup
sudo rm -rf ./docker/rootfs
sudo rm -rf ./rootfs-excluded

echo
echo "Docker and recalbox installed.  Reboot and launch via desktop."
echo

