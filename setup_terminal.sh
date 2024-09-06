#!/bin/bash

# Update and upgrade packages
sudo apt update && sudo apt upgrade -y && sudo apt install -y zsh

# Check Zsh installation and set as default shell
zsh --version
chsh -s $(which zsh)
echo $SHELL

# Install Starship prompt
curl -sS https://starship.rs/install.sh | sh

# Create necessary config directories if not present
[ ! -d ~/.config ] && mkdir ~/.config
cp starship.toml ~/.config/starship.toml
cp .zshrc ~/.zshrc

# Download and unzip fonts
sudo apt install -y unzip
[ ! -d ~/.local/share/fonts ] && mkdir -p ~/.local/share/fonts
unzip fonts.zip -d ~/.local/share/fonts
sudo fc-cache -fv

# Install additional utilities
sudo apt install -y neofetch htop btop git aria2 curl
sudo snap install speedtest

echo "Installation complete. Please reboot your system."
