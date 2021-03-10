#!/bin/sh

# gradle
sdk install gradle 6.8

gradle -v

# Ruby on rails
# Adding Node.js repository
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
# Adding Yarn repository
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo add-apt-repository -y --force-yes ppa:chris-lea/redis-server
# Refresh our packages list with the new repositories
sudo apt-get update
# Install our dependencies for compiiling Ruby along with Node.js and Yarn
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev dirmngr gnupg apt-transport-https ca-certificates redis-server redis-tools nodejs yarn
sudo apt-get install -y libmysqlclient-dev



# Install rbenv
echo "Installing rbenv"
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
git clone https://github.com/rbenv/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars
# exec $SHELL
echo "Installing ruby"
rbenv install 3.0.0
rbenv global 3.0.0
ruby -v


echo "Installing bundler"
# This installs the latest Bundler, currently 2.x.
gem install bundler

# Test and make sure bundler is installed correctly, you should see a version number.
bundle -v
# Bundler version 2.0

echo "Installing mysql"
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev



# opencv
echo "Getting OpenCV"
sudo wget -qO - https://github.com/CJBuchel/CJ-Vision/blob/2.0/bootstrap/openCV.sh?raw=1 | bash

sudo apt-get install -y gdebi

# howdy (windows hello look alike)
sudo add-apt-repository --force-yes ppa:boltgolt/howdy
sudo apt update
sudo apt install -y howdy

read -p "Using a razer laptop? [y/n]" razer
if [ "$razer" = "y" ]
then
echo "Installing razer libs"
# razer (RAZER ONLY)
sudo apt install -y software-properties-gtk
sudo add-apt-repository --force-yes ppa:openrazer/stable
sudo apt update
sudo apt install -y openrazer-meta

sudo add-apt-repository --force-yes ppa:polychromatic/stable
sudo apt update
sudo apt install -y polychromatic
else
echo "Not installing razer"
fi

# Chrome
echo "Installing chrome"
cd ~/downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install -y ./google-chrome-stable_current_amd64.deb

# vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

echo "Upgrading apts"
sudo apt upgrade


echo "Vendor downloads finished"
