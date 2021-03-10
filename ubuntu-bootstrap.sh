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

# Load visual config
echo "Setting flat-remix themes"
sudo cp ./neon-background.jpg /usr/share/backgrounds/neon-background.jpg
sudo cp ./icon.png ~/Pictures/icon.png
dconf load / < saved_settings.dconf
echo "Setting terminal theme"
cat ./custom_bashrc > ~/.bashrc


# BACKGROUND = "file:///home/$user/Pictures/neon-background.jpg"
# gsettings set org.gnome.desktop.background picture-uri $BACKGROUND


# driver auto installs
echo "Installing drivers"
sudo ubuntu-drivers autoinstall
