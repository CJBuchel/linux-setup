#!/bin/sh

read -p "Have you booted into flat-remix? [y/n]: " flat

if [ "$flat" = "y" ]
then

read -p "enter username e.g [cj]: " user

# Load visual config
echo "Setting flat-remix themes"

sudo dconf load / < saved_settings.dconf
echo "Setting terminal theme"
sudo cat custom_bashrc > /home/cj/.bashrc

# echo "Run `dconf load / < saved_settings.dconf` and `cat ./custom_bashrc > ~/.bashrc` to finish terminal setup"
# echo "Setup complete, run `sudo howdy add {name}` to add user face"

echo "Adding face to howdy..."
sudo howdy add

else
echo "Please boot into flat-remix then run again"
fi