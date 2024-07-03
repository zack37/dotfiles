#!/usr/bin/env bash

set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git stow gpg antigen
brew link git gpg

cd dots
stow -t ~ .

brew bundle install --global
