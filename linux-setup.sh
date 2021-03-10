#!/bin/sh

# Basic libs
read -p "Install basic libs [y/n]: " libs
if [ "$libs" = "y" ]
then
echo "Installing libs"
sudo apt-get update

# packages
sudo apt install -y software-properties-common apt-transport-https wget
sudo apt-get install -y avahi-daemon libnss-mdns v4l-utils imagemagick
sudo apt-get install -y build-essential cmake cmake-curses-gui pkg-config
sudo apt-get install -y libjpeg-dev libtiff5-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libeigen3-dev libxvidcore-dev libx264-dev libgtk2.0-dev
sudo apt-get install -y libv4l-dev v4l-utils
sudo modprobe bcm2835-v4l2
sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y net-tools
sudo apt-get install -y vim

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install -y python3.6

sudo apt-get install -y clang

# java
sudo apt-get install -y openjdk-8-jre
sudo apt-get install -y openjdk-11-jre

# curl
sudo apt-get install -y curl

# snapd
sudo apt-get install -y snapd

# sdkman
curl -s "https://get.sdkman.io" | bash
source "/home/cj/.sdkman/bin/sdkman-init.sh"
else
echo "Not installing basic libs"
fi


# Ubuntu Bootstrap
read -p "Using ubuntu [y/n]: " usingUbuntu
if [ "$usingUbuntu" = "y" ]
then
echo "Using Ubuntu"
sudo chmod +x ubuntu-bootstrap.sh
sudo ./ubuntu-bootstrap.sh
else
echo "Not using Ubuntu"
fi


# Vendor installs
read -p "Install vendor libraries and dev software? (vscode, chrome, ruby on rails etc...) [y/n]: " vendors
if [ "$vendors" = "y" ]
then
echo "Installing Vendors"
sudo chmod +x vendor-downloads.sh
sudo ./vendor-downloads.sh
else
echo "Not installing vendors"
fi

echo "Linux setup complete. Use 'sudo howdy add cj' to add face"
echo "You might also need to switch to flat-remix in login screen"

read -p "Reboot now [y/n]: " reboot
if [ "$reboot" = "y" ]
then
sudo reboot
else
echo "Please reboot later and login using flat-remix"
fi
