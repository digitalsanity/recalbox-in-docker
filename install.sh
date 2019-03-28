#!/bin/bash

./install-docker.sh
./build-rootfs.sh
./build-docker-from-rootfs.sh

# cleanup
rm -rf docker/rootfs

echo
echo "Docker and recalbox installed."
echo

