# vim
alias vi="nvim"
alias vim="nvim"
export EDITOR="nvim"

# docker
alias d="docker"
alias dc="docker-compose"

# python
alias python="python3"
alias pip="pip3"

# homebrew in path
eval $(/opt/homebrew/bin/brew shellenv)

# Path to your oh-my-zsh installation.
export ZSH="./.oh-my-zsh"

ZSH_THEME="awesomepanda"

# oh-my-zsh plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# zsh-autosuggest config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source $ZSH/oh-my-zsh.sh
