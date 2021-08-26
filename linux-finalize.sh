#!/bin/sh


read -p "enter username e.g [cj]: " user

# Load visual config
echo "Setting flat-remix themes"
dconf load / < saved_settings.dconf
echo "Setting terminal theme"
cat custom_bashrc > /home/$user/.bashrc

# echo "Run `dconf load / < saved_settings.dconf` and `cat ./custom_bashrc > ~/.bashrc` to finish terminal setup"
# echo "Setup complete, run `sudo howdy add {name}` to add user face"

echo "Adding face to howdy..."
sudo howdy add

rm -r saved_settings.dconf
rm -r custom_bashrc

# sudo reboot
