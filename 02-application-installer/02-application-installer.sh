#!/bin/bash
# initialising variables
. ../assets/variables.sh
mkdir temp
cd temp

echo
echo "-------------------------------- Installing tools --------------------------------"
echo

tools="xclip ranger curl wget git zsh htop neofetch micro bat lolcat peco build-essential gdb nodejs npm zoxide exa resolvconf gdebi fzf"
sudo $package_manager install $tools -y

# tldr++
sudo npm install -g tldr


echo
echo "-------------------------------- Installing coding packages --------------------------------"
echo

coding="code"
sudo $package_manager install $coding -y

wget -o github-desktop.deb -q --show-progress https://github.com/shiftkey/desktop/releases/download/release-2.9.0-linux2/GitHubDesktop-linux-2.9.0-linux2.deb
sudo dpkg -i ./github-desktop.deb

# Figma
flatpak install flathub io.github.Figma_Linux.figma_linux # To install figma from flathub


echo
echo "-------------------------------- Installing office packages --------------------------------"
echo

office="teams onlyoffice-desktopeditors notion"
sudo $package_manager install $office -y

# Zoom
wget -q --show-progress https://zoom.us/client/latest/zoom_amd64.deb # Downloads the lates deb package from zoom.us
sudo dpkg -i ./zoom_amd64.deb  # To install zoom

# Mailspring
wget -O mailspring.deb -q --show-progress https://updates.getmailspring.com/download\?platform\=linuxDeb # downloading deb package from mailspring.com
sudo dpkg -i ./mailspring.deb # To install mailspring


echo
echo "-------------------------------- Installing Messengers --------------------------------"
echo

messengers="telegram-desktop"
sudo $package_manager install $messengers -y

# Discord
wget -O discord.deb -q --show-progress "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i ./discord.deb


echo
echo "-------------------------------- Installing Editing Softwares --------------------------------"
echo

editing="audacity handbrake obs-studio gimp"
dependencies="v4l2loopback-dkms ffmpeg"
sudo $package_manager install $editing $dependencies -y


echo
echo "-------------------------------- Installing Web Browsers --------------------------------"
echo

browsers="brave-browser google-chrome-stable microsoft-edge-stable"
dependencies="apt-transport-https"
sudo $package_manager install $browsers $dependencies -y


echo
echo "-------------------------------- Installing Miscellaneous --------------------------------"
echo

misc="spotify-client vlc timeshift gparted"
dependencies="libcanberra-gtk-module"
sudo $package_manager install $misc $dependencies -y

rm -rf ./temp
