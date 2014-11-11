#!/bin/bash

which -s brew
if [[ $? != 0 ]] ; then
  echo "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
fi

echo "Updating Homebrew"
brew update

echo "Installing apps..."
brew install caskroom/cask/brew-cask

apps=(
  'adium' 'airfoil' 'alfred' 'caffeine' 'dropbox' 'firefox' 'flux'
  'google-chrome' 'iterm2' 'keepassx' 'path-finder' 'sizeup' 'slack' 'spotify'
)

set -e
for app in "${apps[@]}"
do
  echo "Installing $app"
  brew cask install $app --force
done

