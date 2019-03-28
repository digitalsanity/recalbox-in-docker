echo "Removing files that break things .."

mkdir -p rootfs-excluded

mv docker/rootfs/etc/init.d/S*mountboot rootfs-excluded/
mv docker/rootfs/etc/init.d/S*network rootfs-excluded/
mv docker/rootfs/etc/init.d/S*connman rootfs-excluded/
mv docker/rootfs/etc/init.d/S*wifi rootfs-excluded/
mv docker/rootfs/etc/init.d/S11share rootfs-excluded/
mv docker/rootfs/etc/init.d/S*upgrade rootfs-excluded/
mv docker/rootfs/etc/init.d/S*bluetooth rootfs-excluded/
mv docker/rootfs/lost+found rootfs-excluded/

echo "Building docker/Dockerfile from rootfs.."

sudo docker build -t recalbox/recalbox:master docker
