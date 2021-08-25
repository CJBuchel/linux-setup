#!/bin/sh

echo "Installing and configuring os..."

# gnome tweaks
sudo apt-get install -y gnome-tweak-tool
sudo apt-get install -y gnome-shell-extensions

echo "Installing new theme..."
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo apt-get update
sudo apt-get install -y flat-remix
sudo apt-get install -y flat-remix-gtk
sudo apt-get install -y flat-remix-gnome

sudo apt-get install -y sl

echo "Setting background images"
sudo cp ./general/neon-background.jpg /usr/share/backgrounds/neon-background.jpg
sudo cp ./general/icon.png /home/$1/Pictures/icon.png

sudo cp ./_os/pop/saved_settings.dconf ./
sudo cp ./_os/pop/custom_bashrc ./

echo "Added cj icon to /home/$1/Pictures/icon.png. Set manually..."