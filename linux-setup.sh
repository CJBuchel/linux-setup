#!/bin.sh

sudo apt-get update

# packages
sudo apt-get install -y avahi-daemon libnss-mdns v4l-utils imagemagick
sudo apt-get install -y build-essential cmake cmake-curses-gui pkg-config
sudo apt-get install -y libjpeg-dev libtiff5-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libeigen3-dev libxvidcore-dev libx264-dev libgtk2.0-dev
sudo apt-get install -y libv4l-dev v4l-utils
sudo modprobe bcm2835-v4l2
sudo apt-get install -y libatlas-base-dev gfortran

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install -y python3.6

sudo apt-get install -y clang

# git
sudo apt-get install git

# java
sudo apt-get install -y openjdk-8-jre
sudo apt-get install -y openjdk-11-jre

# curl
sudo apt-get install -y curl

# sdkman
curl -s "https://get.sdkman.io" | bash
source "/home/cj/.sdkman/bin/sdkman-init.sh"

# gradle
sdk install gradle 6.8

gradle -v

# opencv
sudo wget -qO - https://github.com/CJBuchel/CJ-Vision/blob/2.0/bootstrap/openCV.sh?raw=1 | bash

sudo apt-get install -y gdebi

# howdy (windows hello look alike)
sudo add-apt-repository ppa:boltgolt/howdy
sudo apt update
sudo apt install -y howdy

# razer (RAZER ONLY)
sudo apt install -y software-properties-gtk
sudo add-apt-repository ppa:openrazer/stable
sudo apt update
sudo apt install openrazer-meta

sudo add-apt-repository ppa:polychromatic/stable
sudo apt update
sudo apt install polychromatic


