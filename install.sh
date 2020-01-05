#!/bin/sh

# -- software ---------------------------------------------------------------------------

# repos
sudo add-apt-repository ppa:longsleep/golang-backports
sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt update
sudo apt upgrade

# tig
sudo apt install tig

# zsh & tools
sudo apt install zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/denysdovhan/spaceship-prompt.git \
  ~/.oh-my-zsh/themes/spaceship-prompt

ln -s ~/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme \
  ~/.oh-my-zsh/themes/spaceship.zsh-theme

git clone https://github.com/zsh-users/zsh-autosuggestions \
  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# nvim & tools
sudo apt install neovim
mkdir -p ~/.config/nvim

sudo apt install python3-pip
sudo pip3 install --user pynvim

# golang
sudo apt install golang-go


# -- links ------------------------------------------------------------------------------

ln -sfn ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sfn ~/.dotfiles/.zshrc ~/.zshrc
ln -sfn ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sfn ~/.dotfiles/init.vim ~/.config/nvim/init.vim


# -- directories ------------------------------------------------------------------------

mkdir Projects


# -- cleanup ----------------------------------------------------------------------------

chsh -s $(which zsh)
sudo chown -R $USER ../.local 
sudo apt autoremove

