# Remove welcome to fish message
set fish_greeting

# Set PATH for Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setup starship
starship init fish | source

# vim
alias vi nvim
alias vim nvim

# ls
alias ls exa

# git
alias lg lazygit

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Run neofetch on new shell
neofetch
