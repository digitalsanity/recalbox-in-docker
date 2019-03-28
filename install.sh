#!/bin/bash

./install-docker.sh
./build-rootfs.sh
./build-docker-from-rootfs.sh

echo
echo "Docker and recalbox installed."
echo

