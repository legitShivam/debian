# initialising variables
. ../assets/variables.sh


## Installing apt-fast
echo
echo "Installing apt-fast"
echo
mkdir temp
cd temp
sudo apt-get install aria2 git wget unzip -y
wget https://github.com/ilikenwf/apt-fast/archive/master.zip
unzip master.zip
cd apt-fast-master
sudo cp apt-fast /usr/bin
sudo cp apt-fast.conf /etc
sudo cp ./man/apt-fast.8 /usr/share/man/man8
sudo gzip /usr/share/man/man8/apt-fast.8 -q
sudo cp ./man/apt-fast.conf.5 /usr/share/man/man5
sudo gzip /usr/share/man/man5/apt-fast.conf.5 -q
cd ..
cd ..
rm -rf ./temp/

echo
echo "configuring apt-fast"
echo
# apt-fast configuration
# Fast mirror for India from iit kanpur
# MIRRORS=('http://mirror.cse.iitk.ac.in/debian/')
# this will enable above and other fast mirrors
# sudo cat ./assets/apt-fast/apt-fast.conf | sudo tee /etc/apt-fast.conf

echo
echo "configuring apt non-free mirrors"
echo
# sudo sed -i s/"main"/" contrib non-free"/ /etc/apt/sources.list
# sudo sed -i s/"main"/" contrib non-free"/ /etc/apt/sources.list.d/nala-sources.list


# installing nala
echo
echo "Installing nala"
echo
# adding repositories
# installing nala
echo "deb https://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
echo "deb-src https://deb.volian.org/volian/ scar main" | sudo tee -a /etc/apt/sources.list.d/volian-archive-scar-unstable.list

sudo apt install nala-legacy -y


# installing Homebrew
echo
echo "Installing Homebrew"
echo
# installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# adding config to bashrc 
echo eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> ~/.bashrc


# installing nix-env
echo
echo "Installing nix-env"
echo
# installing nix-env
curl -L https://nixos.org/nix/install | sh
# configuring nix-env
. /home/itachi/.nix-profile/etc/profile.d/nix.sh


## Enabling snaps 
echo
echo "Enabling Snaps"
echo
sudo $package_manager install snapd -y

# Enabling Flatpaks for fedora
echo
echo "Enabling Flatpaks"
echo
sudo $package_manager install flatpak -y

# enabling flathub
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo # Enabling Flatpaks
sudo flatpak remote-modify --enable flathub


# updating packages
echo
echo "Updating packages"
echo
sudo $package_manager update 
sudo $package_manager upgrade -y
sudo $package_manager autoremove -y
sudo $package_manager autoclean
