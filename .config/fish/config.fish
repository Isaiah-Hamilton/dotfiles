# Remove welcome to fish message
set fish_greeting

# Set PATH for Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set PATH for Rust
set -x PATH $PATH "$HOME/.cargo/bin"

# Setup starship
starship init fish | source

# vim
alias vi nvim
alias vim nvim

# ls
alias ls "eza -1 --icons"
alias lsa "eza -a -1 --icons"

# git
alias lg lazygit

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# air
alias air "~/go/bin/air"

# Run fastfetch on new shell
fastfetch

# Setup zoxide
zoxide init --cmd cd fish | source
