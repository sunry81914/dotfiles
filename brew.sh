#!/bin/sh

# Homebrew - The missing package manager for OS X
# http://brew.sh/
if ! command -v brew > /dev/null; then
    echo "=> Installing homebrew ..."
    echo "=> "
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew analytics off
    export HOMEBREW_NO_INSECURE_REDIRECT=1
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "=> homebrew exists, updating ..."
    echo "=> "
    brew update
    brew upgrade
fi
echo ""
brew bundle -v
brew cleanup
