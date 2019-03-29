#!/bin/bash
user=$USER

. config

# Determine OS platform
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" == "linux" ]; then
    # If available, use LSB to identify distribution
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
        export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
    # Otherwise, use release info file
    else
        export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
    fi
    array=( $DISTRO )
    export DISTRO=${array[0]}
fi

# For everything else (or if above failed), just use generic identifier
[ "$DISTRO" == "" ] && export DISTRO=$UNAME
[ "$DISTROID" == "" ] && export DISTROID=$(echo $DISTRO | tr "[:upper:]" "[:lower:]")

# Determine arch
ARCH=`dpkg --print-architecture`


unset UNAME

echo
echo "* Build container for latest $name from $release_owner/$release"

while true; do
    echo
    echo "Please review that you have all required kernel modules for docker:"
    echo
    sleep 5
    curl -fsSL https://raw.githubusercontent.com/moby/moby/master/contrib/check-config.sh | bash | more
    read -p "Do you wish to continue installing docker? [yn] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo apt install -y \
       apt-transport-https \
       ca-certificates \
       curl \
       gnupg \
       gpgv \
       kbd \
       wget \
       screen

curl -fsSL https://download.docker.com/linux/${DISTROID}/gpg | sudo apt-key add -
echo "deb [arch=${ARCH}] https://download.docker.com/linux/${DISTROID} \
       $(lsb_release -cs) stable" | \
       sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install -y docker-ce
# sudo apt install -y docker.io
sudo docker version
sudo addgroup $user docker
sudo usermod -aG docker $user

sudo cp boot.sh /usr/local/bin/${name}-boot.sh
sudo cp boot-fromx.sh /usr/local/bin/${name}-boot-fromx.sh
sudo cp *.desktop /usr/share/applications/
