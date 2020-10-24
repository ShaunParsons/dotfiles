#!/bin/bash
set -e

# Install curl and vim
sudo apt install -y zsh tmux curl vim fonts-powerline ttf-ancient-fonts

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -d "development/neovim" ]; then

    # Install nvim
    mkdir -p development
    cd development
    git clone git@github.com:neovim/neovim.git
    cd neovim
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
    make install
    cd ~

fi

# Install OhMyZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme
mv bullet-train.zsh-theme ~/.oh-my-zsh/themes/bullet-train.zsh-theme
cd .oh-my-zsh/plugins
git clone https://github.com/brymck/print-alias
cd ~

# Install TMUX plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
