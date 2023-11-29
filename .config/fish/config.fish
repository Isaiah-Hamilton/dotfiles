if status is-interactive
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
end
