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
  packages=($(cat ./install/brew.txt |gum choose --no-limit --header="Packages:"))

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
  apps=($(cat ./install/apps.txt |gum choose --no-limit --header="Apps:"))

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
  fonts=($(cat ./install/fonts.txt |gum choose --no-limit --header="Fonts:"))

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

# OS Configuration

bot "OS configuration"
echo -n "do you want to update the system configurations? [y|n]: "
read -r response
if [[ -z $response || $response =~ ^(n|no|N) ]]; then
  open /Applications/WezTerm.app
  bot "All done"
  exit
fi

bot "Configuring General System UI/UX..."

running "closing any system preferences to prevent issues with automated changes"
osascript -e 'tell application "System Preferences" to quit'
ok

# Security

# Based on:
# https://github.com/drduh/macOS-Security-and-Privacy-Guide
# https://benchmarks.cisecurity.org/tools2/osx/CIS_Apple_OSX_10.12_Benchmark_v1.0.0.pdf

# Enable firewall. Possible values:
#   0 = off
#   1 = on for specific sevices
#   2 = on for essential services
running "enable firewall"
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
ok

# Source: https://support.apple.com/guide/mac-help/use-stealth-mode-to-keep-your-mac-more-secure-mh17133/mac
running "enable firewall stealth mode" # (no response to ICMP / ping requests)
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1
ok

running "disable password hints"
sudo defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 0
ok

running "disable guest account login"
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false
ok

running "disable the \“Are you sure you want to open this application?\” dialog"
sudo defaults write com.apple.LaunchServices LSQuarantine -bool false
ok

running "hide hard drive icon on the desktop"
sudo defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
ok

running "hide server icon on the desktop"
sudo defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
ok

running "hide removable media on the desktop"
sudo defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
sudo defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
ok

running "disable the Launchpad gesture"
sudo defaults write com.apple.dock showLaunchpadGestureEnabled -int 0
ok

running "boot in verbose mode"
sudo nvram boot-args="-v"
ok

running "disable the sound effects on boot"
sudo nvram SystemAudioVolume=" "
ok

running "check for software updates daily"
sudo defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
ok

running "disable smart quotes"
sudo defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
ok

running "disable smart dashes as they’re annoying when typing code"
sudo defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
ok

running "enable tap to click"
sudo defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
sudo defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
sudo defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
ok

running "enable full keyboard access" # (e.g. enable Tab in modal dialogs)
sudo defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
ok

running "disable press-and-hold for keys"
sudo defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
ok

running "require password immediately after sleep or screen saver begins"
sudo defaults write com.apple.screensaver askForPassword -int 1
sudo defaults write com.apple.screensaver askForPasswordDelay -int 0
ok

running "save screenshots to the desktop"
sudo defaults write com.apple.screencapture location -string "${HOME}/Desktop"
ok

running "save screenshots in PNG format" # (other options: BMP, GIF, JPG, PDF, TIFF)
sudo defaults write com.apple.screencapture type -string "png"
ok

running "keep folders on top when sorting by name" # (version 10.12 and later)
sudo defaults write com.apple.finder _FXSortFoldersFirst -bool true
ok

running "set Home as the default location for new Finder windows"
# For other paths, use 'PfLo' and 'file:///full/path/here/'
sudo defaults write com.apple.finder NewWindowTarget -string "PfLo"
sudo defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
ok

running "show filename extensions"
sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true
ok

running "disable the warning when changing a file extension"
sudo defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
ok

running "disable the warning before emptying the trash"
sduo defaults write com.apple.finder WarnOnEmptyTrash -bool false
ok

running "empty trash securely by default"
sudo defaults write com.apple.finder EmptyTrashSecurely -bool true
ok

running "change minimize/maximize window effect to scale"
sudo defaults write com.apple.dock mineffect -string "scale"
ok

running "minimize windows into their application’s icon"
sudo defaults write com.apple.dock minimize-to-application -bool true
ok

running "show indicator lights for open applications in the Dock"
sudo defaults write com.apple.dock show-process-indicators -bool true
ok

running "speed up Mission Control animations"
sudo defaults write com.apple.dock expose-animation-duration -float 0.1
ok

running "automatically hide and show the Dock"
sudo defaults write com.apple.dock autohide -bool true
ok

# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen

running "top left screen corner → lock screen"
sudo defaults write com.apple.dock wvous-tl-corner -int 13
sudo defaults write com.apple.dock wvous-tl-modifier -int 0
ok

running "copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
ok

running "add the keyboard shortcut ⌘ + Enter to send an email in mail.app"
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"
ok

# Possible values:
# 1: Very often (1 sec)
# 2: Often (2 sec)
# 5: Normally (5 sec)

running "update refresh frequency in activity monitor"
sudo defaults write com.apple.ActivityMonitor UpdatePeriod -int 2
ok

running "update and cleanup homebrew"
brew update &> /dev/null
brew upgrade &> /dev/null
brew cleanup &> /dev/null
ok

bot "All done!"

bot "Note that some of these changes require a logout/restart to take effect."

echo -n "Would you like to reboot your system? [y|n]: "
read -r response
if [[ $response =~ ^(y|yes|Y) ]]; then
  reboot
fi
