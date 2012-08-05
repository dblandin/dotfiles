#!/bin/bash
# simple script for symlinking dotfiles to home directory
# moves existing dotfiles to backup directory

# set dotfile directory
DIR=~/code/dotfiles

# make dotfile backup directory
mkdir -p ~/dotfiles_old

# move to dotfile directory
cd $DIR

# for each file or directory, move existing file or directory
# to dotfile backup directory, prepend dot to file or directory
# and symlink to home directory
for i in *
do
    mv ~/.$i ~/dotfiles_old/
    ln -s $DIR/$i ~/.$i
done

# remove symlink for this script
rm ~/.make.sh
