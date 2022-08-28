#!/bin/bash
# initialising variables
. ../assets/variables.sh
mkdir temp
cd temp

echo 
echo "Adding coding repos"
echo 



# VS Code
# Adding vs code repo
curl -sSL https://packages.microsoft.com/keys/microsoft.asc -o microsoft.asc
gpg --no-default-keyring --keyring ./ms_vscode_key_temp.gpg --import ./microsoft.asc
gpg --no-default-keyring --keyring ./ms_vscode_key_temp.gpg --export > ./ms_vscode_key.gpg
sudo mv ms_vscode_key.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list



## Office

# onyoffice
mkdir -p ~/.gnupg
chmod 700 ~/.gnupg
gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
chmod 644 /tmp/onlyoffice.gpg
sudo chown root:root /tmp/onlyoffice.gpg
sudo mv /tmp/onlyoffice.gpg /etc/apt/trusted.gpg.d/

# Teams
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'

echo 'deb https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list



## Web Browser

# Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Google Chrome
wget -qO - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/googlechrome-linux-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/googlechrome-linux-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

# MS Edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-stable.list'

## Misc


# Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5E3C45D7B312C643
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list deb http://repository.spotify.com stable non-free


# Removing duplicate repositories
wget -q --show-progress https://github.com/davidfoerster/aptsources-cleanup/releases/download/v0.1.7.5.2/aptsources-cleanup.pyz
chmod a+x aptsources-cleanup.pyz
sudo ./aptsources-cleanup.pyz -y

cd ..
rm -rf ./temp/
sudo $package_manager update # To refresh the cache
