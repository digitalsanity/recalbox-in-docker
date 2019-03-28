#!/bin/bash
user=$USER

. config

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

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=armhf] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable" | \
       sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install -y docker-ce
sudo docker version
sudo addgroup $user docker
sudo usermod -aG docker $user

sudo cp boot.sh /usr/local/bin/${name}-boot.sh
sudo cp boot-fromx.sh /usr/local/bin/${name}-boot-fromx.sh
sudo cp *.desktop /usr/share/applications/
