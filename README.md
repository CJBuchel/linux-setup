# Linux setup

## THIS IS A DEBIAN BASED SETUP ONLY. 
### Supporting ubuntu and pop os explicitly (may download on other debian based os's)

### Clone the project, then run `sudo chmod +x linux-setup.sh` then run `./linux-setup.sh`

### After setup/reboot, boot into flat-remix and run `./linux-finalize` to finish setup and the rest of the installs (may need to run `chmod` for this file as well)
### Note, you do not use sudo in this command. The bashrc is a user preference. Not a root preference

### After the final setup, run `dconf load / < saved_settings.dconf; cat ./custom_bashrc > ~/.bashrc` for new terminal theme.
