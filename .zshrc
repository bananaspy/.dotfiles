PLATFORM='unknown'
UNAMESTR=`uname`

if [[ "$UNAMESTR" == 'Darwin' ]]; then
  PLATFORM='osx'
else
  PLATFORM='linux'
fi


# ZSH
export ZSH=~/.oh-my-zsh

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

ZSH_THEME="spaceship"

plugins=(
common-aliases
zsh-autosuggestions
git
vi-mode
z
)

source $ZSH/oh-my-zsh.sh


# ENV
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/go/bin:~/go/bin
export EDITOR="vim"
export PRJ=~/Projects
export DWL=~/Downloads
#
# nvm
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
# Manually set language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Key bindings
bindkey '^O' autosuggest-accept

# Aliases

if [ $PLATFORM = 'linux' ]; then
  alias pbcopy="xclip -selection clipboard"
fi

alias zshrc="vim ~/.dotfiles/.zshrc && zshrc-apply"
alias vimrc="vim ~/.dotfiles/init.vim"
alias tmuxrc="vim ~/.dotfiles/.tmux.conf"
alias gcd="git checkout dev"
alias vim="nvim"
alias python=python3
alias gotest='go test -v ./...'

# SJ
#
alias frd='yarn && yarn start:desktop --auto-reload-disabled'
alias frm='yarn && yarn start:mobile --auto-reload-disabled'

alias inflate='ruby -r zlib -e "STDOUT.write Zlib::Inflate.inflate(STDIN.read)"'

# Utility functions

tmx() {
  tmux new -s ${1:=default}
}

tmxa() {
  tmux attach-session -t ${1:=default}
}

zshrc-apply() {
  printf "%s " "Apply new zsh config? (y/n)"
  read ans
  case "$ans" in
    y|Y ) source ~/.zshrc;;
    n|N ) echo New config not currently applied;;
    * ) echo Unknown input;;
  esac
}

docker-ssh() {
  if (( $# == 0 ))
  then
    echo "USAGE: docker_ssh <container name | container id>"
    return
  fi
  name=$1
  echo "Connecting to $name"
  docker exec -it $name /bin/sh
}

docker-logs() {
  if (( $# == 0 ))
  then
    echo "USAGE: docker-logs <container name | container id>"
    return
  fi
  name=$1
  echo "Attaching to log output of $name"
  docker container logs -f $name
}

docker-clean() {
  docker system prune -a
}

docker-stop() {
  docker stop $(docker ps -qa)
}

export GOPATH=/home/staxval/go
export GO111MODULE=on
export GOPRIVATE="github.com/staxval"

git-delete-merged() {
  git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
}

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/go/bin:/home/staxval/go/bin

