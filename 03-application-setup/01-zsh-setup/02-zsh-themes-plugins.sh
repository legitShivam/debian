#!/bin/bash

# p10k theme for ohymyzsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sudo sed -i 's\ZSH_THEME="robbyrussell"\ZSH_THEME="powerlevel10k/powerlevel10k"\g' ~/.zshrc


## Installing plugins

# Zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# Modifying the config  files
sudo cat ./assets/.p10k.zsh.conf | sudo tee ~/.p10k.zsh
sudo cat ./assets/.zshrc.conf | sudo tee ~/.zshrc


# Rebooting zsh
source ~/.zshrc
