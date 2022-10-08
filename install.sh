#!/bin/bash

# Install APT requirements.
sudo apt update
sudo apt install -y \
    bat \
    curl \
    fzf \
    lua5.3 \
    ripgrep \
    tmux \
    wget \
    zsh

# Install Pyenv.
curl https://pyenv.run | bash

# Install Rust.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install Neovim.
wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
rm nvim-linux64.deb

# Install delta.
wget https://github.com/dandavison/delta/releases/download/0.14.0/git-delta_0.14.0_amd64.deb
sudo apt install ./git-delta_0.14.0_amd64.deb
rm git-delta_0.14.0_amd64.deb

# Install Oh My ZSH!
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install zsh-autosuggestions.
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Set zsh as default shell
sudo chsh -s $(which zsh)
sudo chsh -s $(which zsh) $USER

# Install the configuration files.
cp -r \
    .config \
    .vim \
    .alacritty.yml \
    .ctags \
    .gitconfig \
    .tmux.conf \
    .tmux.conf.local \
    .vimrc \
    ~/

# Install pynvim.
zsh -c "python3 -m pip install pynvim"
