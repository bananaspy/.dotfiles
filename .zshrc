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

if [[ "$PLATFORM" == 'linux' ]]; then
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
  sudo docker exec -it $name /bin/bash
}

git-delete-merged() {
  git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
}


### Misc configuration
#
#
#
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


