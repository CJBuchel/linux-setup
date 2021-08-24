#!/bin/sh

# # Config setup
read -p "Select operating system (Ubuntu, Pop, other) [u/p/o]: " os
read -p "Install basic libs [y/n]: " libs
read -p "Install dev lib vendors (gradle/rails etc...) [y/n]: " vendors
read -p "Install openCV? [y/n]: " cv
read -p "Using razer laptop [y/n]: " razer
read -p "Howdy? [y/n]: " howdy
read -p "Enter username e.g [cj]: " user


if [ "$libs" = "y" ]
then
	echo "Installing libs..."
	sudo apt-get update

	# Packages
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

	echo "Installing java 8/11 generic jdk/jre..."

	# java
	sudo apt-get install -y openjdk-8-jre
	sudo apt-get install -y openjdk-11-jre

	echo "Installing extra package managers..."

else
	echo "Not installing basic libs"
fi

# curl
sudo apt-get install -y curl

# snapd
sudo apt-get install -y snapd


# Vendor downloads
if [ "$vendors" = "y" ]
then
	echo "Installing vendors"
	sudo chmod +x ./general/vendor-downloads.sh
	sudo ./general/vendor-downloads.sh $user
else
	echo "Not installing vendors"
fi

# opencv
if [ "$opencv" = "y" ]
then
	echo "Getting OpenCV"
	sudo wget -qO - https://github.com/CJBuchel/CJ-Vision/blob/master/bootstrap/openCV.sh?raw=1 | bash
else
	echo "Skipping openCV install"
fi

# Howdy
if [ "$howdy" = "y" ]
then
	echo "Installing howdy"
	sudo add-apt-repository ppa:boltgolt/howdy
	sudo apt update
	sudo apt install -y howdy

	sudo apt-get install -y rpl
fi


# Razer
if [ "$razer" = "y" ]
then
	echo "Installing razer libs"
	# razer (RAZER ONLY)
	sudo apt install -y software-properties-gtk
	sudo add-apt-repository ppa:openrazer/stable
	sudo apt update
	sudo apt install -y openrazer-meta

	sudo add-apt-repository ppa:polychromatic/stable
	sudo apt update
	sudo apt install -y polychromatic

	sudo rpl -i -w "device_path = /dev/v4l/by-path/none" "device_path = /dev/video2" /usr/lib/security/howdy/config.ini

	else
	echo "Not installing razer"
	read -p "Webcam set for howdy dev/video0, dev/video1 etc.. [0/1/2/3...]: " videoNum

	sudo rpl -i -w "device_path = /dev/v4l/by-path/none" "device_path = /dev/video$videoNum" /usr/lib/security/howdy/config.ini
fi

if [ "$os" = "u" ]
then
	sudo ubuntu-drivers autoinstall
	sudo chmod +x ./_os/debian/bootstrap.sh
	sudo ./_os/debian/bootstrap.sh
fi

if [ "$os" = "p" ]
then
	sudo chmod +x ./_os/debian/bootstrap.sh
	sudo ./_os/debian/bootstrap.sh
fi

# Finalize and upgrade
sudo apt-get upgrade
sudo apt-get update

# cleanup
sudo rm -r *.deb
sudo apt-get autoremove

echo "Linux setup complete. Reboot and login using flat-remix (using the gear at the screen). Then run linux-finalize.sh to finish the final setup"
read -p "Reboot now [y/n]: " rb
if [ "$rb" = "y" ]
then
sudo reboot
fi