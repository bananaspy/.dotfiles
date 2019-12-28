#!/bin/sh

# -- software ---------------------------------------------------------------------------

# repos
add-apt-repository ppa:longsleep/golang-backports

apt update
apt upgrade

# tig
apt install tig

# oh-my-zsh & tools
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/denysdovhan/spaceship-prompt.git \
  "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
  "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# nvim & tools
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user pynvim

# tmux
apt install tmux

# golang
apt install golang-go


# -- links ------------------------------------------------------------------------------

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim


# -- directories ------------------------------------------------------------------------

mkdir -p ~/Projects/go
mkdir -p ~/Projects/go/src
mkdir -p ~/Projects/go/bin


