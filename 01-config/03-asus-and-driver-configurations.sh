# initialising variables
. ../assets/variables.sh


## Asus configuration
echo 
echo "Asus configurations"
echo
# dependencies
sudo $package_manager install git libclang-dev libudev-dev -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # installing rust

# cloning the repo
git clone https://gitlab.com/asus-linux/asusctl.git
cd ./asusctl/
make && sudo make install
cd ..
rm -rf ./asusctl/
systemctl daemon-reload && systemctl restart asusd


# cloning supergfxctl repo
git clone https://gitlab.com/asus-linux/supergfxctl.git
cd ./supergfxctl/
make && sudo make install
cd ..
rm -rf ./supergfxctl/
sudo systemctl enable supergfxd.service --now # to enable asus daemon


## To install Nerd fonts
echo
echo "Installing Nerd Fonts"
echo
# https://www.nerdfonts.com/


sudo cp ./assets/fonts/* ~/.local/share/fonts/





# ## To install proprietory nvidia gpu drivers
# echo
# echo "Installing Nvidia GPU Drivers"
# echo
# # https://rpmfusion.org/Howto/NVIDIA


# sudo dnf install akmod-nvidia -y
# sudo dnf install xorg-x11-drv-nvidia-cuda -y #optional for cuda/nvdec/nvenc support
# sudo systemctl enable nvidia-hibernate.service nvidia-suspend.service nvidia-resume.service # To start the nvidia services
