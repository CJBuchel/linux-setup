#!/bin.sh

echo "Installing and configuring ubuntu"

read -p "Enter username e.g [cj]: " user

sudo apt-get install -y gnome-tweak-tool
sudo apt-get install -y gnome-shell-extensions

echo "Installing flat remix theme"
sudo add-apt-repository --force-yes ppa:daniruiz/flat-remix
sudo apt-get update
sudo apt-get install -y flat-remix
sudo apt-get install -y flat-remix-gtk
sudo apt-get install -y flat-remix-gnome

# Load visual config
echo "Setting terminal theme"
cat ./custom_bashrc > ~/.bashrc

echo "Setting flat-remix themes"
sudo cp saved_settings.conf ~/
cd ~/
dconf load / < saved_settings.dconf

sudo cp ./neon-background.jpg ~/Pictures/neon-background.jpg
sudo cp ./icon.png ~/Pictures/icon.png
BACKGROUND = file:///home/$user/Pictures/neon-background.jpg
gsettings set org.gnome.desktop.background picture-uri $BACKGROUND



# driver auto installs
sudo ubuntu-drivers autoinstall