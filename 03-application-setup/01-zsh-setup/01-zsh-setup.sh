#!/bin/bash
# Initialising variables
. ../../assets/variables.sh

dependencies=(git zsh)
sudo $package_manager install $dependencies -y # installing zsh and git

# installing ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
