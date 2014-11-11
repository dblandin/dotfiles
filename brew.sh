#!/bin/bash

which -s brew
if [[ $? != 0 ]] ; then
  echo "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
fi

echo "Updating Homebrew"
brew update

echo "Installing packages..."

packages=(
  'ag' 'tmux' 'reattach-to-user-namespace' 'vim --override-system-vi' 'rbenv'
  'rbenv-gem-rehash' 'ruby-build'
)

set -e
for package in "${packages[@]}"
do
  echo "Installing $package"
  brew install $package --force
done
