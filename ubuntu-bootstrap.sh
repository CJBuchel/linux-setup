#!/bin/sh

echo "Installing and configuring ubuntu"

read -p "Enter username e.g [cj]: " user

sudo apt-get install -y gnome-tweak-tool
sudo apt-get install -y gnome-shell-extensions

echo "Installing flat remix theme"
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo apt-get update
sudo apt-get install -y flat-remix
sudo apt-get install -y flat-remix-gtk
sudo apt-get install -y flat-remix-gnome

echo "Placing background in folder locations"
sudo cp ./neon-background.jpg /usr/share/backgrounds/neon-background.jpg
sudo cp ./icon.png /home/$user/Pictures/icon.png

# driver auto installs
echo "Installing drivers"
sudo ubuntu-drivers autoinstall
