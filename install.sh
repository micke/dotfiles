#!/usr/bin/env sh

set -e

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap thoughtbot/formulae
brew install rcm
rcup
