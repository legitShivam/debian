# initialising variables
. ../assets/variables.sh

# Dependencies: resolvconf for changing dns permanantly(simply changing dns like we do in windows)
dependencies="resolvconf"

# Installing resolvconf using defined package_manager
sudo $package_manager install $tools -y 


# Starting the resolvconf service
sudo systemctl enable resolvconf.service
sudo systemctl start resolvconf.service


# configuring resolvconf
sudo cat ./assets/resolvconf/head | sudo tee /etc/resolvconf/resolv.conf.d/head 


# Updating resolvconf
sudo resolvconf --enable-updates
sudo resolvconf -u