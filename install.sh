#!/bin/zsh

# Colors
ESC_SEQ="\033["
COLOR_RESET="${ESC_SEQ}39;49;00m"
COLOR_RED="${ESC_SEQ}31;01m"
COLOR_GREEN="${ESC_SEQ}32;01m"
COLOR_YELLOW="${ESC_SEQ}33;01m"

function ok() {
  echo "${COLOR_GREEN}[ok]${COLOR_RESET} $1"
}

function bot() {
  echo "\n${COLOR_GREEN}[o_o]${COLOR_RESET} - $1"
}

function running() {
  echo -n "${COLOR_YELLOW} ⇒ ${COLOR_RESET}$1: "
}

function action() {
  echo "\n${COLOR_YELLOW}[action]:${COLOR_RESET}\n ⇒ $1..."
}

function warn() {
  echo "${COLOR_YELLOW}[warning]${COLOR_RESET} $1"
}

function error() {
  echo "${COLOR_RED}[error]${COLOR_RESET} $1"
}

function print_error() {
  printf " [✖] %s\n" "$1"
}

function print_success() {
  printf " [✔] %s\n" "$1"
}

function print_result() {
  if [ "$1" -eq 0 ]; then
    print_success "$2"
  else
    print_error "$2"
  fi
  return "$1"
}

bot "Hi! I'm going to install tooling and tweak your system settings. Here I go..."

# Install non-brew various tools (PRE-BREW Installs)
running "checking XCode Command Line Tools"
if ! xcode-select --print-path &> /dev/null; then
  action "installing XCode Command Line Tools"

  # Prompt user to install the XCode Command Line Tools
  xcode-select --install &> /dev/null

  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  print_result $? "xcode command line tools installed"

  # Prompt user to agree to the terms of the Xcode license
  # https://github.com/alrra/dotfiles/issues/10
  sudo xcodebuild -license
  print_result $? "agreed to the xcode command line tools licence"
else
  ok
fi

# Install Dotfiles
running "installing dotfiles"
git clone https://github.com/isaiah-hamilton/dotfiles.git &> /dev/null
ok

# Install homebrew
running "checking homebrew"
brew_bin=$(which brew) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
  action "installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ $? != 0 ]]; then
    error "unable to install homebrew, script $0 abort!"
    exit 2
  fi

  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$(whoami)/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  brew analytics off
  print_result $? "homebrew installed"
else
  ok
  bot "Homebrew"
  echo -n "run brew update && upgrade? [y|n]: "
  read -r response
  if [[ $response =~ (y|yes|Y) ]]; then
    brew update
    print_result $? "homebrew updated"
    brew upgrade
    print_result $? "brews upgraded"
  else
    print_result $? "skipped brew package upgrades."
  fi
fi

echo -n "would you like to install packages with brew? [y|n]: "
read -r response
if [[ $response =~ (y|yes|Y) ]]; then
  brew install gum &> /dev/null
  packages=($(cat ~/dotfiles/install/brew.txt |gum choose --no-limit --header="Packages:"))

  for package in "${packages[@]}"; do
    running "brew install $package"
    brew install "$package" &> /dev/null

    if brew list --formula "$package" &> /dev/null; then
      ok
    else
      error
      errorPackages+=("$package")
    fi
  done
fi

if [ ${#errorPackages[@]} -gt 0 ]; then
  echo "the following packages failed to install:"
  for errorPackage in "${errorPackages[@]}"; do
    echo "$errorPackage"
  done
elif [[ $response =~ (y|yes|Y) ]]; then
  echo "all packages installed successfully."
fi

echo -n "install apps? [y|n]: "
read -r response
if [[ $response =~ (y|yes|Y) ]]; then
  brew install gum &> /dev/null
  apps=($(cat ~/dotfiles/install/apps.txt |gum choose --no-limit --header="Apps:"))

  for app in "${apps[@]}"; do
    running "brew install --cask $app"
    brew install --cask "$app" &> /dev/null

    if brew list --cask "$app" &> /dev/null; then
      ok
    else
      error
      errorApps+=("$app")
    fi
  done
fi

if [ ${#errorApps[@]} -gt 0 ]; then
  echo "the following apps failed to install:"
  for errorApp in "${errorApps[@]}"; do
    echo "$errorApp"
  done
elif [[ $response =~ (y|yes|Y) ]]; then
  echo "all apps installed successfully."
fi

echo -n "install fonts? [y|n]: "
read -r response
if [[ $response =~ (y|yes|Y) ]]; then
  brew install gum &> /dev/null
  fonts=($(cat ~/dotfiles/install/fonts.txt |gum choose --no-limit --header="Fonts:"))

  for font in "${fonts[@]}"; do
    running "brew install --cask $font"
    brew install --cask "$font" &> /dev/null

    if brew list --cask "$font" &> /dev/null; then
      ok
    else
      error
      errorFonts+=("$font")
    fi
  done
fi

if [ ${#errorFonts[@]} -gt 0 ]; then
  echo "the following fonts failed to install:"
  for errorFonts in "${errorFonts[@]}"; do
    echo "$errorFonts"
  done
elif [[ $response =~ (y|yes|Y) ]]; then
  echo "all fonts installed successfully."
fi

echo

# Just to avoid a potential bug
mkdir -p ~/Library/Caches/Homebrew/Formula
brew doctor

bot "Dotfiles Setup"
echo -n "would you like to link ./dotfiles/* to ~/ with GNU stow?  [y|n]: "
read -r response
if [[ $response =~ (y|yes|Y) ]]; then
  running "installing GNU stow"
  brew install stow &> /dev/null
  ok

  running "running GNU stow"
  stow .
  ok
fi

# Setup Fish shell
running "set fish shell as default shell"
which fish | sudo tee -a /etc/shells
chsh -s "$(which fish)"
ok

running "update and cleanup homebrew"
brew update &> /dev/null
brew upgrade &> /dev/null
brew cleanup &> /dev/null
ok

bot "Note that some of these changes require a logout/restart to take effect."

echo -n "Would you like to reboot your system? [y|n]: "
read -r response
if [[ $response =~ ^(y|yes|Y) ]]; then
  reboot
else
  bot "All done"
  open /Applications/WezTerm.app
  exit
fi
