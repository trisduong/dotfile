#!/bin/sh

echo "Cloning repositories..."

CODE=$HOME/Code
WORK=$CODE/work
TEST=$WORK/Test

# Sites
git clone -b macos git@github.com:trisduong/dotfiles.git $HOME/.dotfiles
