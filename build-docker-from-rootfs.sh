#!/bin/bash

. config

echo "Removing files that break things .."

mkdir -p rootfs-excluded

sudo mv docker/rootfs/etc/init.d/S*mountboot rootfs-excluded/
sudo mv docker/rootfs/etc/init.d/S*network rootfs-excluded/
sudo mv docker/rootfs/etc/init.d/S*connman rootfs-excluded/
sudo mv docker/rootfs/etc/init.d/S*wifi rootfs-excluded/
sudo mv docker/rootfs/etc/init.d/S11share rootfs-excluded/
sudo mv docker/rootfs/etc/init.d/S*upgrade rootfs-excluded/
sudo mv docker/rootfs/etc/init.d/S*bluetooth rootfs-excluded/
sudo mv docker/rootfs/lost+found rootfs-excluded/
sudo rm -rf docker/rootfs/dev/*

sudo cp config docker/rootfs/.docker-config

echo "Building docker/Dockerfile for $name from rootfs.."


# sudo not needed here?
sudo docker build -t $name-launcher/$name-launcher:local docker

