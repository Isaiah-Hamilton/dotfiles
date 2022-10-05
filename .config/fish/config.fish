if status is-interactive
    # Set PATH for Homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Setup starship
    starship init fish | source
end