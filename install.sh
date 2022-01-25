#!/usr/bin/env sh

set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap thoughtbot/formulae
brew install rcm
rcup
