if [ ! -d ~/.oh-my-zsh ]
then
    echo "=> Installing oh-my-zsh ..."
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

if [ -d "$HOME/.dotfiles" ]; then
    echo "=> dotfiles is already installed in $HOME/.dotfiles, trying to update"
    echo -ne "\r=> "
    cd $HOME/.dotfiles && git pull
else
    echo "=> clone dotfiles from Github..."
    git clone https://github.com/hankwang/dotfiles.git $HOME/.dotfiles
    cd $HOME/.dotfiles
fi
echo -ne "\r"

# Homebrew - The missing package manager for OS X
# http://brew.sh/
if ! type brew > /dev/null; then
    echo "=> Installing homebrew ..."
    echo -ne "\r=> "
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
else
    echo "=> homebrew exists, updating ..."
    echo -ne "\r=> "
    brew update
fi
echo -ne "\r"

# CocoaPods is the dependency manager for Objective-C projects
# http://cocoapods.org/
if ! type pod > /dev/null; then
    echo "=> Installing cocoapods ..."
    echo -ne "\r=> "
    sudo gem install cocoapods
else
    echo "=> cocoapods exists, updating ..."
    echo -ne "\r=> "
    sudo gem install cocoapods
fi
echo -ne "\r"

$HOME/.dotfiles/script/bootstrap
