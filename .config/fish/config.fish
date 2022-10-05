if status is-interactive
  # vim
  alias vi="nvim"
  alias vim="nvim"

  # python
  alias python="python3"
  alias pip="pip3"

  # Set PATH for Homebrew
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # Setup starship
  starship init fish | source
end
