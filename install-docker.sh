#!/bin/bash
user=$USER

echo "Installing docker and adding $USER to docker group.  Reboot or logout afterwards to apply permissions to your accout."

while true; do
    echo
    echo "Please review that you have all required kernel modules for docker:"
    echo
    sleep 2
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
       screen

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=armhf] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable" | \
       sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install -y docker-ce
sudo docker version
sudo addgroup $user docker
sudo usermod -aG docker rock

echo "Please reboot or logout/login before running any containers."

echo "These commands will launch your container after it is built:"
sudo cp *-boot*.sh /usr/local/bin/
sudo cp *.desktop /usr/share/applications/
ls /usr/local/bin/*-boot*.sh
