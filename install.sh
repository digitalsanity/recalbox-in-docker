#!/bin/bash

. config

./build-prepare.sh
./build-rootfs.sh
./build-docker-from-rootfs.sh

# cleanup
# sudo rm -rf ./docker/rootfs
# sudo rm -rf ./rootfs-excluded

echo
echo "Docker and $name installed.  Launch $name from your Applications menu."
echo

