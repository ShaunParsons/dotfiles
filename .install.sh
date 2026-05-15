#!/bin/bash
set -e

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlink dotfiles
for file in .aliases .bash_profile .bashrc .p10k.zsh .tmux.conf .vimrc .zshrc; do
    ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
done

# Install curl and vim
sudo apt install -y zsh tmux curl vim fonts-powerline ttf-ancient-fonts net-tools silversearcher-ag

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d "development/neovim" ]; then

    # Install nvim
    mkdir -p development
    cd development
    gh repo clone neovim/neovim
    cd neovim
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
    make install
    cd ~

fi

if [ ! -d ".oh-my-zsh" ]; then

    # Install OhMyZSH
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    git clone https://github.com/brymck/print-alias.git ~/.oh-my-zsh/custom/plugins/print-alias

fi

if [ ! -d ".tmux/plugins/tpm" ]; then

    # Install TMUX plugin manager and plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tmux-sensible ~/.tmux/plugins/tmux-sensible
    git clone https://github.com/seebi/tmux-colors-solarized ~/.tmux/plugins/tmux-colors-solarized

fi

# Install MesloLGS NF fonts for Powerlevel10k
mkdir -p ~/.local/share/fonts
curl -fLo ~/.local/share/fonts/"MesloLGS NF Regular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -fLo ~/.local/share/fonts/"MesloLGS NF Bold.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -fLo ~/.local/share/fonts/"MesloLGS NF Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -fLo ~/.local/share/fonts/"MesloLGS NF Bold Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -f

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $(id -un)

# Install docker-compose plugin
sudo apt install -y docker-compose-plugin

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
