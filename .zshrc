  1 # Fig pre block. Keep at the top of this file.
  2 [[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
  3 # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  4 # Initialization code that may require console input (password prompts, [y/n]
  5 # confirmations, etc.) must go above this block; everything else may go below.
  6 if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  7   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  8 fi
  9
 10 # If you come from bash you might have to change your $PATH.
 11 # export PATH=$HOME/bin:/usr/local/bin:$PATH
 12
 13 # Path to your oh-my-zsh installation.
 14 export ZSH="$HOME/.oh-my-zsh"
 15
 16 # Set name of the theme to load --- if set to "random", it will
 17 # load a random theme each time oh-my-zsh is loaded, in which case,
 18 # to know which specific one was loaded, run: echo $RANDOM_THEME
 19 # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
 20 ZSH_THEME="powerlevel10k/powerlevel10k"
 21
 22 # Set list of themes to pick from when loading at random
 23 # Setting this variable when ZSH_THEME=random will cause zsh to load
 24 # a theme from this variable instead of looking in $ZSH/themes/
 25 # If set to an empty array, this variable will have no effect.
 26 # ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
 27
 28 # Uncomment the following line to use case-sensitive completion.
 29 # CASE_SENSITIVE="true"
 30
 31 # Uncomment the following line to use hyphen-insensitive completion.
 32 # Case-sensitive completion must be off. _ and - will be interchangeable.
 33 # HYPHEN_INSENSITIVE="true"
 34
 35 # Uncomment one of the following lines to change the auto-update behavior
 36 # zstyle ':omz:update' mode disabled  # disable automatic updates
 37 # zstyle ':omz:update' mode auto      # update automatically without asking
 38 # zstyle ':omz:update' mode reminder  # just remind me to update when it's time
 39
 40 # Uncomment the following line to change how often to auto-update (in days).
 41 # zstyle ':omz:update' frequency 13
 42
 43 # Uncomment the following line if pasting URLs and other text is messed up.
 44 # DISABLE_MAGIC_FUNCTIONS="true"
 45
 46 # Uncomment the following line to disable colors in ls.
 47 # DISABLE_LS_COLORS="true"
.zshrc                                                                                                                                                          1,1            Top
