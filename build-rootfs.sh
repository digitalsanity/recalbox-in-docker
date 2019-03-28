#!/bin/bash

url="https://github.com/mrfixit2001/recalbox_rockpro64/releases/download/190222/recalbox_rockpro64_190222.img.xz"

xzfilename="${url##*/}"
filename=`basename ${xzfilename} .xz`

if [ -e "${xzfilename}" ]
then
  echo "Already have the image file: $xzfilename"
else
  if [ -e "${filename}" ]
  then
    echo "$filename exists.  Not downloading $url."
  else
    echo "Retrieving $url .."
    wget $url
  fi
fi

if [ -e "${filename}" ]
then
  echo "Already extracted to: $filename"
else
  echo "Extracting $filename .."
  xz -d "${xzfilename}"
fi

declare -i start_sector
start_sector=$(/sbin/fdisk -l ./${filename} | awk -F" "  '{ print $3 }' | tail -n1)
(( start_offset = $start_sector * 512 ))

mkdir -p img-mount
(sudo umount img-mount || /bin/true)
sleep 3
sudo mount -o loop,offset=$start_offset ./${filename} ./img-mount

mkdir -p docker/rootfs
sudo rsync -avxHAX --progress img-mount/ docker/rootfs/

sudo umount ./img-mount
rmdir img-mount

echo "$url extracted to rootfs/"

# cleanup
rm "${filename}"
rm "${xzfilename}"
