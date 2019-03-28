#!/bin/bash

. config

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
    wget -q --show-progress --progress=bar:force:noscroll $url
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
sudo mount -o loop,offset=$start_offset ./${filename} ./img-mount

mkdir -p docker/rootfs
sudo rsync -axHAX --info=progress2 img-mount/ docker/rootfs/

sudo umount ./img-mount
rmdir img-mount

echo $name >.release

echo "$url extracted to rootfs/"

# cleanup
rm "${filename}"
rm "${xzfilename}"
