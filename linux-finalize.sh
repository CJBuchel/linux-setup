#!/bin/sh

read -p "Have you booted into flat-remix? [y/n]: " flat

if [ "$flat" = "y" ]
then

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

# Load visual config
echo "Setting flat-remix themes"
dconf load / < saved_settings.dconf
echo "Setting terminal theme"
cat ./custom_bashrc > ~/.bashrc

echo "Setup complete, run `sudo howdy add {name}` to add user face"

else
echo "Please boot into flat-remix then run again"
fi