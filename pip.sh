#!/bin/sh
alias pip=pip2
# install python packages
echo "=> Installing python packages... "
echo -ne "\r=> "
pip install -q --upgrade pip setuptools
pip install -qr "`pwd`/requirements.txt"
