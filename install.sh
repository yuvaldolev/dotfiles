#!/bin/bash

# Install APT requirements.
sudo apt update
sudo apt install -y \
    bat \
    curl \
    fzf \
    ripgrep \
    tmux \
    wget \
    zsh

# Install TMUX configuration.
cp .tmux.conf .tmux.conf.local ~/

# Install Oh My ZSH!
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install zsh-autosuggestions.
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zshrc.
cp .zshrc ~/

# # Set zsh as default shell
sudo chsh -s $(which zsh)
sudo chsh -s $(which zsh) $USER

# Install Neovim.
wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
rm nvim-linux64.deb

# Install git configuration.
cp .gitconfig ~/

# Install delta.
wget https://github.com/dandavison/delta/releases/download/0.14.0/git-delta_0.14.0_amd64.deb
sudo apt install ./git-delta_0.14.0_amd64.deb
rm git-delta_0.14.0_amd64.deb
