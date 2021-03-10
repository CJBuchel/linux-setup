#!/bin.sh

echo "Installing and configuring ubuntu"

sudo apt-get install gnome-tweak-tool

echo "Installing flat remix theme"
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo apt-get update
sudo apt-get install flat-remix-gnome

# sudo gnome-tweaks


# driver auto installs
sudo ubuntu-drivers autoinstall